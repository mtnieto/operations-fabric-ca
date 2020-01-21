ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/myapp.com/orderers/orderer0.myapp.com/msp/tlscacerts/tlsca.myapp.com.crt.pem
CORE_PEER_LOCALMSPID="telefonicaMSP"
# CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/telefonica.com/tlsca/tlsca.telefonica.com.crt.pem

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/telefonica.com/users/Admin@telefonica.com/msp
CORE_PEER_ADDRESS=peer0.telefonica.com:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=false
ORDERER_SYSCHAN_ID=syschain


peer chaincode install -n mycontract -v 1.0 -p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02 >&log.txt
cat log.txt
