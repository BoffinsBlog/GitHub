#!/bin/bash

function done_no_sleep {

    # Done
    echo -e "\e[32mDone\e[0m";
    echo "";

}

function nuke_GitHub {

    # Variables
    bash_Rerun="/home/foo/some/path/nuke_github.sh";

    # Start by clearing the Terminal window
    clear;
    echo "";

    # Switch GitHub account
    echo -e "\e[1;33mSwitch GitHub account...\e[0m";
    gh auth switch --user $github_Account

    done_no_sleep;

    # Define an array for all the repo names
    echo -e "\e[1;33mDefine an array for all the repo names...\e[0m";
    declare -a github_URLs;

    done_no_sleep;

    # Create a txt file of the remote repo names
    echo -e "\e[1;33mCreate a txt file of the remote repo names...\e[0m";
    gh repo list $github_Account --json name --jq ".[].name" > ~/repos.txt;

    done_no_sleep;

    # Import the txt file into the array
    echo -e "\e[1;33mImport the txt file into the array...\e[0m";
    readarray -t github_URLs < ~/repos.txt;

    done_no_sleep;

    # Loop through the array of repo names
    echo -e "\e[1;36mLoop through the array of repo names...\e[0m";
    local -n arr=$1;

        for i in "${arr[@]}";
        do

            # Remove the remote repo
            echo -e "\e[1;33m  - Remove the remote $i repo...\e[0m";
            gh repo delete $i --yes;

            # Removed
            echo -e "\e[32m  - $i removed\033[0m";
            echo "";

        done

    # Looping done
    echo -e "\e[1;36mLooping done\e[0m";
    echo "";

    # Tidy up
    echo -e "\e[1;33mTidy up...\e[0m";
    rm ~/repos.txt;

    done_no_sleep;

    # Nuked
    echo -e "\e[32;1m$github_URL nuked\033[0m";
    echo "";

    # Finish, pause for input then re-run the nuke script
    read -rsn1 -p"Press any key to continue";echo;
    bash $bash_Rerun;

}

# Start by clearing the Terminal window
clear;

echo "";
echo -e "\e[1;36mUse \e[1;31mCtrl-c to Exit\e[1;36m and close the window...\e[0m";
echo "";
echo -e "\e[1;34mThis will:\e[0m";
echo -e "     Start by clearing the Terminal window\e[0m";
echo -e "     Switch GitHub account\e[0m";
echo -e "     Define an array for all the repo names\e[0m";
echo -e "     Create a txt file of the remote repo names\e[0m";
echo -e "     Import the txt file into the array\e[0m";
echo -e "     Loop through the array of repo names\e[0m";
echo -e "       - Remove the remote repo\e[0m";
echo -e "     Tidy up\e[0m";
echo -e "     Finish, pause for input then re-run the nuke script\e[0m";
echo "";

# Loop
while true; do
    options=("github.account1" "github.account2");

    echo "Choose an option:";
    select opt in "${options[@]}"; do
        case $REPLY in
            1)
                # github.account1 paths
                github_Account="Account_1";
                github_URL="github.account1";
                    nuke_GitHub github_URLs;
                    break ;;
            2)
                # github.account2 paths
                github_Account="Account_2";
                github_URL="github.account2";
                    nuke_GitHub github_URLs;
                    break ;;

            *) echo "Whoops, choose again, option $REPLY is invalid..." >&2;
        esac
    done

done

