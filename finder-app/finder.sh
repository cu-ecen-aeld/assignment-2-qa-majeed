#!/bin/bash

if [ $# -eq 2 ]
then
    # Process the Arguments passed to the script.
    # Directory to be searched.
    filesdir=$1
    # Srting to be searched in directory files.
    searchstr=$2
    # Verify the first argment is the path of a directory
    if [ -d ${filesdir} ]
    then
        # Store the number of files in the directory and its sub-directories.
        files_count=$( find ${filesdir} -type f | wc -l )
        # Store the string match count in the files
        string_count=$( grep -r ${searchstr} ${filesdir} | wc -l )
        # echo "The number of files are ${files_count} and the number of matching lines are ${string_count}"
        echo "The number of files are ${files_count} and the number of matching lines are ${string_count}"
        # Exit with a success.
        exit 0
    else
        echo "Error: ${filesdir} is not a path to a directory."
        echo "INVALID_ARGUMENT_PASS"
        exit 1
    fi
else
    echo "INVALID Number of Arguments."
    echo "Error: 02 arguments are required as input to the script. e.g."
    echo "./finder.sh /directory/path string_to_be_searched"
    # Return with error
    exit 1
    
fi