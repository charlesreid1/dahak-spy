#!/usr/bin/env python
import getpass
import subprocess


def install_pyenv():
    user = getpass.getuser()
    if(user=="root"):
        raise Exception("You are root - you should run this script as a normal user.")
    else:
        # Install pyenv 
        wgetproc = subprocess.Popen(["wget","-qO-","https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer"], stdout=subprocess.PIPE)
        bashproc = subprocess.Popen(["/bin/bash"], stdin=wgetproc.stdout, stdout=subprocess.PIPE)

        # We don't need to add ~/.pyenv/bin to $PATH,
        # it is already done.


if __name__=="__main__":
    install_pyenv()

