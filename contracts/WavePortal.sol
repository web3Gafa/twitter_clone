// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    event NewWave(address indexed from, uint256 timestamp,string message);

    struct Wave{
        address waver;
        string message;
        uint256 timestamp;

    }
     /*
     * I declare a variable waves that lets me store an array of structs.
     * This is what lets me hold all the waves anyone ever sends to me!
     */
    Wave[] waves;




    mapping(address => uint256) wavePerWaver;

    constructor() payable {
        console.log("Building something on web3 tech , kudos buildspace");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

        // increase the number of waves by the user
        wavePerWaver[msg.sender] += 1;

        // storing wave data
        waves.push(Wave(msg.sender,_message,block.timestamp));


        // emiting an event when we fire an event
        emit NewWave(msg.sender, block.timestamp, _message);

        //sending some ether to people
        uint256 prizeAmount = 0.0001 ether;

        require(
            prizeAmount <= address(this).balance,
            "Trying to withdrwa more money than the contract  has."
        );

        (bool success,) = (msg.sender).call{value:prizeAmount}("");
        require(success, "Failed to withdraw money from contract");


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

    // getting all the waves 
    function getAllWaves() public view returns (Wave[] memory){
        return waves;
    }
}
