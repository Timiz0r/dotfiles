#!/bin/bash

pkill keepassxc
nitropy nk3 secrets get-password --password golden | keepassxc --pw-stdin ~/Dropbox/main.kdbx
