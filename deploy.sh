#! /bin/bash

curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default
unzip butler.zip

# GNU unzip tends to not set the executable bit even though it's set in the .zip
chmod +x butler

# just a sanity check run (and also helpful in case you're sharing CI logs)
./butler -V

butler login

butler push build/x86_64-darwin/Chemaria_x86_64-darwin.zip dangerfloof/chemaria:osx
butler push build/x86_64-linux/Chemaria_x86_64-linux.zip dangerfloof/chemaria:linux
butler push build/x86_64-win32/Chemaria_x86_64-win32.zip dangerfloof/chemaria:windows