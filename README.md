* This project contains 2 ubuntu containers
* Keep the public and private keys in a folder named 'keys'. These will will be used in the client container out of the box
* The server container will allow the public key in the "keys" folder out of the box
* Run the setup using `docker compose -f 'ssh_demo.yml' up -d --build` . `-d` means detached mode, `--build` means build the required container images even if they are already present. You can also use `--force-recreate` to recreate containers if they are already present

## Create ssh keys
* Public and private RSA keys can be generated using the command `ssh-keygen -t rsa`

## Tools
* Use docker desktop for easy container interactions
* Use Docker and Docker DX VS code extensions for docker desktop like experience in VS code itself