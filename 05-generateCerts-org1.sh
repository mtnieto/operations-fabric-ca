echo "Generating Certs Organization 1"

mkdir -p $PWD/org1/peer1/assets/{ca,tlsca}
cp $PWD/org1/ca/crypto/ca-cert.pem $PWD/org1/peer1/assets/ca/org1-ca-cert.pem
cp $PWD/tlsca/crypto/ca-cert.pem $PWD/org1/peer1/assets/tlsca/ca-cert.pem

export FABRIC_CA_CLIENT_HOME=$PWD/org1/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org1/peer1/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer1-org1:peer1PW@0.0.0.0:7054

sleep 5


mkdir -p $PWD/org1/peer2/assets/{ca,tlsca}
cp $PWD/org1/ca/crypto/ca-cert.pem $PWD/org1/peer2/assets/ca/org1-ca-cert.pem
cp $PWD/tlsca/crypto/ca-cert.pem $PWD/org1/peer2/assets/tlsca/ca-cert.pem
cp $PWD/tlsca/crypto/ca-cert.pem $PWD/org1/peer2/assets/tlsca/ca-cert.pem


export FABRIC_CA_CLIENT_HOME=$PWD/org1/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org1/peer2/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer2-org1:peer2PW@0.0.0.0:7054
sleep 5

export FABRIC_CA_CLIENT_HOME=$PWD/org1/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org1/peer2/assets/tlsca/ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=tls-msp

fabric-ca-client enroll -d -u https://peer2-org1:peer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer2-org1
sleep 3

export FABRIC_CA_CLIENT_HOME=$PWD/org1/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org1/peer1/assets/tlsca/ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=tls-msp

fabric-ca-client enroll -d -u https://peer1-org1:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-org1
sleep 3

mkdir -p $PWD/org1/admin
export FABRIC_CA_CLIENT_HOME=$PWD/org1/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org1/peer1/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp
fabric-ca-client enroll -d -u https://admin-org1:org1AdminPW@0.0.0.0:7054
sleep 3

mkdir -p $PWD/org1/peer1/msp/admincerts
cp $PWD/org1/admin/msp/signcerts/cert.pem $PWD/org1/peer1/msp/admincerts/org1-admin-cert.pem
#mv org1/peer1/tls-msp/keystore/* org1/peer1/tls-msp/keystore/key.pem

mkdir -p $PWD/org1/peer2/msp/admincerts
cp $PWD/org1/admin/msp/signcerts/cert.pem $PWD/org1/peer2/msp/admincerts/org1-admin-cert.pem
#mv org1/peer2/tls-msp/keystore/* org1/peer2/tls-msp/keystore/key.pem
echo "Generating Certs Organization 2"
