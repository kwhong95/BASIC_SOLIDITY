// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// uint public a = 5; 가시성 지정자 정의 방법

contract Visibility {
    uint a = 3;
    uint public b = 2;
    uint public constant c = 5;
}

