// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {InfinityNFT} from "../src/InfinityNFT.sol";

contract InfinityNFTTest is Test {
    InfinityNFT public infinityNFT;
    address deployer = address(0x11);
    address toAddress = address(0x21);
    string _name = "InfinityNFT";
    string _symbol = "INF";

    function setUp() public {
        infinityNFT = new InfinityNFT(_name, _symbol);
    }

    function test_mintWithBytes() public {
        uint256 tokenId = 2;
        string memory url = '{"name": "InfinityNFT #0","description": "InfinityAI is an first one AIGC creator platform focused on Bitcoin ecosystem, integrating creation, trading, and community interaction.","image": "https://infinity-data-cdn.s3.ap-southeast-1.amazocampaign/ad9004e1-6d22-467c-b445-06af785bd1d4.png","external_url": "https://app.infinityai.network/","attributes": [{ "trait_type": "Trait Type", "value": "Trait Value" }]}';

        infinityNFT.mint(toAddress, tokenId, url);

        string memory r = infinityNFT.tokenURI(tokenId);

        console.log(r);
    }
}
