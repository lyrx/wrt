// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "ds-test/test.sol";
import "../src/Ownable2Step.sol"; // Adjust the path as necessary
import "forge-std/Test.sol";

contract Ownable2StepTest is DSTest, Test {
    Ownable2Step ownable;
    address deployer;
    address proposedOwner;

    function setUp() public {
        deployer = address(this);
        proposedOwner = address(0x12345);
        ownable = new Ownable2Step(deployer);
    }

    function testInitialOwner() public {
        assertEq(ownable.owner(), deployer);
    }

    function testProposeAndConfirmOwnership() public {
        ownable.proposeOwner(proposedOwner);
        vm.prank(proposedOwner);
        ownable.confirmOwnership();
        assertEq(ownable.owner(), proposedOwner);
    }

    function testNotConfirmOwnershipByNonProposed() public {
        ownable.proposeOwner(proposedOwner);
        ownable.confirmOwnership(); // Should fail since it's not called by the proposed owner
        assertEq(ownable.owner(), deployer);
    }

    function testFailProposeOwnerByNonOwner() public {
        vm.prank(address(0xdead));
        ownable.proposeOwner(proposedOwner); // Should fail since it's not called by the owner
    }

    function testRenounceOwnership() public {
        ownable.renounceOwnership();
        assertEq(ownable.owner(), address(0));
    }

    function testFailRenounceOwnershipByNonOwner() public {
        ownable.proposeOwner(proposedOwner);
        vm.prank(proposedOwner);
        ownable.confirmOwnership();
        ownable.renounceOwnership(); // Should fail since the original deployer is no longer the owner
    }
}
