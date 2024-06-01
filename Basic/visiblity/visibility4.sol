// This로 내부 접근 가능한 external 함수

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Vis4 {
    
    function funExt() external pure returns(uint) {
        return 2;
    }

    function outPutExt() public view returns(uint) {
        return this.funExt();
    }
}