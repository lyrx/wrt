// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

// Import the ERC20 interface and implementation from OpenZeppelin
import "@openzeppelin-contracts@5.0.1/token/ERC20/ERC20.sol";
import "@openzeppelin-contracts@5.0.1/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin-contracts@5.0.1/access/Ownable.sol";  // Import the Ownable contract

contract Wrt is ERC20, ERC20Burnable, Ownable {  // Add Ownable to the inheritance list
    // The constructor sets up the new token
    constructor(string memory name, string memory symbol, uint256 initialSupply)
    ERC20(name, symbol)
    Ownable(msg.sender)  // Pass the deployer's address to the Ownable constructor
    {
        // Mint the initial supply to the address that deploys the contract
        _mint(msg.sender, initialSupply);
    }

    // Example of a function that only the owner can call
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
