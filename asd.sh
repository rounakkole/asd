##!/bin/bash

read -p 'enter filename: ' FileName;

for file in `ls $FileName.*`;
	do

	RunName=`echo $file | awk -F. '{print $1}'`;
	Extension=`echo $file | awk -F. '{print $2}'`;

	if [ $Extension == c ]
		then
		gcc $file -o RunName;
		./$RunName;

	elif [ $Extension == cpp ]
		then
		g++ $file -o RunName;
		./$RunName;

	elif [ $Extension == java ]
		then
		javac $file;
		java $RunName;
	fi

done

read -p 'press enter...... ' console;