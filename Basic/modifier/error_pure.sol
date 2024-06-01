// pure 잘못 적용한 예

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract ErrPure {
    uint a = 3;

    function myBlock() public pure returns (uint) {
        // Error : 함수 외부 변수를 내부로 가져올 수 없음
        a = 7;
        return a;
    }
}