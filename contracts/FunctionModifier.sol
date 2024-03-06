// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked = false;

    constructor() {
        owner = msg.sender;
    }

    // modifier 函数，用于在函数调用前执行，或者调用后运行代码
    // 该类型函数可以用于判断一个函数是否具备运行的条件，并且可以复用到其他的函数
    // 用于限制只有合约的所有者才能调用某些函数
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _; // 占位符Next，一旦上面的require验证通过，就会执行占位符next代码
    }

    // 验证地址的有效性，确保传入的地址不是零地址
    modifier validAddress(address adds) {
        require(adds != address(0), "Not valid address");
        _;
    }

    // 此处使用onlyOwner修饰符函数，确保只有当前合约所有者才能更改合约的所有者地址
    // 此处使用validAddress修饰符函数，确保传入的合约地址必须是有效的
    function changeOwner(address _owner) public onlyOwner validAddress(_owner) {
        owner = _owner;
    }

    // 防止重入攻击，重入攻击是一种常见的智能合约安全漏洞，通过在函数执行过程中再次调用该函数来攻击合约
    // 通过锁定 设置 locked为true防止函数被重入，等函数执行完毕后解锁设置locked为false
    modifier noReentrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
