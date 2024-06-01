// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Loop {
    uint [] public num;

    function doWhileLoop() public {
        uint x = 0;
        do {
            num.push(x);
            x++;
        } while (x != 5);
    }

    function whileLoop() public  {
        uint x = 0;

        while (x != 5) {
            num.push(x * 2);
            x++;
        }
    }

    function forLoop() public {
        for (uint i; i < 5; i++) {
            num.push(i * 3);
        }
    }
}