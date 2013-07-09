Install Tango for D2 https://github.com/SiegeLord/Tango-D2
For APT based distributions follow the instructions on http://d-apt.sourceforge.net/
```
sudo wget http://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
sudo apt-get update && sudo apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring && sudo apt-get update
sudo apt-get install libtango-dmd-dev
```