#!/bin/bash

# Ensure the script is run as root
if [ "$(whoami)" != "root" ]; then
  echo "Please run this script with sudo:"
  echo "sudo $0"
  exit
fi

# Update and Upgrade the System
echo "Updating and upgrading the system..."
apt update && apt upgrade -y

# Install software properties common (if not already installed)
apt install software-properties-common -y

# Add the ROS 2 repository to your system
echo "Adding the ROS 2 repository..."
apt update && apt install curl gnupg lsb-release -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 Humble
echo "Installing ROS 2 Humble..."
apt update
apt install ros-humble-desktop ros-dev-tools -y

# Environment setup
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install argcomplete for command-line autocomplete (optional)
apt install python3-pip -y
pip3 install -U argcomplete

# Initialize rosdep
echo "Initializing rosdep..."
apt install python3-rosdep2 -y
rosdep init
rosdep update

echo "ROS 2 Humble installation is complete!"

# End of the script

