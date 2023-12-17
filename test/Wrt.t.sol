// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "ds-test/test.sol";
import "../src/Wrt.sol";
import "forge-std/Test.sol";

contract WrtTest is DSTest, Test  {
    Wrt wrt;
    address deployer;
    address nonOwner;

    function setUp() public {
        deployer = address(this);
        nonOwner = address(0x2);
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

    function testOwnership() public {
        // Check if the deployer is the owner
        assertEq(wrt.owner(), deployer);
    }

    function testPauseFunctionality() public {
        // Ensure only owner can pause and unpause
        wrt.pause();
        assertTrue(wrt.paused());

        wrt.unpause();
        assertTrue(!wrt.paused());
    }

    function testFailTransferWhenPaused() public {
        uint256 transferAmount = 50;
        address recipient = address(0x123);

        wrt.pause();
        wrt.transfer(recipient, transferAmount); // This should fail
    }

    function testFailMintWhenPaused() public {
        uint256 mintAmount = 50;

        wrt.pause();
        wrt.mint(deployer, mintAmount); // This should fail
    }

    function testFailBurnWhenPaused() public {
        uint256 burnAmount = 50;

        wrt.pause();
        wrt.burn(burnAmount); // This should fail
    }


    // Test mint function
    function testMint() public {
        uint256 mintAmount = 100;
        wrt.mint(deployer, mintAmount);
        assertEq(wrt.totalSupply(), 1100);
        assertEq(wrt.balanceOf(deployer), 1100);
    }

    // Test failure to pause/unpause from non-owner
    function testFailPauseByNonOwner() public {
        vm.prank(nonOwner);
        wrt.pause();
    }

    function testFailUnpauseByNonOwner() public {
        wrt.pause();
        vm.prank(nonOwner);
        wrt.unpause();
    }





}
