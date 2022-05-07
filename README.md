# pfSense to PEM converter

## HowTo

Solution that allows to use Ubuntu NetworkManager+OpenVPN with PfSense profile.

## OpenSSL

Docker image contains openssl 1.1.1o, based on Alpine Linux and built from source.

## Usage

```bash
./run.sh <your_config>
```
For example, if you have bundle of files __cert.p12, cert.ovpn, cert.key__, you need to provide *cert* without extension:  
```
./run.sh cert
```

## Build

Create docker buildx instance, if you haven't already done so:
```
docker buildx create --use
```
then run the script:
```bash
./build.sh
```

Have fun =)