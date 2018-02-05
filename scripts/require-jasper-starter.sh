#!/usr/bin/env bash

# Destination folder
DIR="./lib/jasperstarter";

# Remove previous folder
if [ -d $DIR ]; then
    printf "$(tput bold)# 1 #$(tput sgr0) Remove older directory $(tput bold)$DIR$(tput sgr0)\n";
    rm -Rf "$DIR"
    printf "Ok.\n\n";
fi

# Download a fresh bzip2 file
printf "$(tput bold)# 2 #$(tput sgr0) Downloading JasperStarter 3.2.1 from SourceForge...\n";
wget -O "$DIR.tar.bz2" "https://sourceforge.net/projects/jasperstarter/files/JasperStarter-3.2/jasperstarter-3.2.1-bin.tar.bz2/download";
printf "Ok.\n\n";

# Extract the library
printf "$(tput bold)# 3 #$(tput sgr0) Extracting JasperStarter library into $(tput bold)lib$(tput sgr0) directory...\n";
tar -xjf "$DIR.tar.bz2" -C ./lib/
printf "Ok.\n\n";

# Remove the archive
printf "$(tput bold)# 4 #$(tput sgr0) Removing BZIP2 file...\n";
rm -Rf "$DIR.tar.bz2"
printf "Ok.\n\n";

# Download MySQL JDBC Driver
printf "$(tput bold)# 5 #$(tput sgr0) Downloading MySQL JDBC Driver...\n";
wget -O "$DIR/jdbc/mysqljdbc.tar.gz" "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.45.tar.gz"
printf "Ok.\n\n";

# Extract MySQL JDBC Driver
printf "$(tput bold)# 6 #$(tput sgr0) Extracting MySQL JDBC Driver...\n";
DRIVER_FOLDER=`tar -tzf "$DIR/jdbc/mysqljdbc.tar.gz" | head -1 | cut -f1 -d"/"`
tar -xzf "$DIR/jdbc/mysqljdbc.tar.gz" -C "$DIR/jdbc/"
printf "Ok.\n\n";

# Move MySQL JDBC Driver into the right directory
printf "$(tput bold)# 7 #$(tput sgr0) Moving ${DRIVER_FOLDER} into $(tput bold)jdbc$(tput sgr0) directory...\n";
mv "$DIR/jdbc/$DRIVER_FOLDER/$DRIVER_FOLDER-bin.jar" "$DIR/jdbc/"
printf "Ok.\n\n";

# Remove the archive
printf "$(tput bold)# 8 #$(tput sgr0) Removing ${DRIVER_FOLDER} folder and archive...\n";
rm -Rf "$DIR/jdbc/$DRIVER_FOLDER" "$DIR/jdbc/mysqljdbc.tar.gz"
printf "Ok.\n\n";

# Done
printf "$(tput bold)Done.$(tput sgr0)";