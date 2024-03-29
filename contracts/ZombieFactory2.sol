// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "./Ownable.sol";

contract ZombieFactory2 is Ownable {
    // 根据id查找和存储僵尸
    mapping(uint => address) public zombieToOwner;
    mapping(address => uint) ownerZombieCount;

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;

    struct Zombie {
        string name;
        uint256 dna;
        uint32 level;
        uint32 readyTime;
    }
    event NewZombie(uint256 zombieId, string name, uint256 dna);
    Zombie[] public zombies;

    function _createZombie(string memory _name, uint256 _dna) internal {
        uint256 id = zombies.length;
        uint readTime = block.timestamp;
        zombies.push(Zombie(_name, _dna, 1, uint32(cooldownTime + readTime)));
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(
        string calldata _str
    ) private view returns (uint256) {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    modifier sayHiToVitalik(string calldata _str) {
        require(ownerZombieCount[msg.sender] == 0);
        _;
    }

    function createRandomZombie(
        string calldata _str
    ) public sayHiToVitalik(_str) {
        uint256 ranDna = _generateRandomDna(_str);
        _createZombie(_str, ranDna);
    }
}
