// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;
import "./ZombieFeeding.sol";

contract zombiehelper is ZombieFeeding {
    constructor() {}

    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }

    function changeName(
        uint _zombieId,
        string calldata _newName
    ) external aboveLevel(2, _zombieId) {
        require(zombieToOwner[_zombieId] == msg.sender);
        zombies[_zombieId].name = _newName;
    }

    function changeNna(
        uint _zombieId,
        uint _newDna
    ) external aboveLevel(20, _newDna) {
        require(msg.sender == zombieToOwner[_zombieId]);
        zombies[_zombieId].dna = _newDna;
    }

    function getZombiesByOwner(
        address _owner
    ) external view returns (uint[] memory) {}
}
