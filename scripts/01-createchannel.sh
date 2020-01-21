ORDERER_CA="/tmp/hyperledger/org1/peer1/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem"
CORE_PEER_LOCALMSPID="org1MSP"
CORE_PEER_TLS_ROOTCERT_FILE="/tmp/hyperledger/org1/peer1/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem"
CORE_PEER_MSPCONFIGPATH=/tmp/hyperledger/org1/admin/msp

CORE_PEER_ADDRESS=peer1-org1:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true
ORDERER_SYSCHAN_ID=syschain
peer channel create -o orderer1-org0:7050 -c channel1 -f ./channel-artifacts/channel1.tx >&log.txt  --cafile $ORDERER_CA
cat log.txt


       