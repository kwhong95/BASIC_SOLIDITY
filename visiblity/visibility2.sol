// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// uint public a = 5; 가시성 지정자 정의 방법

contract Visibility2 {
    
    uint public pub = 1; // public getter
    uint private pri = 2;
    uint internal inter = 3;
    // uint external ext = 4; 변수에는 external 사용 불가

    function funPub() public view returns(uint, uint, uint) {
        return (pub, pri, inter);
    }

    function funPriv() private view returns(uint, uint, uint) {
        return (pub, pri, inter);
    }

    function funInter() internal view returns(uint, uint, uint) {
        return (pub, pri, inter);
    }

    function funExt() external view returns (uint, uint, uint) {
        return (pub, pri, inter);
    }
}
