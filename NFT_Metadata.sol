// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.2/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.2/contracts/utils/Counters.sol";

contract TravelNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct NFTMetadata {
        string location;
        string landmarks;
        string time;
        string photographer;
        string rarity;
        string sizeAndResolution;
        string additionalMedia;
    }

    mapping(uint256 => NFTMetadata) private _tokenMetadata;

    constructor() ERC721("TravelNFT", "TNFT") {}

    function createNFT(address owner, string memory tokenURI, NFTMetadata memory metadata) public returns (uint256) {
        _tokenIds.increment();

        uint256 newTokenId = _tokenIds.current();
        _mint(owner, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        _tokenMetadata[newTokenId] = metadata;

        return newTokenId;
    }

    function getTokenMetadata(uint256 tokenId) public view returns (NFTMetadata memory) {
        return _tokenMetadata[tokenId];
    }
}
