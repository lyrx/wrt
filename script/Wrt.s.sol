pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "../src/Wrt.sol";

contract DeployScript is Script {
    function run() public {
        uint256 privateKey = uint256(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(privateKey);
        //new Wrt("WRT Token", "WRT", 1000);  // Adjust parameters as needed
        vm.stopBroadcast();
    }
}
