// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {InfinityNFT} from "../src/InfinityNFT.sol";

contract InfinityNFTTest is Test {
    InfinityNFT public infinityNFT;
    address deployer = address(0x11);
    address whiteAddress1 = address(0x21);
    address whiteAddress2 = address(0x31);
    string _name = "InfinityNFT";
    string _symbol = "INF";

    function setUp() public {
        infinityNFT = new InfinityNFT(_name, _symbol);
    }
}
