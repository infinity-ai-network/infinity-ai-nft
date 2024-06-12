// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {console} from "forge-std/Script.sol";
import "utils/BaseScript.sol";
import {InfinityNFT} from "../src/InfinityNFT.sol";

contract InfinityNFTDeployScript is BaseScript {
    uint256 deployerKey;

    function setUp() public {}

    function deploy() public {
        deployerKey = vm.envUint("DEPLOYER_KEY");
        vm.addr(deployerKey);
        vm.startBroadcast(deployerKey);
        InfinityNFT infinity = new InfinityNFT("InfinityAI", "INF");
        logAddr(address(infinity), "Infinity NFT");
        vm.stopBroadcast();
    }
}
