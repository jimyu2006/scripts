#!/bin/bash
tempdir="_temp"
targetZip="NIB-all.wlapp"

check_arg() {
	if [ $2 == ""] ; then
		read -p "Please provide the latest version number and story number, i.e. 10.3 600:" version	story
	else
		$version=$1
	fi
}

check_arg

if [ -d "$tempdir" ]; then
	cd $tempdir
	rm -f *.*
	cd ..	
else
	mkdir $tempdir
fi

if [ -f "$targetZip" ]; then	
	unzip -o $targetZip *-$version.* NIB-desktopbrowser*.* -d $tempdir	
	cd $tempdir
	7z a $targetZip *.wlapp	
	scp $targetZip m787757@m787757.steak.wone.westpac.co.nz:/tmp/all-WONE-SQNOR-${story}.wlapp
else
	echo 'not find'
fi

