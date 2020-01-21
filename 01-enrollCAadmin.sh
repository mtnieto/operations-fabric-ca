
docker-compose -f docker-compose-catls.yaml up -d
sleep 3
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/tlsca/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=$PWD/tlsca/admin
fabric-ca-client enroll -d -u https://tls-ca-admin:tls-ca-adminpw@0.0.0.0:7052
fabric-ca-client register -d --id.name peer1-org1 --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer2-org1 --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer1-org2 --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer2-org2 --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052


sleep 10
export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/tlsca2/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=$PWD/tlsca2/admin
fabric-ca-client enroll -d -u https://tls-ca-admin:tls-ca-adminpw@0.0.0.0:8052
fabric-ca-client register -d --id.name orderer1-org0 --id.secret ordererPW --id.type orderer -u https://0.0.0.0:8052

docker-compose up -d 