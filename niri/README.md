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
- hyprlock (nicer lock screen then swaylock)
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

xdg-desktop-portals are cool and a little confusing.

`/usr/share/xdg-desktop-portal/niri-portals.conf` says what desktop portals to use and which
subset of protocols (https://flatpak.github.io/xdg-desktop-portal/docs/impl-dbus-interfaces.html).

Portals go through dbus and connects dbus requests to what actions to take.
For instance: the kde portal says "open files with dolphin", while the gnome portal says
"open files with nautilus."

Portals also expose system settings, such as "What theme hint is being used."
Trying to use the kde portal, GTK apps weren't getting the correct theme hints.
I *think* this is because plasma does some computation trickery in to set it, and that 
isn't happening outside the plasma.

So what does all this mean if I want to have a main setup in plasma, but switch into
niri without installing a bunch of gnome/gtk applications?

- aur: qt5ct-kde and qt6ct-kde. qt5ct and qt6ct allow setting qt themes outside 
plasma. The `*-kde` variant is set up to locate and use kde plasma color schemes.
  - session environment variable: `QT_QPA_PLATFORMTHEME "qt6ct"`
- niri-portals.conf:
``` 
[preferred]
default=kde;gtk;
org.freedesktop.impl.portal.Access=gtk;
org.freedesktop.impl.portal.Settings=gtk;
org.freedesktop.impl.portal.Notification=gtk;
org.freedesktop.impl.portal.Secret=gnome-keyring;
org.freedesktop.impl.portal.FileChooser=kde;
```
- GTK settings:
```
gsettings set org.gnome.desktop.interface gtk-theme "Breeze-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
```
- If dolphin doesn't detect file type associations: 
  - `kbuildsycoca6 --noincremental`.
  - session environment variable: `XDG_MENU_PREFIX "plasma-"`
Something about rebuilding menu files and mimetypes.
