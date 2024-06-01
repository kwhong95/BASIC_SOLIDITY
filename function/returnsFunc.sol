// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract ReturnsFunc {

    // point!: returns에 미리 return 변수를 지정하면 해당 변수가 출력됨
    function myBlock() public pure returns (uint age, uint weight) {
        age = 20;
        weight = 55;
    }
}