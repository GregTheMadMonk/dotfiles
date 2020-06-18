#!/bin/sh

pacman -S linux grub --noconfirm
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --boot-directory=/boot --efi-directory=/boot --bootloader-id=grub --removable
pacman -S linux grub --noconfirm
