# DevContainer4AI
-----
## How to use
- Clone container using repo in Visual Studio Code
- Add more APT packages in packages.txt
- Add more PIP package in requirements.txt

On clone, the DockerFile will : 
- Take the base image
- Install all packages
- Install all requirements
- Create user that can be sudoer and that is useable by VSCode

It is meant to be use for development, not for production

Tada ! Use at your own risk.