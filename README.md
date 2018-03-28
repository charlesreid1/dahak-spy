# dahak-spy 

The dahak-spy repo contains files for setting up a node for monitoring and logging
data from nodes working on dahak workflows.

## Services

dahak spy runs most of its services through Docker
(some stock, some using custom Dockerfiles).
It runs:
* databases (prometheus, mongodb, mongoexpress)
* monitoring (netdata)
* dashboards (grafana)
* messaging (zmq)

See [docker/README.md](/docker/README.md) for more info on the 
services that are running in containers.

## Cloud Deployment

To deploy these scripts to a cloud node, use the cloud init 
functionality of Ubuntu and upload the cloud init script

## By Hand Deployment

Installing by hand is a three-step process:
* Install git
* Run sudo init script
* Run user init script

### Step 1: Install Git

To install git:

```
apt-get update && apt-get install -y git
```

Now you can check out a copy of the repo:

```
git clone https://github.com/charlesreid1/dahak-spy.git
cd dahak-spy/
```

### Step 2: Run Sudo Init Script

To run the sudo init script, which calls several other scripts, run:

```
# as the sudo user:
$PWD/sudo_init/sudo_init.sh
```

### Step 3: Run User Init Script

To run the user init script, run:

```
# as the regular dahak user, 
$PWD/sudo_init/sudo_init.sh

# or if you are still sudo,
sudo -H -i -u dahak $PWD/sudo_init/sudo_init.sh
```

## Using the Dotfiles

The dotfiles are installed for the regular user on  the spy node.
These dotfiles make it easy to define an environment, either for 
all users (by changing the dotfiles in the repo) or for an individual
user (using site-specific dotfiles).

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


## Screenshots

Netdata running on a beefy node @ 10.11.0.194:

![dahak-yeti netdata instance](https://i.imgur.com/DGMdAZz.png)

Netdata running on dahak-spy @ 10.11.0.192 (spy monitors itself and other nodes):

![dahak-spy netdata instance](https://i.imgur.com/ECoGLFN.png)


