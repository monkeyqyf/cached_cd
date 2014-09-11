# cache for recent dirtories, begin
dir_list=~/.cd_history;
dir_list_size=40; 
cached_cd() {
	if [ "$1" == '--' ]; then
		ordered_dir_list=$( cat -n "$dir_list" 2>/dev/null|tac )
		echo " Index	Directory"
		echo "$ordered_dir_list"
		read -p "Input an index number to jump into one directory: " index 
		line=$(echo "$ordered_dir_list"| grep "^[ ]*$index	")
		if [ "$?" == 0 ]; then
			cached_cd $(echo "$line" | cut -f2)
		fi 
	elif cd "$@"; then 
		dir_list_tmp=$( cat "$dir_list"  2>/dev/null | grep -v "^${PWD}$") 
		echo -e "${PWD}\n${dir_list_tmp}" | grep -v "^$" | head -n ${dir_list_size} > $dir_list 
	else 
		# If original cd doesn't hit the target directory, the entry in dir_list should be deleted.
		# Otherwise, if cached_cd to a deleted directory, it will grep the entry in dir_list 
		# then cached_cd again, then get into endless loop.
		sed -i "\#^${@}\$#d" $dir_list 
		if grep "/$@$" $dir_list -q; then 
			# Exact match
			matched_list=$(grep "/$@$" $dir_list 2>/dev/null )
		elif grep "[^/]*$@[^/]*$" $dir_list -i -q; then 
			# Un-exact match
			matched_list=$(grep "[^/]*$@[^/]*$" $dir_list -i 2>/dev/null )
		else
			return 1;
		fi

		matched_count=$(echo "$matched_list" | wc -l) 
		if [ $matched_count -gt 1 ]; then 
			echo " Index	Directory"
			numbered_list=$(echo "$matched_list" | cat -n | tac )
			echo "$numbered_list"
			read -p "Input an index number to jump into one directory: " index 
			target_dir=$(echo "$numbered_list"| grep "^[ ]*$index	" | cut -f2)
			[ -n "$target_dir" ] &&  cached_cd $target_dir
		elif [ $matched_count -eq 1 ]; then 
			cached_cd $matched_list
		fi 

		[ $? -eq '0' ] && echo "Get into a recent accessed directory, $PWD."
	fi 
}
alias cd='cached_cd' 
# cache for recent dirtories, end
