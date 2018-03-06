# This is the bash profile.
# 
# This file sets PATH and bash options.
#
# to add your own non-committed machine-specific settings,
# use ~/.extras

# Must
EDITOR="vim"

# Set $PATH here
export PATH="${HOME}/.pyenv/bin:$PATH"




# Python:
# Try not to have to deal with PYTHONPATH...

# Go
#export PATH="${HOME}/.local/bin:${PATH}"




# Bash history

HISTFILE="$HOME/.bash_history"
HISTFILESIZE=1000000000
HISTIGNORE="ls:cls:clc:clear:pwd:l:ll:[ \t]*"
HISTSIZE=1000000
HISTTIMEFORMAT=': %Y-%m-%d_%H:%M:%S; '

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Save Bash history 
shopt -s cmdhist;




#############################
# modified mathias

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extras can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extras}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;


# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

