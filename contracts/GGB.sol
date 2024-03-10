// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract GGB {
    uint count;
    string name;

    constructor() {
        count = 10;
        name = "ggb";
    }

    function addCount(uint _value) public {
        count = _value;
    }

    function hasName(string calldata _value) public {
        require(
            keccak256(abi.encodePacked(_value)) !=
                keccak256(abi.encodePacked(name))
        );
        name = _value;
    }
}
