#!/bin/bash
mkdir -p ~/.cyphal      # Ensure the directory actually exists# Add all namespaces from the public regulated data types repository:

wget https://github.com/OpenCyphal/public_regulated_data_types/archive/refs/heads/master.zip -O dsdl.zip
unzip dsdl.zip -d ~/.cyphal
mv -f ~/.cyphal/public_regulated_data_types*/* ~/.cyphal
# There will be some garbage left in the destination directory, but it's mostly harmless.

# Add vendor-specific namespaces the same way, if you need any:
wget https://github.com/Zubax/zubax_dsdl/archive/refs/heads/master.zip -O dsdl.zip
unzip dsdl.zip -d ~/.cyphal
mv -f ~/.cyphal/zubax_dsdl*/* ~/.cyphal

rm dsdl.zip
