// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// 스토리지 데이터 영역에서만 사용 가능한 특수 참조형
// 상태 변수 또는 스토리지 참조형으로만 선언 가능

// 해시 테이블 > 키 값에 대응되는 값을 저장하는게 매핑의 특징
// 해시 테이블은 유형확인 철저, 선언할 때 키와 값의 유형을 반드시 선언

// mapping(address => int) public fast;
// countainKey() 함수 > 누락된 키값을 얻으려하면 기본값 반환

// fast 매핑 존재하지 않는 주소의 잔액을 얻으려하면 당연히 0 반환

// int missingAddressBalance = coinBalance[0x6C14229102d902...]; // missingAddressBalance = 0;

// 매핑에 쓰이는 자료형을 반환

contract Ex {
    mapping(address => uint) public balances;

    function addMapping(address _key, uint _amount) public {
        balances[_key] = _amount;
    }

    function getMapping(address _key) public view returns(uint) {
        return balances[_key];
    }

    function deleteMapping(address _key) public {
        delete(balances[_key]);
    }

    function deleteMapping2(address _key) public {
        balances[_key] = 0;
    }
}
