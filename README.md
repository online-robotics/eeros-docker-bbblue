# eeros-docker-bbblue
This repository provides a Docker container with the latest EEROS development environment installed and configured for the Beaglebone Blue. This simplifies the EEROS installation process and allows you to start coding and developing straight away.

# Prerequisites
You will need to install [Docker](https://docs.docker.com/get-docker/) to use this container.

It is recommended to use [Visual Studio Code](https://code.visualstudio.com/) together with the following extensions:
* [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
* [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

In the following sections it is assumed that you work with Visual Studio Code.

# Getting started
Work through the following steps to start developing your EEROS application with this container:
* Clone this repository
```
git clone https://github.com/online-robotics/eeros-docker-bbblue.git
```
* Open the folder with the cloned repository inside visual studio code
* Press `F1` and select `Dev Containers: Reopen Folder in Container`. Then wait for the container to start (this may take a few minutes the first time as it needs to download the container).

# Test the installation
You will need a [Beaglebone Blue](https://beagleboard.org/blue) with the [latest EEROS image](https://gitlab.ost.ch/tech/inf/public/yocto/meta-mse-tsm-autmobros/-/package_files/12764/download) installed to test if everything works. You can build the supplied basic EEROS project by clicking the Build button in the taskbar at the bottom of the Visual Studio code window. Once the build has completed successfully, you can connect the Beaglebone Blue via USB. Ensure that the SD card containing the EEROS image is inserted and press and hold the SD card button on the Beaglebone Blue while switching it on.  Once the Beaglebone Blue has finished booting, you can copy the executable file:
```
scp build/template_project root@192.168.7.2:
```
After copying the file, you can ssh into the Beaglebone Blue with
```
ssh root@192.168.7.2
```
On the Beaglebone Blue you can then start the application with
```
./template_project
```
You should see an output similar to the following if everything went well
```
ost@bblue:~$ /tmp/template_project 
2020-09-20 10:46:13:568    I:  Starting template project...
2020-09-20 10:46:13:573    I:  Initializing control system...
2020-09-20 10:46:13:574    I:  Initializing safety system...
2020-09-20 10:46:13:574  S W:  safety system verified: 2 safety levels are present
2020-09-20 10:46:13:575    I:  Initializing sequencer...
2020-09-20 10:46:13:576  X I:  Sequence created: Main Sequence
2020-09-20 10:46:13:577    I:  Initializing executor...
2020-09-20 10:46:13:578  S I:  triggering event 'Startup the system' in level 'System is offline': transition to safety level: 'System is online'
2020-09-20 10:46:13:581  X I:  start thread for sequence 'Main Sequence' (non-blocking), caller sequence: 'no caller'
2020-09-20 10:46:13:582  X I:  start 'Main Sequence'
2020-09-20 10:46:13:583  X I:  start 'Sleep'
2020-09-20 10:46:13:583  A E:  could not set realtime priority
2020-09-20 10:46:13:585  A E:  could not lock memory in RAM
2020-09-20 10:46:13:581  U I:  SequencerUI thread started
2020-09-20 10:46:14:581  E E:  could not set realtime priority
2020-09-20 10:46:14:582  E E:  could not lock memory in RAM
2020-09-20 10:46:14:590  X I:  Signal: 'My constant value multiplied with my gain' timestamp = 139657826724 value = 2
2020-09-20 10:46:14:591  X I:  start 'Sleep'
2020-09-20 10:46:15:595  X I:  Signal: 'My constant value multiplied with my gain' timestamp = 140661947516 value = 2
2020-09-20 10:46:15:596  X I:  start 'Sleep'
2020-09-20 10:46:16:600  X I:  Signal: 'My constant value multiplied with my gain' timestamp = 141667956975 value = 2
2020-09-20 10:46:16:602  X I:  start 'Sleep'
```