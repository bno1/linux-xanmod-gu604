### Upstream: https://aur.archlinux.org/cgit/aur.git/?h=linux-xanmod

## Speaker fixes

- patches 01-04 are for getting the speakers working. Not sure if all of them are need. Probably only `csc3551-quirk` and `alc245_fixup_cs35l41_spi_2` are essential.
- This laptop comes with a Cirrus amplifier which needs some ACPI tables that are not present in the BIOS. See `acpi/` for instructions.

For more info read:
- https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff
- https://forums.linuxmint.com/viewtopic.php?t=394616#p2315415

## Headset mic fix

To fix Headset microphone not showing up open up `hdajackretask` and apply the following configs.

Then click `Install boot override` and reboot.

![see images/hdajackretask.png](./images/hdajackretask.png)


## Speaker volume fix

Edit `/usr/share/alsa-card-profile/mixer/paths/analog-output.conf.common`, look for `[Element PCM]` and relace its section with:

```
[Element Master]
switch = mute
volume = ignore

[Element PCM]
switch = mute
volume = merge
override-map.1 = all
override-map.2 = all-left,all-right
```

Source: https://wiki.archlinux.org/title/ASUS_Zenbook_UX390