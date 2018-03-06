# dahak-spy dotfiles

These dotfiles will give you a nice blue prompt.

![Screen shot after installing](/screen.png)

## Installing Dotfiles and Scripts

Installing the dotfiles and scripts is a three step process that only requires git.

### Before You Begin

If `which git` returns nothing, you'll need to install it: `apt-get install git`

Make sure you set a password for the `ubuntu` user:

```
sudo passwd ubuntu
```

### Step 1: Deploy Repo

Start by deploying the repo on the AWS node:

```
git clone https://github.com/charlesreid1/dahak-spy.git
cd dahak-spy/dotfiles/
```

### Step 2: Pre-Bootstrap

Run the pre-bootstrap script to make sure necessaries are in place:

```
$ ./pre-bootstrap.sh
```

### Step 3: Bootstrap

Install the dotfiles (answer `y` when prompted):

```
$ ./bootstrap.sh
From https://github.com/charlesreid1/dahak-spy.git
 * branch            master     -> FETCH_HEAD
Already up-to-date.
This may overwrite existing files in your home directory. Are you sure? (y/n)  y
```

### Step 4: Do the Hokey Pokey

Log out and log back in.

### Step 5: Install Packages

Install a list of essentials from aptitude:

```
$ ./install_packages.sh
```

## Using

The `$PATH` is set in `.bash_profile`

The prompt is set in `.bash_prompt`

The aliases are set in `.aliases`

To set your own aliases, source your own dotfiles, or otherwise
insert steps into the dotfiles initialization process, use 
the `~/.extras` file.

To set your git credentials, add the following to the `~/.extras` file:

```
# Git credentials
# Not in the repository
# This prevents people from using incorrect github credentials
GIT_AUTHOR_NAME="<<< your name here >>>"
GIT_AUTHOR_EMAIL="<<< your email here >>>"

GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

