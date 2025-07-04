# HB - History Browser

[![hb demo](https://img.youtube.com/vi/WUqvfsHDNY0/0.jpg)](https://www.youtube.com/watch?v=WUqvfsHDNY0)

Small CLI tool to search bash history and quickly repeat or edit command.
Uses fzf to filter and select entries. Once you select the command, it lets you edit it before sending again.

## Dependencies
- requires fzf.

### Debian / debian based:
```
sudo apt install fzf
```

### Arch:
```
sudo pacman -S fzf
```

### Fedora:
```
sudo dnf install fzf
```

### OpenSUSE:
```
sudo zypper install fzf
```

## Installation:
```
git clone https://github.com/yayuuu/hb
cd hb
chmod +x install.sh
./install.sh
```

During installation, you will be asked whether you want to install the script globally or locally. No superuser is required for local installation, but you need to make sure that ~/.local/bin is in your $PATH.
You can choose to additionally install alias that saves current session's history before executing hstr. Otherwise current session's history can't be browsed from within scripts, only previously saved history will be visible. Installing alias adds a line to your .bashrc (or global /etc/bash.bashrc) file.

## Usage:
Just type hb [phrase] or hstr [phrase] to search or open browser.
