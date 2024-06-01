// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract BlockChainDeveloper {
    string public major = "Blockchain";
    uint public exerienceYears = 0;
} 

contract WebDeveloper {
    string public _major = "Web";
    uint public _exerienceYears = 3;
} 

contract Kyle is BlockChainDeveloper, WebDeveloper {
    uint public totalExerienceYears = exerienceYears + _exerienceYears;
}