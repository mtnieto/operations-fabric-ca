echo "Generating Certs Organization 1"

mkdir -p $PWD/org0/orderer/assets/{ca,tlsca}
cp $PWD/org0/ca/crypto/ca-cert.pem $PWD/org0/orderer/assets/ca/org0-ca-cert.pem
cp $PWD/tlsca/crypto/ca-cert.pem $PWD/org0/orderer/assets/tlsca/ca-cert.pem

export FABRIC_CA_CLIENT_HOME=$PWD/org0/orderer
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org0/orderer/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://orderer1-org0:ordererpw@0.0.0.0:7053

sleep 3
export FABRIC_CA_CLIENT_HOME=$PWD/org0/orderer
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org0/orderer/assets/tlsca/ca-cert.pem
fabric-ca-client enroll -d -u https://orderer1-org0:ordererPW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer-org0
sleep 3



mkdir -p $PWD/org0/admin
export FABRIC_CA_CLIENT_HOME=$PWD/org0/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org0/orderer/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp
fabric-ca-client enroll -d -u https://admin-org0:org0adminpw@0.0.0.0:7053
sleep 3

mkdir $PWD/org0/orderer/msp/admincerts
cp $PWD/org0/admin/msp/signcerts/cert.pem $PWD/org0/orderer/msp/admincerts/org0-admin-cert.pem

echo "Generating Certs Organization 2"
