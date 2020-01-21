mkdir -p channel-artifacts
configtxgen -profile OrdererGenesis -outputBlock ./channel-artifacts/genesis.block -channelID testchainid
configtxgen -profile Channel -outputCreateChannelTx ./channel-artifacts/channel1.tx -channelID channel1



mv org0/orderer/tls-msp/keystore/* org0/orderer/tls-msp/keystore/key.pem
mv org1/peer1/tls-msp/keystore/* org1/peer1/tls-msp/keystore/key.pem
mv org1/peer2/tls-msp/keystore/* org1/peer2/tls-msp/keystore/key.pem
mv org2/peer1/tls-msp/keystore/* org2/peer1/tls-msp/keystore/key.pem
mv org2/peer2/tls-msp/keystore/* org2/peer2/tls-msp/keystore/key.pem
mkdir -p org1/admin/msp/admincerts
cp org1/admin/msp/signcerts/cert.pem org1/admin/msp/admincerts
cp org0/orderer/tls-msp/tlscacerts/tls-0-0-0-0-8052.pem org1/peer1/msp