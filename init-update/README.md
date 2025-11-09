## Files to interact with a git repository

## Introduction:

The scripts loop through an array of directory names which match the git repository names

## Files:

These two scripts will:

- Remove the old local repo

- Create the new local repo

- Update the local config file

- Remove the remote repo

- Create the remote repo

- Push the local files to the remote repo with an initial commit

### [git_init_update_everything.sh](https://github.com/BoffinsBlog/GitHub/blob/main/init-update/git_init_update_everything.sh)

The script to initialise everything i.e. remove all of the local commit history and 'Push' everything to the remote GitHub repository

Execute with bash:

`bash git_init_update_everything.sh`

To see the coloured prompts

### [git_init_update_selected.sh](https://github.com/BoffinsBlog/GitHub/blob/main/init-update/git_init_update_selected.sh)

Same as above but with a selection of repositories

Execute with bash:

`bash git_init_update_selected.sh`

To see the coloured prompts

## The 'update' Files:

### [git_update_everything.sh](https://github.com/BoffinsBlog/GitHub/blob/main/init-update/git_update_everything.sh)

The script to update everything i.e. synchronise all of the local files with the remote GitHub repository

Execute with bash:

`bash git_update_everything.sh`

To see the coloured prompts

### [git_update_selected.sh](https://github.com/BoffinsBlog/GitHub/blob/main/init-update/git_update_selected.sh)

Same as above but with a selection of repositories

Execute with bash:

`bash git_update_selected.sh`

To see the coloured prompts

## Blog:

<https://boffinsblog.github.io/posts/git-is-not-github/>
