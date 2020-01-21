sh 01-enrollCAadmin.sh
sleep 5
sh 02-orgOrd.sh
sleep 5
sh 03-org1.sh
sleep 5
sh 04-org2.sh
sleep 5
sh 05-generateCerts-org1.sh
sleep 5
sh 06-generateCerts-org2.sh
sleep 5
sh 07-generateCerts-ord.sh
sleep 5
sh 08-generateMSP.sh
sleep 5
sh 09-generateChannel.sh

# docker-compose -f docker-compose-peer.yaml up -d 
# docker-compose -f docker-compose-peer-ord.yaml up -d
# docker-compose -f docker-compose-cli.yaml up -d

