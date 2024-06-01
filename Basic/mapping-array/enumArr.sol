// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 < 0.9.0;

// enum은 나열형, 연관된 상수를 묶어 값을 지정하는 자료형
// 같은 이름을 가지게 되는 상수끼리 충돌 방지, 가독성 높임

enum Fruits { apple, banana, peach }
enum Ranking { gold, silver, bronze }

contract Arr {
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];

    function get(uint i) public view returns (uint) {
        return arr[i];
    }
}

contract ArrayRemoveByShifting {
    uint[] public arr;
    function test() external {
        arr = [1, 2, 3, 4, 5];
    }
}