// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Number {
    uint private num = 4;
    function changeNum5() public {
        num = 5;
    }
    function getNum() public view returns(uint) {
        return num;
    }
}

contract Caller {
    Number internal instance = new Number();

    function changeNumber() public {
        instance.changeNum5();
    }
    function getNumber() public view returns(uint) {
        return instance.getNum();
    }
}