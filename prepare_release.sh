#! /bin/bash

# Windows 64-Bit
zip -r x86_64-win32.zip x86_64-win32
rm -rf x86_64-win32

# Windows 32-Bit
zip -r x86-win32.zip x86-win32
rm -rf x86-win32

# Linux 64-Bit
tar c x86_64-linux | xz > x86_64-linux.tar.xz
rm -rf x86_64-linux

# Mac OSX
tar c x86_64-darwin | xz > x86_64-darwin.tar.xz
rm -rf x86_64-darwin

