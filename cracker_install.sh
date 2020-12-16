#!/bin/bash
# funciones

#Separador
separador(){
sep="\n-------------------------------------------------------------------"
echo -e $sep
}

#Colores
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
blueColour="\e[0;34m\033[1m"
purpleColour="\e[0;35m\033[1m"
endColour="\033[0m\e[0m"

#CTRL-C
trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColour}[++] Programa Terminado [++]${endColour}"
        exit 0
}

REPO_HASH=https://gitlab.com/kalilinux/packages/hash-identifier.git
REPO_JOHN=https://github.com/openwall/john

echo -e "${yellowColour}Instalado requisitos para usar GPU en virtualbox"
sudo apt-get update && sudo apt-get install -y libhwloc-dev ocl-icd-dev ocl-icd-opencl-dev pocl-opencl-icd

echo -e "\n${yellowColour}Instalando Hash-identifier ${endColour}"
sudo apt-get install -y git
git clone "$REPO_HASH"

separador

echo -e "\n${yellowColour}Instalando Hashcat ${endColour}"
sudo apt-get install -y hashcat

separador

echo -e "\n${yellowColour}Instalando John the ripper ${endColour}"
sudo apt-get install -y libssl-dev gcc make
git clone "$REPO_JOHN"
cd ~/john/src
sudo ./configure && make
cd ~/john/run
./john

separador

echo -e "\n${greenColour}Todos los procesos terminaron correctamente ${endColour}"

echo -e "\n${blueColor} hashcat --example-hash | grep -i 'sha-256'
 hashcat -a 0 -m 1400 haskC.txt wordlist.txt --force
 ./john/run/john --wordlist=wordlist.txt --format=gost hackC.txt
 ./john/run/john --show hackC.txt
 python3 hash-id.py HASH ${endColour}"
