#!/bin/bash
# Actualizar los paquetes del sistema 
echo "Actualizando los paquetes del sistema..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Instalar AWS CLI
echo "Instalando AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
unzip awscliv2.zip
sudo ./aws/install

# Verificar la instalación de AWS CLI
aws --version

# Instalar Docker
echo "Instalando Docker..."
sudo apt-get install -y docker.io
sudo usermod -aG docker $USER 
newgrp docker
sudo chmod 777 /var/run/docker.sock
which docker

# Verificar la versión de Docker
docker --version

# Instalar kubectl
sudo apt update
sudo apt install curl -y
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
which kubectl

# Verificar la versión de kubectl
kubectl version --client

# Instalar eksctl
echo "Instalando eksctl..."
sudo apt update
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Verificar la versión de eksctl
eksctl version

echo "Todas las herramientas se han instalado correctamente."

# Reiniciar la instancia para aplicar cambios de grupo
echo "Reiniciando la instancia para aplicar los cambios de grupo..."
sudo reboot
