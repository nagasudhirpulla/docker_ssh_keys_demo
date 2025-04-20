# ssh-server/Dockerfile
FROM ubuntu:latest

# Install OpenSSH server and essential packages
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir -p /var/run/sshd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create user
RUN useradd -m -s /bin/bash -G sudo adam && \
    echo "adam:pwd123" | chpasswd

# Configure SSH for the user
RUN mkdir -p /home/adam/.ssh && \
    chmod 700 /home/adam/.ssh

# Copy public key
COPY id_rsa.pub /home/adam/.ssh/authorized_keys

# Set correct permissions
RUN chmod 600 /home/adam/.ssh/authorized_keys && \
    chown -R adam:adam /home/adam/.ssh

# SSH configuration - enable public key auth and disable password auth
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]