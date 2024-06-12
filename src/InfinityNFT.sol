// SPDX-License-Identifier: MIT

pragma solidity >=0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract InfinityNFT is ERC721, Ownable {
    constructor(
        string memory name_,
        string memory symbol_
    ) Ownable(msg.sender) ERC721(name_, symbol_) {}

    mapping(uint256 => string) public urls;

    function _baseURI() internal pure override returns (string memory) {
        return "";
    }

    function mint(address to, uint256 tokenId, string memory url) external {
        _mint(to, tokenId);
        urls[tokenId] = url;
    }

    function burn(uint256 tokenId) external onlyOwner {
        _burn(tokenId);
    }

    function tokenUrl(uint256 tokenId) external view returns (string memory) {
        return urls[tokenId];
    }
}
