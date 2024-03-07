// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract ZombieFactory2 {
    // 根据id查找和存储僵尸
    mapping(uint => address) public zombieToOwner;
    mapping(address => uint) ownerZombieCount;

    event newZombie(uint256 zombieId, string name, uint256 dna);

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }
    event NewZombie(uint256 zombieId, string name, uint256 dna);
    Zombie[] public zombies;

    function _createZombie(string calldata _name, uint256 _dna) private {
        uint256 id = zombies.length;
        zombies.push(Zombie(_name, _dna));
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(
        string calldata _str
    ) private view returns (uint256) {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string calldata _str) public {
        uint256 ranDna = _generateRandomDna(_str);
        _createZombie(_str, ranDna);
    }
}
