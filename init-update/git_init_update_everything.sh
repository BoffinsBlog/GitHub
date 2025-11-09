#!/bin/bash

# Variables
repo_Root=/home/foo/path/to/repos
github_URL=<SSH_KEY_NAME>:<GITHUB_ACCOUNT>

clear

# Re-initialise and Push everything to GitHub
echo -e '\e[1;33mRe-initialise and Push everything to GitHub...\e[0m';
echo '';

function initGit {
    local -n arr=$1

    for i in "${arr[@]}"
    do

    # Initialise the local git repo
    echo -e '\e[1;36mInitialise the local' $i 'git repo...\e[0m';

        # Remove the old local repo
        echo -e '\e[32mRemove the old' $i 'local repo...\e[0m';
        cd $repo_Root/$i/;
        sudo rm -R .git;

        # Create the new local repo
        echo -e '\e[32mCreate the new' $i 'local repo...\e[0m';
        git init;

        # Update the local config file
        echo -e '\e[32mUpdate the local' $i 'config file...\e[0m';
        echo '[remote "origin"]' >>  .git/config;
        echo '    url = '$github_URL'/'$i'.git' >>  .git/config;

    # Done
    echo -e '\e[1;36m'$i 'done\e[0m';
    echo '';

    # Recreate the remote git repo
    echo -e '\e[1;36mRecreate the remote' $i 'git repo...\e[0m';

        # Remove the remote repo
        echo -e '\e[32mRemove the remote' $i 'repo...\e[0m';
        gh repo delete $i --yes

        # Create the remote repo
        echo -e '\e[32mCreate the remote' $i 'repo...\e[0m';
        gh repo create $i --public

    # Done
    echo -e '\e[1;36m'$i 'done\e[0m';
    echo '';

    # Push the local repo
    echo -e '\e[1;36mPush the local' $i 'git repo...\e[0m';

        # Push the local files to the remote repo with an initial commit
        echo -e '\e[32mPush the local' $i 'files to the remote repo with an initial commit...\e[0m';
        git add .;
        git commit -m "Initial Commit";
        git push -f origin main;

    # Done
    echo -e '\e[1;36m'$i 'done\e[0m';
    echo '';

    done
}

# Define the array of all the directory names
declare -a repo_Dirs

for repo_Dir in $repo_Root/*/; do
    dir_path=$repo_Dir
    dir_name=$(basename $dir_path)
    repo_Dirs+=("$dir_name")
done

# Loop
initGit repo_Dirs

# Everything done
echo -e '\e[1;33mEverything done\e[0m';
echo '';

