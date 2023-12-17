// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

// Importing OpenZeppelin contracts for ERC20 token functionality
import "@openzeppelin-contracts@5.0.1/token/ERC20/ERC20.sol";
import "@openzeppelin-contracts@5.0.1/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin-contracts@5.0.1/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin-contracts@5.0.1/access/Ownable.sol";

/**
 * @title Wrt Token Contract
 * @dev Extends ERC20 Token Standard basic implementation with burnable and pausable capabilities.
 */
contract Wrt is ERC20, ERC20Burnable, ERC20Pausable, Ownable {

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     * @param name Name of the token.
     * @param symbol Symbol of the token.
     * @param initialSupply Initial supply of tokens to be minted.
     */
    constructor(string memory name, string memory symbol, uint256 initialSupply)
    ERC20(name, symbol)
    Ownable(msg.sender)
    {
        _mint(msg.sender, initialSupply);
    }

    /**
     * @dev Function to mint tokens. Only the owner can call this function.
     * @param to Address to which tokens will be minted.
     * @param amount Amount of tokens to mint.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /**
     * @dev Override of the _update function from ERC20 and ERC20Pausable to include pause functionality.
     */
    function _update(address from, address to, uint256 amount) internal override(ERC20, ERC20Pausable) {
        super._update(from, to, amount);
    }

    /**
     * @dev Pauses all token transfers.
     */
    function pause() public onlyOwner {
        _pause();
    }

    /**
     * @dev Unpauses all token transfers.
     */
    function unpause() public onlyOwner {
        _unpause();
    }
}
