# debian-ssh-git
debian + openssh + git for CI


## usage

- copy the private key to `/root/.ssh/id_rsa`
- add your server public key to `/root/.ssh/known_hosts` (you can run `ssh-keyscan <SERVER>`, 
  verify the signature and add the key to the file)

 