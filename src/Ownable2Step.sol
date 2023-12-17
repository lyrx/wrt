// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

/**
 * @title Ownable2Step
 * @dev This contract extends the basic ownership pattern to include a two-step transfer process.
 */
contract Ownable2Step {
    address private _owner;
    address private _proposedOwner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event OwnershipProposed(address indexed currentOwner, address indexed proposedOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor(address initialOwner) {
        require(initialOwner != address(0), "Ownable2Step: new owner is the zero address");
        _owner = initialOwner;
        emit OwnershipTransferred(address(0), initialOwner);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable2Step: caller is not the owner");
        _;
    }

    /**
     * @dev Propose a new owner of the contract. Can only be called by the current owner.
     * @param proposedOwner The address proposed to become the new owner.
     */
    function proposeOwner(address proposedOwner) public onlyOwner {
        require(proposedOwner != address(0), "Ownable2Step: proposed owner is the zero address");
        _proposedOwner = proposedOwner;
        emit OwnershipProposed(_owner, proposedOwner);
    }

    /**
     * @dev Confirms the ownership transfer to the proposed owner. Can only be called by the proposed owner.
     */
    function confirmOwnership() public {
        require(msg.sender == _proposedOwner, "Ownable2Step: only proposed owner can confirm ownership");
        emit OwnershipTransferred(_owner, _proposedOwner);
        _owner = _proposedOwner;
        _proposedOwner = address(0);
    }

    /**
     * @dev Allows to renounce ownership of the contract. Can only be called by the current owner.
     * This function is virtual so it can be overridden in derived contracts.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
}
