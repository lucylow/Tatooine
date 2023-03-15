pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract TravelNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct VacationLocation {
        string name;
        string imageURI;
    }

    mapping(uint256 => VacationLocation) private _vacationLocations;

    constructor() ERC721("TravelNFT", "TNFT") {}

    function mintNFT(string memory name, string memory imageURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        // _setTokenURI(newItemId, imageURI);

        VacationLocation memory location = VacationLocation(name, imageURI);
        _vacationLocations[newItemId] = location;

        return newItemId;
    }

    function getLocation(uint256 tokenId)
        public
        view
        returns (string memory, string memory)
    {
        VacationLocation memory location = _vacationLocations[tokenId];
        return (location.name, location.imageURI);
    }
}
