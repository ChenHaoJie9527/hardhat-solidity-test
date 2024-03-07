// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "./ZombieFactory2.sol";

contract ZombieFeeding is ZombieFactory2 {

    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
        // 判断调用函数者是否是自己
        require(zombieToOwner[_zombieId] == msg.sender);
        // 获取属于自身的僵尸
        Zombie storage myZombie = zombies[_zombieId];
    }
}
