// 대입 연산자

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Operactor {
    string a = "Hello";
    uint b = 5;
    uint c = 5;
    uint d = 5;
    uint e = 5;
    uint f = 5;

    function assignment() public returns (string memory, uint, uint, uint, uint, uint) {
        // 복합할당연산자
        a = 'Hello Solidity';
        b += 2; // b = b + 2
        c -= 2; // c = c - 2
        d *= 2; // d = d * 2
        e /= 2; // e = e / 2
        f %= 2; // f = f % 2
        return  (a, b, c, d, e, f);
    }
}

/* decoded output
{
	"0": "string: Hello Solidity",
	"1": "uint256: 7",
	"2": "uint256: 3",
	"3": "uint256: 10",
	"4": "uint256: 2",
	"5": "uint256: 1"
}
*/ 
