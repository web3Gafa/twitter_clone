// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) wavePerWaver;

    constructor() {
        console.log("Building something on web3 tech , kudos buildspace");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

        // increase the number of waves by the user
        wavePerWaver[msg.sender] += 1;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We  have %d total waves", totalWaves);
        return totalWaves;
    }

    // function to get wave per Waver
    function getWavesPerWaver() public view returns (uint256) {
        console.log("%s has has waved  %d times ",msg.sender, wavePerWaver[msg.sender]);
        return 1;
    }
}
