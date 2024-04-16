#!/bin/bash

# requirements: 
# need to have python3 installed (tested with 3.10) 

# Stop script on any error
set -e

# Update and upgrade existing packages
sudo apt update && sudo apt upgrade -y

# Install software properties common, if not already installed
sudo apt install software-properties-common -y

# Add the Deadsnakes PPA for newer Python versions
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update

# Install Python 3.12
sudo apt install python3.12 -y

# Check if Python 3.12 is installed successfully
python3.12 --version

# Ask user if they want to install Python 3.12 as an alternative for python3
read -p "Do you want to install Python 3.12 as an alternative for python3? [Y/N] " response
if [[ "$response" =~ ^[Yy]$ ]]
then
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 2
else
    echo "Skipping setting Python 3.12 as an alternative for python3."
fi

# Ask user if they want to configure Python 3.12 as the default version
read -p "Do you want to select Python 3.12 as the default for python3? [Y/N] " response
if [[ "$response" =~ ^[Yy]$ ]]
then
    echo "Select Python 3.12 for python3 when prompted:"
    sudo update-alternatives --config python3
else
    echo "Skipping configuration of Python 3.12 as default."
fi

# Final verification
echo "Current default Python version (python3):"
python3 --version

# build with the following 
# chmod +x install_python3_12.sh
