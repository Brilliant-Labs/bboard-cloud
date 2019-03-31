# thingspeak
Thingspeak Docker Container Server



# Server Access Guide


### Copy your SSH key.
#### On Windows, open Powershell. On Linux/Mac, open terminal.

Generate a SSH key if you dont already have one.
```
   $ ssh-keygen
```
Fill out the information.

Copy your ssh key to your clipboard. (The name 'id_rsa' may have changed if you gave it a different name during ssh-keygen).
```
$ cat .ssh/id_rsa.pub | pbcopy
```
```
ssh-rsa AAAAB3NzaC1yc2EAAAA02938fh03298fh02398fh02139fh8012983hf9PTytz6BRZwouHIMpljwabuxMmSXWzHOo6gUVJGFpGRFm3gSdbEFP46eOy+NQ/nBn9TkZj2M5z87BXgCKrbYwrQJahaOc9cozNwGucewcewc90ewc9w0e9ct1twdE7hn6r6ZsPK+iscdhD80UxTMa5ZyvxRncrcNYcFn/mMD5MTG8V90qYgJyxE3kpOZHKrZzqfvRmqmbKp45bdYPDRNxQTpFs6OBOHGN24WLyCvYf2qEvHd4NAcweicnpewicnpewicpwecnwe john@smith
```

You can also use Putty to generate an SSH key. A guide for doing so can be found here:
https://www.ssh.com/ssh/putty/windows/puttygen.

### Logging into the Cloud A Dashboard.
Go to Clouda.ca.

Click on Client Sign in and log in.

Click on Dashboard. Select Halifax Server.

Click on the Server dropdown menu and Click on the Access and Security button.

Click on the keypairs tab.

Click on Import Keypair.

**Paste the SSH key from the previous step.**

### SSH onto the server.
In the Powershell terminal or Mac/Linux Terminal:
```
$ ssh ubuntu@204.13.51.124
```

If you want to ssh using Putty, you can look at this guide to do so:
https://mediatemple.net/community/products/dv/204404604/using-ssh-in-putty-

During the first time you connect to the server threw SSH, you will be asked to add the server to the list of known_host.
```
The authenticity of host '204.13.51.124 (204.13.51.124)' can't be established.
ECDSA key fingerprint is SHA256:0d782gh10d2873h02d87h203870dh278d23d2.
Are you sure you want to continue connecting (yes/no)?
```
At this point you should be connected and you should see the server's shell:
```
ubuntu@thingspeak:~$
```