#! /bin/bash

read -p 'KeyName Please (If Generic Key leave it blank): ' keyname

echo $keyname

if [ -z $keyname ]
then 
    keyname = "id_rsa"
fi

read -p 'Do you need passphrase (Y/N)?: ' passoption

echo $passoption

while [[ $passoption != "Y" && $passoption != "y" && $passoption != "N" && $passoption != "n" ]]
do 
    echo 'incorrect option' 
    read -p 'Do you need passphrase (Y/N)?: ' passoption
done

if [[ $passoption == 'Y' || $passoption == 'y' ]]
then
    read -p  'Please enter the passphrase of your wish! ' -s passphrase
    ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/$keyname -q -N "$passphrase"
    echo "Key is generated in $HOME/.ssh/$keyname"
else
    ssh-keygen -b 2048 -t rsa -f $HOME/.ssh/$keyname -q -N ""
    echo "Key is generated in $HOME/.ssh/$keyname"
fi