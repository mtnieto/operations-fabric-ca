mkdir -p org0/msp/{admincerts,cacerts,tlscacerts}
cp org0/admin/msp/signcerts/cert.pem org0/msp/admincerts
cp org0/admin/msp/cacerts/0-0-0-0-7053.pem org0/msp/cacerts/org0-ca-cert.pem
cp org0/orderer/assets/tlsca/ca-cert.pem org0/msp/tlscacerts/tls-ca.cert


mkdir -p org1/msp/{admincerts,cacerts,tlscacerts}
cp org1/admin/msp/signcerts/cert.pem org1/msp/admincerts
cp org1/admin/msp/cacerts/0-0-0-0-7054.pem org1/msp/cacerts/org0-ca-cert.pem
cp org1/peer1/assets/tlsca/ca-cert.pem org1/msp/tlscacerts/tls-ca.cert

mkdir -p org2/msp/{admincerts,cacerts,tlscacerts}
cp org2/admin/msp/signcerts/cert.pem org2/msp/admincerts
cp org2/admin/msp/cacerts/0-0-0-0-7055.pem org2/msp/cacerts/org0-ca-cert.pem
cp org2/peer1/assets/tlsca/ca-cert.pem org2/msp/tlscacerts/tls-ca.cert

