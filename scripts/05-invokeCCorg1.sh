
peer chaincode invoke -o orderer-org0:7050  -C channel1 -n mycontract2 -c '{"Args":["invoke","a","b","10"]}'  --tls --cafile /tmp/hyperledger/org1/peer1/msp/tls-0-0-0-0-8052.pem
