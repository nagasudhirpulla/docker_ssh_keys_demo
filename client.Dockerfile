FROM ubuntu:latest

# Install SSH client
RUN apt-get update && apt-get install -y openssh-client

# Create .ssh directory
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

# Add SSH keys
COPY keys/id_rsa /root/.ssh/id_rsa
COPY keys/id_rsa.pub /root/.ssh/id_rsa.pub

# Set proper permissions for SSH keys
RUN chmod 600 /root/.ssh/id_rsa && \
    chmod 644 /root/.ssh/id_rsa.pub

# Generate known_hosts file if needed
# RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Your additional setup commands here
# ...

CMD ["/bin/bash"]