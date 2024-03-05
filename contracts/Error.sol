// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract Error {
    function testRequire(uint value) public pure {
        // require 验证是否大于10，如果不大于，则触发异常
        require(value > 10, "Input must be greater than 10");
    }

    function testRevent(uint value) public pure {
        // revert 验证是否小于等于10，通过则除非异常
        if (value <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public numValue;

    function testAssert() public view {
        assert(numValue == 0);
    }

    error InsufficientBalance(uint balance, uint withAmount);

    function testCustomErrorMessage(uint withAmount) public view {
        uint bal = address(this).balance;
        if (bal < withAmount) {
            revert InsufficientBalance({balance: bal, withAmount: withAmount});
        }
    }
}
