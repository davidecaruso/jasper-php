#!/usr/bin/env bash

# Destination folder
DIR="./lib/jasperstarter";

# Remove previous folder
if [ -d $DIR ]; then
    printf "Remove older directory $(tput bold)$DIR$(tput sgr0)\n\n";
    rm -Rf "$DIR"
fi

# Download a fresh bzip2 file
printf "Downloading JasperStarter 3.2.1 from SourceForge...\n\n";
wget -O "$DIR.tar.bz2" "https://sourceforge.net/projects/jasperstarter/files/JasperStarter-3.2/jasperstarter-3.2.1-bin.tar.bz2/download";

# Extract the library
printf "Extracting JasperStarter library into $(tput bold)lib$(tput sgr0) directory...\n\n";
tar -xjf "$DIR.tar.bz2" -C ./lib/

# Remove the archive
printf "Removing BZIP2 file...\n\n";
rm -Rf "$DIR.tar.bz2"

# Done
printf "Done.";