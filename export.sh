#!/bin/sh
set -e

function typewriter
{
    text="$1"
    delay="$2"

    for i in $(seq 0 $(expr length "${text}")) ; do
        echo -e -n "${text:$i:1}"
        sleep ${delay}
    done
}

typewriter "The pfSense provide *.key file for TLS authentication and" .03
echo 
typewriter "PKCS #12 container with users certificate and private key plus" .03
echo 
typewriter "CA certificate. However the OpenVPN plugin for NetworkManager" .03
echo 
typewriter "requires the certificates in PEM format." .03
echo 

read -p "Let's use the openssl tool for that? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo "Exporting certificates..."

OUTPUT_DIR="./OUTPUT"

if [ -d "$OUTPUT_DIR" ]; then
  echo "Directory ${OUTPUT_DIR} already exists!"
  exit 1
fi

mkdir $OUTPUT_DIR

typewriter "***************************************************" .05
echo

openssl pkcs12 -nodes -passin pass:'' -passout pass:'' -in ${1}.p12 -out $OUTPUT_DIR/${1}_ca.crt -cacerts
openssl pkcs12 -nodes -passin pass:'' -passout pass:'' -in ${1}.p12 -out $OUTPUT_DIR/${1}_user.crt -clcerts

echo "Baking new OVPN profile..."
typewriter "***************************************************" .05
echo

sed '/^pkcs12/d' < ${1}.ovpn > $OUTPUT_DIR/${1}.ovpn
echo -e "cert key ${1}_user.cr\nkey ${1}_user.crt\nca ${1}_ca.crt" >> $OUTPUT_DIR/${1}.ovpn
cp ${1}.key $OUTPUT_DIR/

typewriter "Mission accomplished, comrade! Go to $OUTPUT_DIR dir and get your converted ovpn profile =)" .05
echo
