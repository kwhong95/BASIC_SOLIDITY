// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract fs_1 {
    uint public  a = 3; // 상태변수 : 외부 접근 가능, 언제든지 변화 가능

    function myFin1() external view returns(uint, uint) {
        uint b = 4; // 지역 변수 : 내부 사용 가능
        return (a, b);
    } 
}