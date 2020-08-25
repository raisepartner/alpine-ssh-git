# alpine-ssh-git
alpine + openssh + git for CI

also includes: curl, kustomize

## usage

- copy the private key to `/root/.ssh/id_rsa`
- add your server public key to `/root/.ssh/known_hosts` (you can run `ssh-keyscan <SERVER>`, 
  verify the signature and add the key to the file)

 
