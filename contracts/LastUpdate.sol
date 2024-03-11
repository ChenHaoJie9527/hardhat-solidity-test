// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract LastUpdate {
    uint lastDate;

    constructor() {
        // lastDate = now; // now 已弃用，使用block.timestamp替换
        updateTimeStamp();
    }

    // 将上次更新时间设置为现在
    function updateTimeStamp() public {
        lastDate = block.timestamp;
    }

    function fiveMinutesHavePassed() public view returns (bool) {
        return (block.timestamp >= (lastDate + 5 minutes));
    }
}
