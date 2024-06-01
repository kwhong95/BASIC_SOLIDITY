/*
    Getter 함수는 선언 시 view나 pure
    View 함수는 상태를 읽을 수 있으나 상태를 수정할 수 없음
    Pure 함수는 상태 읽기 또는 수정을 금함  
*/

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Mod_1 {
    function myblock (uint a) public pure returns (uint) {
        return  a;
    }
}