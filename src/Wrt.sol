// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "@openzeppelin-contracts@5.0.1/token/ERC20/ERC20.sol";
import "@openzeppelin-contracts@5.0.1/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin-contracts@5.0.1/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin-contracts@5.0.1/access/Ownable.sol";

contract Wrt is ERC20, ERC20Burnable, ERC20Pausable, Ownable {
    constructor(string memory name, string memory symbol, uint256 initialSupply)
    ERC20(name, symbol)
    Ownable(msg.sender)
    {
        _mint(msg.sender, initialSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Correctly override the _update function from ERC20Pausable
    function _update(address from, address to, uint256 amount) internal override(ERC20, ERC20Pausable) {
        super._update(from, to, amount);
    }

    // Function to pause the contract
    function pause() public onlyOwner {
        _pause();
    }

    // Function to unpause the contract
    function unpause() public onlyOwner {
        _unpause();
    }
}
