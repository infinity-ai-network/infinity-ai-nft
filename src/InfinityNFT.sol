// SPDX-License-Identifier: MIT

pragma solidity >=0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract InfinityNFT is ERC721, Ownable {
    using Strings for uint256;

    constructor(
        string memory name_,
        string memory symbol_
    ) Ownable(msg.sender) ERC721(name_, symbol_) {}

    mapping(uint256 => string) private _tokenURIs;

    function setTokenURI(uint256 tokenId, string memory uri) internal {
        _tokenURIs[tokenId] = uri;
    }

    function mint(address to, uint256 tokenId, string memory uri) external {
        _mint(to, tokenId);
        setTokenURI(tokenId, uri);
    }

    function burn(uint256 tokenId) external onlyOwner {
        _burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "ERC721Metadata: URI query for nonexistent token");

        return _tokenURIs[tokenId];
    }
}
