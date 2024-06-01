// external 함수 참조형 사용 시 매개변수 Calldata 지정

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Ex {
    
    function myBlock(string calldata str) 
        external 
        pure 
        returns (string memory)
    {
        return str;
    }
}