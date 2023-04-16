### Upstream: https://aur.archlinux.org/cgit/aur.git/?h=linux-xanmod

## Sound fixes

- This laptop comes with a Cirrus amplifier which needs some ACPI tables that are not present in the BIOS. See `acpi/` for instructions.
- Patch 01 contains fixes for ALSA:
    - Fixes subwoofer volume not being adjustable
    - Fixes Headset mic not being detected

For more info read:

- https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff
- https://forums.linuxmint.com/viewtopic.php?t=394616#p2315415

## WMI keys

- Connecting/disconnecting the charger causes `kernel: asus_wmi: Unknown key code 0x7b` errors in dmesg
- Connecting/disconnecting external USB-C display causes `kernel: asus_wmi: Unknown key code 0xc0` errors in dmesg

Patch 02 silences both errors by ignoring those keys codes.