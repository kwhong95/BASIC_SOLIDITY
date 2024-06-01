// view 잘못 적용 예

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract ErrView {
    int public a = 3;

    function myBlock() public view returns (uint) {
        // Error : view 함수 내부에서 변수 변경은 불가
        a = 4;
        return a;
    }
}