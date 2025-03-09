#!/bin/bash

# Verify the number of arguments passed to the script.
if [ $# -eq 2 ]
    then
    # File path where string will be written.
    writefile=$1
    # String to be written in a file.
    writestr=$2
    
    # Extract the directory path from a file path.
    dir_path=$(dirname $writefile)
    # Create a directory structure up to the file path
    mkdir -p ${dir_path}
    echo ${writestr} > ${writefile}
    if [ $? -eq 0 ]
    then
        # File has been written, return with success.
        exit 0
    else
        # File can not be created, return with error.
        exit 1
    fi
    
else
    echo "Invalid Number of Arguments."
    echo "Error: $# arguments are passed."
    echo "02 arguments are required as input to the script. e.g."
    echo "./writer.sh /file/path string_to_be_written"
    
    # Return with an error.
    exit 1
fi