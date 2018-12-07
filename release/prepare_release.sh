#! /bin/bash

# Windows 64-Bit
zip x86_64-win32.zip x86_64-win32
rm -rf x86_64-win32

# Windows 32-Bit
zip x86-win32.zip x86-win32
rm -rf x86-win32

# Linux 64-Bit
tar c x86_64-linux | xz > 86_64-linux.tar.xz
rm -rf x86_64-linux

# Mac OSX
tar c x86_64-darwin | xz > 86_64-darwin.tar.xz
rm -rf x86_64-darwin

