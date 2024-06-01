// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Practice {

    uint num = 1;

    function home1Num () public returns(uint) {
        num = num * 4;
        return num;
    }

    function home2Num(string memory a, uint b) public pure returns(string memory, uint) {
        return (a, b);
    }
}