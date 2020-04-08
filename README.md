# RsTx
RsTx supports [Stealth Addresses](https://www.investopedia.com/terms/s/stealth-address-cryptocurrency.asp) for Ethereum

# Features
* Create a new master key-pair
* Transfer funds to a master public key
* Receive funds sent to a master public key

# Concept
The RsTx architecture consists of the following repositories:
* [Rust Client](https://github.com/roynalnaruto/rs_tx_client) to implement the logic
* [Smart contracts](https://github.com/roynalnaruto/rs_tx_contracts) to communicate the nonce point
* [Subgraph](https://github.com/roynalnaruto/rs_tx_subgraph) to query Ethereum blockchain

RsTx implements stealth addresses based on the Diffie-Hellman key agreement protocol. The implementation follows the [mechanism described here](https://en.bitcoin.it/wiki/ECDH_address).

Both sender and recipient must have an already generated key-pair. The recipient's key-pair will act as a base (master) key, used to calculate the new one-time keys.

After a successful transfer, the sender must communicate the `Nonce point` (which is logged after a transfer) to the recipient. The recipient later uses this point to generate the key for the received funds. Without the nonce point, it is not possible to generate the new key.

Once a transfer has been made, the `nonce_point` is broadcasted to the [RsTx Smart Contract](https://github.com/roynalnaruto/rs_tx_contracts) along with a bytes encoded encrypted form of the recipient's address. The `encrypted_recipient` is used by the recipients in their client to catch or ignore the new RsTx transactions.

Senders can simply run the `scan` command, with an additional block number filter to query RsTx transactions. The GraphQL schema is generated using The Graph Protocol, and the subgraphs can be found here in the [RsTx Subgraph](https://github.com/roynalnaruto/rs_tx_subgraph) repository.

# Getting started
### Setup
* Clone this repository
```
git clone git@github.com:roynalnaruto/rs_tx_contracts.git
```
* Install dependencies
```
yarn install
```
* Get [Ganache](https://github.com/trufflesuite/ganache-cli) and run
```
npm install -g ganache-cli
ganache-cli -a=20
```
* Compile contracts
```
yarn truffle compile
```
* Deploy contracts
```
yarn truffle migrate --network development
```
