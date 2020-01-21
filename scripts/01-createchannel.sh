CORE_PEER_LOCALMSPID="org1MSP"
CORE_PEER_MSPCONFIGPATH=/tmp/hyperledger/org1/admin/msp

peer channel create -c channel1 -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/channel1.tx -o orderer-org0:7050 --outputBlock /tmp/hyperledger/org1/peer1/assets/mychannel.block --tls --cafile /tmp/hyperledger/org1/peer1/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem


       