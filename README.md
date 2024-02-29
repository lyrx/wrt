![](wrt.png)
# WRT: The World Teamup Token

## Introduction
WRT  is an Ethereum blockchain-based ERC20 token. Its indended purpose is
to serve as a Medium of exchange for goods and services. This stands in stark
contrast to the existing ER20 tokens that are traded on exchanges.

It extends the basic ERC20 standard with additional features like burnable  capabilities.
This contract uses OpenZeppelin's secure and community-vetted code as a foundation.

## Features
- **ERC20 Standard**: Implements all standard ERC20 functionalities.
- **Burnable**: Tokens can be irreversibly burned (destroyed), reducing the total supply.


## Usage
### Constructor
- `constructor(string memory name, string memory symbol, uint256 initialSupply)`
    - `name`: Name of the token.
    - `symbol`: Symbol of the token.
    - `initialSupply`: Initial supply of tokens to be minted and allocated to the contract deployer.
    - `initialOwner`: Owner of the token


### Functions
- `mint(address to, uint256 amount)`: Allows the owner to mint new tokens.


## Development and Testing
This contract is developed and tested using Solidity 0.8.21 with Foundry. Foundry is a fast, portable, and modular
toolkit for Ethereum application development. It's recommended to use Foundry for testing and interacting with the contract.

## Security
This contract relies on OpenZeppelin's secure implementations. However, it is always recommended to conduct thorough security 
audits before deploying any smart contract in a production environment.


## Deployments using Foundry

"Canonical" environment variables you need to set:

```
#Wallet
export PUBLIC_KEY=
export PRIVATE_KEY=

#Infura endpoints
export INFURA_API_KEY=
export SEPOLIA_TESTNET="https://sepolia.infura.io/v3/${INFURA_API_KEY}"
export GOERLI_TESTNET="https://goerli.infura.io/v3/${INFURA_API_KEY}"
export ETHEREUM_MAINNET="https://mainnet.infura.io/v3/${INFURA_API_KEY}"
export POLYGON_MAINNET="https://polygon-mainnet.infura.io/v3/${INFURA_API_KEY}"
export POLYGON_MUMBAI="https://polygon-mumbai.infura.io/v3/${INFURA_API_KEY}"
export ARBITRUM_GOERLI="https://arbitrum-goerli.infura.io/v3/${INFURA_API_KEY}"
export ARBITRUM_SEPOLIA="https://arbitrum-sepolia.infura.io/v3/${INFURA_API_KEY}"
export ARBITRUM="https://arbitrum-mainnet.infura.io/v3/${INFURA_API_KEY}"

#Anvil (Use Anvil console output on startup to fill blanks)
export ANVIL_LOCAL="http://localhost:8545"
export ANVIL_PRIVATE_KEY=
export ANVIL_PUBLIC_KEY=

#Initial supply  (That's your decision)
# The token has 18 decimals (`token decimal`), so  you must
# multiply the number of tokens you want to have as initial supply by `10^18`
export INITIALSUPPLY=  
```


### Deployments using Anvil and Foundry

Start up anvil: `anvil`

#### Anvil and MetaMask

MetaMask checks the `chain id` before transactions. You see the network id when starting
up Anvil. Make sure MetaMask uses the same network id and port number!! (It can be configured,
when you set up the network
manually). If this is not correct, you will get JSON-Rpc-Errors, but no error messages that help
you understand the problem.

You must give gas to the deploying address:

```shell
cast send --rpc-url $ANVIL_LOCAL --private-key $ANVIL_PRIVATE_KEY  $PUBLIC_KEY --value 1000000000000000000
```
You deploy:

```shell

# Anvil: Deploy the contract
forge create src/Wrt.sol:Wrt --private-key $PRIVATE_KEY  --rpc-url $ANVIL_LOCAL   --constructor-args "World Teamup Token" "WRT" $INITIALSUPPLY  $PUBLIC_KEY 

# Polygon Mumbai: Deploy the contract
forge create src/Wrt.sol:Wrt --private-key $PRIVATE_KEY  --rpc-url $POLYGON_MUMBAI   --constructor-args "World Teamup Token" "WRT" $INITIALSUPPLY  $PUBLIC_KEY 

Deployer: 0x977583aA8aaFEE37f60A1eee8eB273a1dF05F57c
Deployed to: 0xc36b1A1f7f0447c5860B902DEB4eB8c9F1f7A4b4
Transaction hash: 0xf2cfaa9e12b6dfe57cda9fb77ad9ffc56650b6169049b0098f5bbdba70cc93ee



```

