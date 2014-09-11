cached_cd
=========

An alias of oridnary cd to enhance it with cache

----------------------------------------------------
How to install it:
Just paste these code into your ~/.bashrc

----------------------------------------------------
Why I publish it:
It is published to require for comments and bug fix. I hope this cached_cd could be imporved with better script skills, simpler code and efficient logic. Thanks in advance.

----------------------------------------------------
License:
All up to you, only if you take your own risk if any. And it will be appreciated that yann.a.qiu@alcatel-lucent.com or qiuyangfan@gmail.com is preserved. You could also add your name if you like.

----------------------------------------------------
How it works:

A. It won't impact the ordinary cd behavior

B. It could cache the recent accessed directoriesy into ~/.cd_history. In maximum, dir_list_size entries will be cached. Input "cd --" to list these entries, then input the index to chose one. It will adjust the latest directory to the No.1 entry

myname@My_Debian7:~
$ cd --
 Index	Directory
     1	/media/sf_share_folder/sandbox
Input an index number to jump into one directory: 1
myname@My_Debian7:/media/sf_share_folder/sandbox
$ cd /media/sf_share_folder 
myname@My_Debian7:/media/sf_share_folder
$ cd --
 Index	Directory
     2	/media/sf_share_folder/sandbox
     1	/media/sf_share_folder
Input an index number to jump into one directory: q 
myname@My_Debian7:/media/sf_share_folder
$ cd /media/sf_share_folder/sandbox 
myname@My_Debian7:/media/sf_share_folder/sandbox
$ cd --
 Index	Directory
     2	/media/sf_share_folder
     1	/media/sf_share_folder/sandbox

C. Your could input a substring, cached_cd will grep to find a matching one then get into it.
myname@My_Debian7:/media/sf_share_folder/sandbox
$ cd folder
bash: cd: folder: No such file or directory
Get into a recent accessed directory, /media/sf_share_folder.
myname@My_Debian7:/media/sf_share_folder
----------------------------------------------------
