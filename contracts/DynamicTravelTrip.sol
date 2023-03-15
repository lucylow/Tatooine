pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract GameItem is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string[] IpfsUri = [
        "https://ipfs.io/ipfs/k51qzi5uqu5dis17f8zwdlju032o4kvs72yeu8j37kak4bhg1knds1hi3z9lwm/Dubai%20Burj%20Khalifa.json",
        "https://ipfs.io/ipfs/k51qzi5uqu5dis17f8zwdlju032o4kvs72yeu8j37kak4bhg1knds1hi3z9lwm/Dubai%20Burj%20Al%20Arab.json",
        "https://ipfs.io/ipfs/Qk51qzi5uqu5dis17f8zwdlju032o4kvs72yeu8j37kak4bhg1knds1hi3z9lwm/Dubai%20Palm%20Jumeirah%20man-made%20island.json"
    ];

    constructor() ERC721("DynamicTravelTrip", "DTT") {}

    function awardItem(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        _tokenIds.increment();
        return newItemId;
    }

    function growTravel(uint256 _tokenId) public {
        if(travelStage(_tokenId) >= 2){return;}
        //Get the current stage of the travel trip of TravelNFT.sol and add 1
        uint256 newVal = travelStage(_tokenId) + 1;
        //store the new URI
        string memory newUri = IpfsUri[newVal];
        //Update the URI
        _setTokenURI(_tokenId, newUri);
    }


}