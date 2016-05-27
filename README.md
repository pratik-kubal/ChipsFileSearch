# ChipsFileSearch

1.1 Introduction

Network Lab (NPL) Project on LAN file search Program using SSH 

It contains 2 modules:
    1. Local search module(search.sh)
    
    2. Main ssh connection Module(main.sh)

gen.sh is the UI where one can either search a file on their local computer or on their lan.

The Program works by making a ssh connection & running the local search module on the host pc.

1.2 Requirements:
Both the host & the client should have a copy of the program.

1.3 Installation:

1.3.1 Necessary Initial Configuration
Before running the program you need to reconfigure BASH by

        sudo dpkg-reconfigure dash

And when you get the option select "no" to actually use bash instead of dash 

1.3.2 Optional Passwordless Search---(http://www.linuxproblem.org/art_9.html)

1. Master

Gen Key without passphrase
        ssh-keygen -t rsa
save it in default dir

2. Slaves
Now use ssh to create a directory ~/.ssh as user b on B. (The directory may already exist, which is fine):
        ssh b@B mkdir -p .ssh

3. Finally append a's new public key to b@B:.ssh/authorized_keys and enter b's password one last time:
        cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'

1.4 File Info

main.sh		-> shell
search.sh	-> local search
gen.sh		-> Genral file with option to select
search.log	-> log file of search matches
