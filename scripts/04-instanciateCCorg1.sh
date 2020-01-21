
peer chaincode instantiate -o orderer-org0:7050 -C channel1 -n mycontract -v 1.0 -c '{"Args":["init","a","100","b","200"]}' --tls --cafile /tmp/hyperledger/org1/peer1/msp/tls-0-0-0-0-8052.pem

