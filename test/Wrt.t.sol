// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "ds-test/test.sol";
import "../src/Wrt.sol";

contract WrtTest is DSTest {
    Wrt wrt;
    address deployer;

    function setUp() public {
        deployer = address(this);
        // Assuming the initial supply is 1000 tokens
        wrt = new Wrt("WRT Token", "WRT", 1000);
    }

    function testInitialBalance() public {
        // Check if the deployer's balance is equal to the initial supply
        assertEq(wrt.balanceOf(deployer), 1000);
    }

    function testBurn() public {
        uint256 burnAmount = 100;
        uint256 initialBalance = wrt.balanceOf(deployer);

        // Burn some tokens
        wrt.burn(burnAmount);

        // Check if the balance is reduced accordingly
        assertEq(wrt.balanceOf(deployer), initialBalance - burnAmount);
    }
}
