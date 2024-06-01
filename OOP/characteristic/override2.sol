// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Lecture {
    function kind() public pure virtual returns (string memory) {
        return "Blockchain";
    }
}

contract DefiLecture is Lecture {
    function kind() public pure override returns (string memory) {
        return  "Pool Contract";
    }
}