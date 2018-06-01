# RaspberryPi-Scripts
This project contains Checking script status / detecting script crash used to monitor my office door at work with a Raspberry Pi 3 Model B.

## Getting Started

These instructions will introduce to making an executable script.
Open terminal on your Raspberry pi and create a test script:

```
nano test2.sh
```

This Will open a basic text editor & allow you to enter a series of commands, that form the basis of all
our scripts. Enter the following text:

```
echo “hello world”
```

Then save the file & exit. To make the command executable type:

```
chmod u+x test2.sh
```

and then to run the script:

```
./test2.sh
```
Some scripts will need to be run as root (the highest security level). To do that type:

```
sudo ./test2.sh
```
If you have any problem running a script, then you've either made a typo, forgotten to make it
executable with chmod, or need to put a sudo in front of it.

### Prerequisites

These Script are made to run on Raspberry Pi 3.We've assumed you're running the latest version
of the Raspbian OS for the Raspberry Pi. To begin run the following comming to update your system to the latest packages.

```
sudo apt-get update
```
and 

```
sudo apt-get upgrade
```

## Usage

These scripts serve as model or bleuprint to create your own scripts depending on the project
you built.
They also demostrate some of the most common tasks used while building projects 
on Raspberry.

## Author

* **[Yann Mulonda](https://github.com/YannMjl)** - *Initial work* - [Tim Rustige]

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)© [Yann Mulonda](https://github.com/YannMjl) file for details
