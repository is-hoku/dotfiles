# dotfiles
![2021-10-30_23-08](https://user-images.githubusercontent.com/52068717/139536933-4b604fcc-775b-4ae6-9aa1-77737d31fdce.png)
![2021-10-30_23-19](https://user-images.githubusercontent.com/52068717/139536934-36a21b82-9c4a-4f95-8866-eec2cdd7c778.png)


## Contents
- OS: Arch Linux   
- WM: i3-gaps   
- Terminal: alacritty   
- Shell: bash   
- Editor: vim   
- Bar: polybar   
- Launcher: rofi   
- File Manager: vifm, pcmanfm   
- PDF Viewer: zathura   
- Image Viewer: sxiv   
- Notification Daemon: dunst   
- Screenshot Tool: flameshot   
- Clock: tty-clock   
- Fetch: neofetch, pfetch   

## bookmarks in bash
Create the directory.  
```
mkdir ~/.bookmarks
```
Create a new symbolic link.  
```
ln -s path/to/certain/directory/with/my/project ~/.bookmark/project_name
```
You can use goto command (an alias for cd).  
```
goto project_name
```

## create a symbolic link
```
mv ~/.bashrc ~/dotfiles
ln -s ~/dotfiles/.bashrc ~/.bashrc
```
