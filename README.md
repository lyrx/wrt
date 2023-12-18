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
