#!/bin/bash

# Change directory to 'src'
cd ../src

# Iterate over each folder in the current directory
for folder in */ ; do
    echo "Entering $folder"
    cd "$folder"

    # Check if the directory is a git repository
    if [ -d ".git" ]; then
        # Perform git pull
        echo "Pulling changes in $folder"
        git pull
    else
        echo "$folder is not a git repository."
    fi

    # Go back to the parent directory
    cd ..
done

echo "Done pulling changes in all git repositories inside src/"

