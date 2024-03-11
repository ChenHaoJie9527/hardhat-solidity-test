// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;
import "./ZombieFeeding.sol";

contract zombiehelper is ZombieFeeding {
    constructor() {}

    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }
}
