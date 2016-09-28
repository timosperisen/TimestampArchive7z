# TimestampArchive7z
Adds a context menu entry for folders to Windows explorer. This lets you create a timestamped archive of a folder with two clicks.

## Idea
If you mess around with some folders it's nice to have a backup/archive of it.
7Zip has a nice context menu to do it quite quickly. 
If you do it more often it is nice to have a timestamped archive automatically


## Prerequisites
You will need
* Windows
* Admin rights to install the reg file
* PowerShell
* 7z (64 bit version, else you need to modify the code)
* Some luck

### Tested with
* Windows 10
* Powershell 5.Something

## Installation
* Execute the Install_TimestampArchive7z.reg

## Removal
* Execute the file Uninstall_TimestampArchive7z.reg

## Additional Information
The file TimestampArchive7z.ps1 contains the commented PowerShell code that is included in the file Install_TimestampArchive7z.reg. Don't run it directly. It makes no sense. Except if you change the content of the variable $v to an actual folder you can test it.

## Usage
* Open Explorer
* Right-click a folder
* The context menu entry "TimestampArchive7z" should appear. Click it. 
* A timestamped zip file should appear. If not, something might not work properly.
* If nothing happens you can change the registry and change the -NonInteractive flag to -noexit and then install again. The Powershell window will not disappear and you might see the reason for the problem.

## Ideas for changes
* Switch from .zip to .7z as file extension
* Use more command line arguments
* Don't create archive in same folder but to a different drive/share/etc
