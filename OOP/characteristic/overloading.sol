// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Overloading {
    
    function get(uint _i) public  pure returns (uint) {
        return _i;
    }
    
    function get(bool _b) public  pure returns (bool) {
        return _b;
    }
}