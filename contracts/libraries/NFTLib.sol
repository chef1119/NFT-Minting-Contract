// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library NFTLib {

    bytes32 constant DIAMOND_STORAGE_POSITION = keccak256("diamond.standard.diamond.storage");

    struct NFTStorage {
        uint256 seed;
    }

    function dogStorage() internal pure returns(NFTStorage storage ds) {
        bytes32 position = DIAMOND_STORAGE_POSITION;
        assembly {
            ds.slot := position
        }
    }

    function rand() internal returns(uint256) {
        NFTStorage storage ds = dogStorage();
        ds.seed = uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, ds.seed)));
        return ds.seed;
    }

    function randInRange(uint256 min, uint256 max) internal returns(uint256) {
        require(min < max, "NFTLIB: Invalid range of random");

        uint256 randval = rand();
        uint256 range = max - min + 1;

        return (randval % range + min);
    }

    function chance() internal returns(uint256) {
        uint256 randval = randInRange(1, 100);
        if(randval <= 5) return 0;
        if(randval <= 15) return 1;
        if(randval <= 35) return 2;
        if(randval <= 60) return 3;
        return 4;
    }
}