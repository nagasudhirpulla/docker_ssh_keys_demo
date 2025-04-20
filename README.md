* This project contains 2 ubuntu containers
* The public and private keys present in "keys" folder will be used in the client container out of the box
* The server container will allow the public key in the "keys" folder out of the box
* Run the setup using `docker-compose -f ssh-demo.yaml up -d --build`

## Create ssh keys
* Public and private RSA keys can be generated using the command `ssh-keygen -t rsa`
