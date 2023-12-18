// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "ds-test/test.sol";
import "../src/Wrt.sol";
import "forge-std/Test.sol";

contract WrtTest is DSTest, Test  {
    Wrt wrt;
    address deployer;
    address nonOwner;
    address proposedOwner;

    function setUp() public {
        deployer = address(this);
        nonOwner = address(0x2);
        proposedOwner = address(0x3);
        wrt = new Wrt("WRT Token", "WRT", 1000,deployer);
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

    function testOwnership() public {
        // Check if the deployer is the owner
        assertEq(wrt.owner(), deployer);
    }




    // Test mint function
    function testMint() public {
        uint256 mintAmount = 100;
        wrt.mint(deployer, mintAmount);
        assertEq(wrt.totalSupply(), 1100);
        assertEq(wrt.balanceOf(deployer), 1100);
    }





    function testFailMintByNonOwner() public {
        uint256 mintAmount = 50;
        vm.prank(nonOwner);
        wrt.mint(deployer, mintAmount);
    }

    function testRenounceOwnership() public {

        wrt.renounceOwnership();

    }





}
