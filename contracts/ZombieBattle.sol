// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import "./Zombiehelper.sol";

contract ZombieBattle is Zombiehelper {
    uint randNonce = 0;

    function randMod(uint _modulus) internal returns (uint) {
        randNonce++;
        return (uint(keccak256(block.timestamp, msg.sender, randNonce)) %
            _modulus);
    }
}
