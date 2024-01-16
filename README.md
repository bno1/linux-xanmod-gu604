### Upstream: https://aur.archlinux.org/cgit/aur.git/?h=linux-xanmod

## Update
All those patches are alreay upstreamed and [starting with Linux 6.7 the missing
ACPI tables are now handled by the Cirrus driver](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5414aea7b7508d01235ea0c95064ad66395c3239),
so no need to add them.

Unless you're running Linux 6.6 or older you don't need this repo.

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
