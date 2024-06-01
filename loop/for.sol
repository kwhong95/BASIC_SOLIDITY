// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.2 < 0.9.0;

contract For {
    
    function fun1() public pure returns(uint) {
        uint result = 0;
        for (uint a = 0; a < 3; ++a) {
            result = result + a;
        }
        return result;
    }
}