
#!/bin/bash

sudo apt install ninja-build curl zip unzip tar pkg-config clang-format cmake gcc g++ -y

git clone https://github.com/microsoft/vcpkg.git ~/vcpkg
cd ~/vcpkg

./bootstrap-vcpkg.sh

