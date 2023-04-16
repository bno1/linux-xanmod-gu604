## Source
https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff

## Instructions (for GRUB)

Build ACPI table:

```
iasl -tc ssdt_csc3551.dsl
mkdir -p kernel/firmware/acpi
cp ssdt_csc3551.aml kernel/firmware/acpi
find kernel | cpio -H newc --create > patched_cirrus_acpi.cpio
```

Add table to boot partition:

```
sudo cp patched_cirrus_acpi.cpio /boot/patched_cirrus_acpi.cpio
```

Add table to `/etc/defaults/grub`:

```
GRUB_EARLY_INITRD_LINUX_CUSTOM="patched_cirrus_acpi.cpio"
```

Reconfigure grub:

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```