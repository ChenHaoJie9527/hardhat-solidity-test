// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract FunctionReturns {
    //Functions can return multiple values.
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, false, 1);
    }

    // Return values can be named.
    function named() public pure returns (uint x, bool y, uint k) {
        return (1, true, 2);
    }

    // Return values can be assigned to their name.
    // In this case the return statement can be omitted.
    function assigned() public pure returns (uint x, bool y, uint k) {
        x = 1;
        y = true;
        k = 2;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple values.
    function destructuringAssigned()
        public
        pure
        returns (uint, bool, uint, uint, uint)
    {
        (uint i, bool b, uint k) = returnMany();
        (uint x, , uint y) = (4, 5, 6);
        return (i, b, k, x, y);
    }

    // Cannot use map for either input or output

    // Can use array for input
    function arrayInput(uint[] memory arr) public {}

    uint[] public list;

    function arrayOutPut() public view returns (uint[] memory) {
        return list;
    }
}
