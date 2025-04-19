// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract QuickNodeNFT is ERC721URIStorage, Ownable {
    constructor() ERC721("QuickNode Sharks", "QNS") Ownable(msg.sender) {}

    function mint(
        address _to,
        uint256 _tokenId,
        string calldata _uri
    ) external onlyOwner {
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _uri);
    }
}

// {
//   "name": "bear 2 the incredible liviong bear",
//   "description": "bear 2 the incredible liviong bear, this is an incredible one ",
//   "image": "ipfs://bafkreigq4li5emwa77ibch6ysqz5nfanx3lhpku4uv2xgq7sfsek5s7eya"
// }

// Check readme.md file
