// SPDX-License-Identifier: MIT

pragma solidity >=0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./libraries/CustomCounter.sol";

contract InfinityNFT is ERC721, Ownable {
    CustomCounter.Counter private _tokenIdCounter;

    constructor(string memory name_, string memory symbol_) Ownable(msg.sender) ERC721(name_, symbol_) {
        _tokenIdCounter = CustomCounter.Counter(0);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "";
    }

    function mint(address to) external {
        uint256 tokenId = _tokenIdCounter._value;
        _mint(to, tokenId);
        CustomCounter.increment(_tokenIdCounter);
    }

    function burn(uint256 tokenId) external onlyOwner {
        _burn(tokenId);
    }
}
