// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract Error {
    function testRequire(uint value) public pure {
        // require 验证是否大于10，如果不大于，则触发异常
        require(value > 10, "Input must be greater than 10");
    }

    function testRevent(uint value) public pure {
        // revert 验证是否小于等于10，通过则触发异常
        if (value <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public numValue = 0;

    function setNumValue(uint val) public {
        numValue = val;
    }

    function testAssert() public view {
        // 验证numValue是否等于0，如果不等于0，则触发异常
        assert(numValue != 0);
    }

    // 自定义错误类型，它包含两个参数 balance 和 withAmount。这个错误类型可以被用于在合约中处理特定的错误情况
    error InsufficientBalance(uint balance, uint withAmount);

    function testCustomErrorMessage(uint withAmount) public view {
        uint bal = address(this).balance;
        // 如果余额小于 withAmount，则通过 revert 语句触发一个自定义的错误信息，其中包含了余额和所需金额的值
        if (bal < withAmount) {
            revert InsufficientBalance({balance: bal, withAmount: withAmount});
        }
    }
}
