// Enum
// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Enum { 
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    function setGoStraight () public {
        choice = ActionChoices.GoStraight;
    }

    /* 
    열거형은 ABI의 일부가 아니므로 "getChoice"의 서명이다.
    자동으로 "getChoice() returns(uint8)"로 변경된다.
    솔리디티 외부의 모든 문제에 대해 사용된 정수 유형은 다음과 같다
    모든 열거값을 저장할 수 있을 만큼 충분히 크다. 즉, 더 많은 값이 있는 경우,
    uint16 등이 사용될 것이다.
    */

    function getChoice() public view returns (ActionChoices) {
        return choice;
    }

    function getDefaultChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }
}