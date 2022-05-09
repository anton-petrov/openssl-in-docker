# pfSense to PEM converter

## About

Solution that allows to use Ubuntu NetworkManager+OpenVPN with PfSense profile.
Tested on Ubuntu **22.04**.

## OpenSSL

Docker image contains openssl 1.1.1o, based on Alpine Linux and built from source.

## Build

Create docker buildx instance, if you haven't already done so:
```
docker buildx create --use
```
then run the script:
```bash
./build.sh
```

## Usage

```bash
./run.sh <your_config>
```
For example, if you have bundle of files __cert.p12, cert.ovpn, cert.key__, you need to provide *cert* without extension:  
```
./run.sh cert
```

After that, the converted keys will appear in the *OUTPUT* folder.

Have fun =)
