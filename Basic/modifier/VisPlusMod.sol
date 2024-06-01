// 함수의 가시성 지정자 + 모디파이어

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract VisPMod {
    uint public pub = 1;
    uint private pri = 2;
    uint internal inter = 3;
    // uint external ext = 4;

    function funcPub() public view returns(uint, uint, uint) {
        return (pub, pri, inter);
    }

    function funcPriv() private view returns (uint, uint, uint) {
        return (pub, pri, inter);
    }

    function funcInter() internal view returns (uint, uint, uint) {
        return (pub, pri, inter);
    }

    function funcExt() external view returns (uint, uint, uint) {
        return (pub, pri, inter);
    }
}