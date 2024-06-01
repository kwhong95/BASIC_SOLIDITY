// 함수의 매개변수 및 반환값

/*
    Solidity는 스토리지 / 메모리 / 콜데이터 / 스택 이라는 4개 영역이 존재

    매개변수 혹은 반환값으로 참조타입을 사용할 때, 4개의 저장 영역 중 하나의 저장영역을 함께 명시해야 함
    스토리지 : 데이터가 영구적으로 저장되는 공간
    메모리 : 단기적으로만 데이터를 저장하는 공간
    콜데이터 : 트랜잭션 또는 콜 함수의 매개변수가 유지되는 읽기전용 공간
    스택 : 이더리움 가상머신에서 휘발성을 가진 데이터를 유지 및 관리하는 공간
*/

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract FuncSaveErea {
    function getValue(uint a) public pure returns(uint) {
        return a;
    }

    function getReference(string memory a) public pure returns (string memory) {
        return a;
    }
}