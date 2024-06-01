// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.2 < 0.9.0;

contract While {
    
    function func() public pure returns (uint) {
        uint result = 0;
        uint a = 3;
        while (a > 0){
            result += a;
            --a;
        }

        return result;
    }
}