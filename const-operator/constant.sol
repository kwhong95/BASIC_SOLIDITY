// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Constants {
    // coding convention to uppercase constant variables
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public  constant MY_UINT = 123;
}

contract TEST {
    string public constant name = "TEST token"; 
    string public constant symbol = "TEST";
    uint public constant decimals = 18; // 소수점 18자리까지 사용
    uint public constant INITIAL_SUPPLY = 1000 * 10 ** decimals;
    // 초기 발행량은 1000.00000000000000000 (소수점 18자리까지 사용)
    string constant test = "You can not see this"; // public 표시 없는 경우 해당 문구 볼 수 없음
}

