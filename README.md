# Operations-fabric-ca

Proof of concept following this tutorial https://hyperledger-fabric-ca.readthedocs.io/en/latest/operations_guide.html#create-and-join-channel

In this case, instead of having only one TLS CA for issue all the TLS certificates, the organizations org1 and org2 share their own TLS CA and the orderer org (org0) uses its own dedicated TLS CA.
