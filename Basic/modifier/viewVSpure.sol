// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract ViewAndPure {
    uint public x = 1;

    // 상태를 수정하지 않겠다고 약속
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // 상태를 수정하거나 읽지 않겠다 약속
    function add (uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}