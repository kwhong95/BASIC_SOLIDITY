// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract St1 {
    // 상태 변수 : 블록체인에 저장 기록됨. 외부 선언 가능
    string public a = "Hello solidity";
    uint public b = 1;

    function getStr() public {
         // 지역 변수 : 블록체인에 기록 X, 내부 선언 가능
        uint c = 2;

        // 전역 변수 
        uint d = block.timestamp; // 현재 블록의 타임스탬프(시간 기록)
        address e  = msg.sender; // 부탁한 사람의 주소
    }
}