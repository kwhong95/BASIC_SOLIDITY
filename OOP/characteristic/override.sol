// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Student {
    function major() public pure virtual returns(string memory) {
        return "Student";
    }
}

contract BlockchainStudent is Student {
    function major() public pure override returns(string memory) {
        return "Blockchain";
    }
}