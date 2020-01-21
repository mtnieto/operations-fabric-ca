echo "Generating Certs Organization 1"

mkdir -p $PWD/org2/peer1/assets/{ca,tlsca}
cp $PWD/org2/ca/crypto/ca-cert.pem $PWD/org2/peer1/assets/ca/org2-ca-cert.pem
cp $PWD/tlsca/crypto/ca-cert.pem $PWD/org2/peer1/assets/tlsca/ca-cert.pem

export FABRIC_CA_CLIENT_HOME=$PWD/org2/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org2/peer1/assets/ca/org2-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer1-org2:peer1PW@0.0.0.0:7055
sleep 3

export FABRIC_CA_CLIENT_HOME=$PWD/org2/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org2/peer1/assets/tlsca/ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
fabric-ca-client enroll -d -u https://peer1-org2:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-org2
sleep 3

mkdir -p $PWD/org2/peer2/assets/{ca,tlsca}
cp $PWD/org2/ca/crypto/ca-cert.pem $PWD/org2/peer2/assets/ca/org2-ca-cert.pem
cp $PWD/tlsca/crypto/ca-cert.pem $PWD/org2/peer2/assets/tlsca/ca-cert.pem
cp $PWD/tlsca/crypto/ca-cert.pem $PWD/org2/peer2/assets/tlsca/ca-cert.pem


export FABRIC_CA_CLIENT_HOME=$PWD/org2/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org2/peer2/assets/ca/org2-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer2-org2:peer2PW@0.0.0.0:7055
sleep 3

export FABRIC_CA_CLIENT_HOME=$PWD/org2/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org2/peer2/assets/tlsca/ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
fabric-ca-client enroll -d -u https://peer2-org2:peer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer2-org2
sleep 3

mkdir -p $PWD/org2/admin
export FABRIC_CA_CLIENT_HOME=$PWD/org2/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/org2/peer1/assets/ca/org2-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp
fabric-ca-client enroll -d -u https://admin-org2:org2AdminPW@0.0.0.0:7055
sleep 3

mkdir $PWD/org2/peer1/msp/admincerts
cp $PWD/org2/admin/msp/signcerts/cert.pem $PWD/org2/peer1/msp/admincerts/org2-admin-cert.pem
#mv org2/peer1/tls-msp/keystore/* org2/peer1/tls-msp/keystore/key.pem

mkdir -p $PWD/org2/peer2/msp/admincerts
cp $PWD/org2/admin/msp/signcerts/cert.pem $PWD/org2/peer2/msp/admincerts/org2-admin-cert.pem
#mv org2/peer2/tls-msp/keystore/* org2/peer2/tls-msp/keystore/key.pem

echo "Generating Certs Organization 2"
