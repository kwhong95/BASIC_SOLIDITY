// 이더 송수신 함수

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*
1) 이더리움 계정 (Account)
EOA(Externally Owned Account) = 외부 소유계정. 암호화페 지갑을 통해 가능(공개키/개인키)_ keccak-256(20bytes)
CA (Contract Account) = 배포 시 생성. 트랜잭션을 준 사람의 주소, 논스값을 해시화

> Global(전역 변수)
payable : 이더를 받으려면 써야. call 함수는 예외. 주소형, 함수 적용 가능(호출 동시 이더 전송 가능), 에외 ERC20
msg.sender - address 타입(주소형) : 현재 호출한 메세지의 발신자
msg.value  - uint(정수형) : 메세지와 함께 전송된 웨이(이더)의 수, 토큰을 얼마나 받았는가 = 전송 금액
address.balance : 현재 잔액(양)

withDraw : 인출을 위한 단어 = Put Out
deposit  : 예치

2) 이더 송금을 위한 함수 = 이더를 보내는 3가지 방법 : send, transfer, call - address(자료형)의 맴버함수
payable(주로 함수, 주소, 생성자에 붙여 사용)
1. send     : 2300gas 소비, 성공 여부를 리턴 = address.send()
2. transfer : 2300gas 소비, 실패 시 예외(exception) 에러 발생(revert) = address.transfer()
3. call     : 특정 함수를 호출 가능, 이더 전송도 가능 = address.call()
              가변적인 gas 소비 (gas값 지정 가능), 성공여부를 리턴
              재진입(reentrancy) 공격 위험성 있음, 2019-12 이후 call 사용 추천

3) 이더를 받는 방법 = 이더 수신을 위한 함수 
1. payble : 상태 변경성이 payble로 지정된 함수
            함수를 호출할 때 이더(ether)를 함께 송금
            호출된 함수가 payable로 지정되면 이더 수신 가능
2. receive() external payable : 컨트랙트별 최대 하나의 이더 수신 함수 receive 허용
3. fallback() external payable : 함수 호출 조건이 만족되지 않을 경우 대신 실행되는 함수
                                msg.data 비어 있으면 receive() 호출, 비어 있지 않으면 fallback() 호출
*/

/*

     Which function is called, fallback() or receive()?

            send Ether
                |
        msg.data is empty?    
            /      \
           yes     no
          /          \
recieve() exists?     fallback()
        /  \                 
      yes   no
     /        \
 receive()    fallback()

*/

// msg.value & address.balance 정의 방법
contract Ex {
    function getBalance(address _address) public view returns(uint) {
        return _address.balance; // 현재 잔액
    }

    function getMsgValue() public payable returns(uint) {
        return msg.value; // 토큰을 얼마나 받음? = 전송 금액
    }
}

contract ReceiveEther {
    receive() external payable {}
    fallback() external payable {}

    function getBalance() public view returns(uint) {
        return address(this).balance; // 현재 잔액
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value); // 전송하는 토큰의 양
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value); // 성공 및 실패 부울 값 반환
        require(sent, "Failed to send Ether"); // 실제 권장 X
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}