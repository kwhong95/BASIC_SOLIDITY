// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// 1) 추상 컨트랙트(Abstract contract) : 내부에 추상함수가 존재할 경우, 추상 컨트랙트라 함
// 추상기능 제공 = 하나 기능 이상 무조건 존재하는 함수
// 추상 함수 : 함수의 이름과 입력 매개 변수 및 출력 매개 변수만 선언에 두고 내용은 없는 함수(;)

abstract contract Animal {
    function eat() public virtual returns(bytes32);
}

contract Lion is Animal {
    function eat() public view returns(string memory) {
        return _strIn;
    }(bytes32)
}

// 추상 컨트랙트 = 추상 함수 + 비추상 함수 > 자체 기능만 존재

// 2) 인터페이스 (Interface) : 추상 계약과 유사, 인터페이스 키워드 사용해 생성
// 기능 없이, 구현만 가능 / 외부 유형만 가능 / 생성자 X / 상태변수 X / 열거형 구조체 사용 가능
// 내부의 모든 함수는 추상함수여야 함

interface BankingSystem {
    function deposit (uint) returns(uint);
    function withdraw (uint) returns(uint);
}

interface Animal {
    function eat() public virtual returns(bytes32);
}

contract DerivedContract is InterfaceContract

contract Lion is Animal {
    function eat() public view returns (string memory) {
        return _strIn;
    }(bytes32)
}

interface Animal {

    uint age; 
    constructor() {}

    function eat() public virtual returns(bytes32);
}