#!/bin/bash

# This script will run a Linux executable as daemon.

# Set the executable you want to run
#echo $pwd
#app = /home/vijay/Desktop/app
current_dir=$(pwd)
app="$current_dir/Twitter_main"
# Check if the executable file exists
if [ ! -f "$app" ]; then
	echo "Error: app file does not exist."
	exit 1
fi

# Check if the executable file is executable
if [ ! -x "$app" ]; then
	echo "Error: Executable file is not executable."
	exit 1
fi

# Check if the executable is already running
if pgrep -f "$app" > /dev/null; then
	echo "Error: Executable is already running."
	exit 1
fi

# Run the executable as a daemon
nohup "$app" &> /dev/null &

# Check if the executable is now running

if pgrep -f "$app" > /dev/null; then
	echo "Success: Executable is running as a daemon."
	exit 0
else
	echo "Error: Executable failed to start as a daemon."
	exit 1
fi

