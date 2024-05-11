#!/bin/bash

additem()
{
read -p " enter the path for the file/directory: " dir
read -p " enter the filename/directoryname: " name
read -p " enter the itemtype dir/file: " itemtype
if [ $itemtype == file ]; then
	read -p " enter the file extention: " ext
	touch $dir/$name.$ext
	echo " file created successfully in the path $dir "
elif [ $itemtype == dir ]; then
	mkdir -p $dir/$name
	echo " the directory $name has created in $dir"
else
	echo " item type is invalid "
fi
}







modifyitem () 
{
	read -p " what item you want to rename file/directory: " item
	if [ $item == file ]; then
read -p " enter the directory path where the file exist: " dirpath
read -p " enter the full path for the file: " filepath
read -p " enter the new name for the file: " newname
read -p " are you sure you want to rename the file $filepath please enter y/n: " action
          if [ $action == y ]; then
	   mv $filepath "$dirpath/$newname"
	    echo " the file renamed with the name $newname"
                fi
                       elif [ $item == directory ]; then
	                 read -p " enter the directory path: " dirpath
	                  read -p " enter the full path for the directory (with the directory old name): " oldname
                           read -p " enter the new name for the directory: " newname
  	                     read -p " are you sure you want to rename the directory $oldname please enter y/n: " action
	                  if [ $action == y ]; then
		mv $oldname "$dirpath/$newname"
		echo " the directory renamed with the name $newname"
	               fi
else 
		       echo " itemtype is invalid "
fi

}




deleteitem () 
{
read -p " what item type you want to delete directory/file: " itemtype
if [ $itemtype == file ]; then
	read -p " enter the full path for the file: " file
	read -p " are you sure you want to delete the file $file ?  please enter y/n: " action
                          if [ $action == y ]; then
				  rm $file
			  fi

		  elif [ $itemtype == directory ]; then
			  read -p " enter the full path for the directory: " dir
			  read -p " are you sure you want to delete the directory $dir ? please enter y/n: " action
                          if [ $action == y ]; then
			  rm -r $dir
			  fi
else 
	echo " itemtype is invalid"
fi

}








PS3="what change you want to make?: "

select lng in "Add Item" "Modify Item Name" "Delete Item" "Quit"
do
    case $lng in
        "Add Item")
            additem;;
        "Modify Item Name")
           modifyitem;;
        "Delete Item")
           deleteitem;;
        "Quit")
           echo "you choose quit"
           break;;
        *)
           echo "invalid choise";;
    esac
done
