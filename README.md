# GetHackMii
A tool to show up the HackMii Installer in your apps on HBC.

## Index
[`Introduction`](https://github.com/franzageek/GetHackMii/master/README.md#introduction) - [`Use`](https://github.com/franzageek/GetHackMii/master/README.md#use) - [`Versions`](https://github.com/franzageek/GetHackMii/master/README.md#versions) - [`Credits`](https://github.com/franzageek/GetHackMii/master/README.md#credits)

## Introduction
GetHackMii is a script written in Batch that lets you to automatically download the latest version of the HackMii Installer (the installer for some homebrew software for Wii modding) and, once the program downloaded the HMI (HackMii Installer), GHM (GetHackMii) will move the HMI folder into your SD Card/USB Drive containing homebrew apps. In this way you can make it appear in The Homebrew Channel, being able to access it more easily (as easy as another homebrew app). 
You can now stop using Letterbomb exploit to access to the HMI, but you can now do so like you would for an app: through HBC (Homebrew Channel).

## Use
Using GHM is really simple.
First, you need to download the [`gethackmii.zip`](https://github.com/franzageek/GetHackMii/releases/download/v0.1.2-beta/gethackmii_v0.1.2.zip) folder (you can download other versions [here](https://github.com/franzageek/GetHackMii/releases/)). Once you downloaded it, extract it wherever you want (Desktop, Downloads are recommended).
Then, open the directory you extracted, and run `gethackmii.bat` normally. Warning: do not run it as administrator: the program may mess up the System32 folder.
When you start GHM, a window will open. There is an "About" section which explains what GHM will do. To begin with the download process, press 1.
Insert your drive containing HB apps (homebrew apps) and press Enter.
Then, the process will start. First of all, GHM will check all drives until it finds one with the `\apps\` folder: the folder created by HBC to contain HB apps.
After finding the drives with the HB apps, GHM will download the HMI folder from our repository (`hackmii_installer.zip`) and move it on the drive\apps\ folder. 
Then, GHM will clean up the environment and end the process.

## Versions
[`v0.1.0`](https://github.com/franzageek/GetHackMii/tree/master/versions/0.1.0): released on May 14, 2022. First release of GHM. ([Download here](https://github.com/franzageek/GetHackMii/releases/download/v0.1.0-beta/gethackmii_v0.1.0.zip))

[`v0.1.2`](https://github.com/franzageek/GetHackMii/tree/master/versions/0.1.2): released on May 21, 2022. Some code polishing, new download method.  ([Download here](https://github.com/franzageek/GetHackMii/releases/download/v0.1.2-beta/gethackmii_v0.1.2.zip))

## Credits
The Homebrew Channel (hbc.hackmii.com), BootMii (bootmii.org), and HackMii Installer (wiibrew.org/wiki/HackMii_Installer) are property of Team Twiizers (http://hbc.hackmii.com/credits/).
GNU WGET is a GNU project (https://www.gnu.org/software/wget/).
