#!/bin/bash

# Variables
repo_Root=/home/foo/path/to/repos
github_URL=<SSH_KEY_NAME>:<GITHUB_ACCOUNT>

clear

# Push everything to GitHub
echo '';
echo -e '\e[1;34mPush everything to GitHub...\e[0m';
echo '';

function updateGit {
    local -n arr=$1

    for i in "${arr[@]}"
    do

    # Update the remote git repo
    echo -e '\e[1;33mUpdate the remote' $i 'git repo...\e[0m'

    cd $repo_Root/$i/
    git add .
    git commit -m 'Modified' .;
    git push -u origin main;

    # Done
    echo -e '\e[1;32m'$i 'done\e[0m'
    echo ''

    done
}

# Define the array of all the directory names
declare -a repo_Dirs

repo_Dirs=(
    "Arduino"
    "Calckey"
    "Enviro-pHAT"
    )

# Loop
updateGit repo_Dirs

# Everything done
echo -e '\e[1;34mEverything done\e[0m';

