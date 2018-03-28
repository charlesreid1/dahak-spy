#!/usr/bin/env python
import getpass
import tempfile
import subprocess


def install_pyenv():
    user = getpass.getuser()
    if(user=="root"):
        raise Exception("You are root - you should run this script as a normal user.")
    else:
        # Install snakemake
        conda_version = "miniconda3-4.3.30"

        # ensure this conda is installed
        installcmd = ["pyenv","install",conda_version]
        subprocess.call(installcmd)
        
        # ensure this conda is the global conda
        globalcmd = ["pyenv","global",conda_version]
        subprocess.call(globalcmd)

        initcmd = subprocess.Popen(["pyenv","init","-"], stdout=subprocess.PIPE)
        bashproc = subprocess.Popen(["/bin/bash"], stdin=initcmd.stdout, stdout=subprocess.PIPE)

        # ---------------------------
        # Install snakemake

        pyenvbin = os.environ['HOME']
        condabin = pyenvbin+"/.pyenv/shims/conda"

        subprocess.call([condabin,"update"])

        subprocess.call([condabin,"config","--all","channels","r"])
        subprocess.call([condabin,"config","--all","channels","default"])
        subprocess.call([condabin,"config","--all","channels","conda-forge"])
        subprocess.call([condabin,"config","--all","channels","bioconda"])

        subprocess.call([condabin,"install","--yes","-c","bioconda","snakemake"])

        # ---------------------------
        # Install osf cli client
        
        pyenvbin = os.environ['HOME']
        pipbin = pyenvbin+"/.pyenv/shims/pip"

        subprocess.call([pipbin,"install","--upgrade","pip"])
        subprocess.call([pipbin,"install","--user","osfclient"])



if __name__=="__main__":
    install_pyenv()

