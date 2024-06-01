// 상태 변수

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract SolidityTest {
    uint storedData;          // 상태변수
    constructor() {           // 생성자는 하나만 저장해준다.
    storedData = 10;          // 상태 변수 사용하기
    }
}