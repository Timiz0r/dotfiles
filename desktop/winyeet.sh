#!/usr/bin/env bash

boot_num=$(efibootmgr | grep -Po '^Boot\K\d+(?=\* Windows Boot Manager)')
sudo efibootmgr -n $boot_num
sudo reboot
