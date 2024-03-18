// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import "./ZombieFactory2.sol";

// abstract 标记为抽象类
abstract contract KittyInterface {
    // virtual 虚拟函数 不需要具体实现
    function getKitty(
        uint256 _id
    )
        external
        view
        virtual
        returns (
            bool isGestating,
            bool isReady,
            uint256 cooldownIndex,
            uint256 nextActionAt,
            uint256 siringWithId,
            uint256 birthTime,
            uint256 matronId,
            uint256 sireId,
            uint256 generation,
            uint256 genes
        );
}

contract ZombieFeeding is ZombieFactory2 {
    KittyInterface kittyContract;

    function setKittyContractAddress(address _adds) external onlyOwner {
        kittyContract = KittyInterface(_adds);
    }

    modifier ownerOf(uint _zombieId) {
        require(msg.sender == zombieToOwner[_zombieId]);
        _;
    }

    function feedAndMultiply(
        uint _zombieId,
        uint _targetDna,
        string memory _species
    ) internal ownerOf(_zombieId) {
        // 判断调用函数者是否是自己
        // require(zombieToOwner[_zombieId] == msg.sender);
        // 获取属于自身的僵尸
        Zombie storage myZombie = zombies[_zombieId];
        // 检查僵尸冷却周期是否结束
        require(_isReady(myZombie));
        _targetDna = _targetDna % dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;
        if (keccak256(abi.encodePacked(_species)) == keccak256("kitty")) {
            newDna = newDna - (newDna % 100) + 99;
        }
        string memory isName = "name1";
        _createZombie(isName, newDna);
        _triggerCooldown(myZombie);
    }

    // 僵尸部署将触发冷却周期器
    function _triggerCooldown(Zombie storage _zombie) internal {
        _zombie.readyTime = uint32(cooldownTime + block.timestamp);
    }

    // 判断下次允许捕食时间是否已经到了
    function _isReady(Zombie storage _zombie) internal view returns (bool) {
        return (_zombie.readyTime <= block.timestamp);
    }

    function feedOnKitty(uint _zombieId, uint _kittyId) public {
        uint kittyDna;
        (, , , , , , , , , kittyDna) = kittyContract.getKitty(_kittyId);
        string memory speciesName = "kitty";
        feedAndMultiply(_zombieId, kittyDna, speciesName);
    }
}
