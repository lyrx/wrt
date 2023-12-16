// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

// Import the ERC20 interface and implementation from OpenZeppelin
import "@openzeppelin-contracts@5.0.1/token/ERC20/ERC20.sol";
import "@openzeppelin-contracts@5.0.1/token/ERC20/extensions/ERC20Burnable.sol";

contract Wrt is ERC20, ERC20Burnable {
    // The constructor sets up the new token
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        // Mint the initial supply to the address that deploys the contract
        _mint(msg.sender, initialSupply);
    }
}
