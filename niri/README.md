https://github.com/YaLTeR/niri

This setup of niri, or really any window manager, is focused on using
*systemd* instead of the built-in autostart functionality to control any 
lifetime programs.

The contents of .config/systemd/user are systemd units for any service
that doesn't have one already provided.

https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup

When niri is started via a session manager profile, it is launched as a
systemd service. So we just need to set up dependencies.

This set up is using:
- waybar
- mako
- fuzzel (launched from keybind, not a service)
- swaybg
- swayidle
- swaylock (launched from keybind or swayidle. not a service)
- blueman-applet
- nm-applet
- xwayland-satellite (https://github.com/YaLTeR/niri/wiki/Xwayland)
- fish (by way of scripts)
- plasma-krunner (experiment)
- plasma-kwallet-pam, somehow. (unlock kwallet from pam for saved wifi passwords, or something.)
- xdg-portal-gtk
- xdg-portal-gnome

```
systemctl --user add-wants niri.service waybar.service
systemctl --user add-wants niri.service mako.service
systemctl --user add-wants niri.service wallpaper.service
systemctl --user add-wants niri.service nm-applet.service
systemctl --user add-wants niri.service blueman-applet-graphical.service
systemctl --user add-wants niri.service swayidle.service
systemctl --user add-wants niri.service xwayland-satellite.service
systemctl --user add-wants niri.service plasma-krunner.service
systemctl --user add-wants niri.service plasma-kwallet-pam.service
```

# Setting themes
Niri is primirly using gnome and gtk things. And some of the common applets (network manager and blueman)
are in GTK.

```
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
```
