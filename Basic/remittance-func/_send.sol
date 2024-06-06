// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Bank {
    // 예금자 주소 => 금액
    mapping (address => uint) public balance;
    event log(bytes data);

    function deposit() public payable returns(uint) 
    {
        balance[msg.sender] += msg.value;
        return msg.value;
    }

    function withdrawByCall(address payable _addr, uint _amount) public {
        require(balance[msg.sender] > _amount, "Insufficient Balance");
        balance[msg.sender] = _amount;
        (bool success, bytes memory data) = _addr.call{ value: _amount }("");
        emit log(data);
        require(success, "Transfer Failed");
    }

    function withdrawBySend(address payable _addr, uint _amount) public {
        require(balance[msg.sender] > _amount, "Insufficient Balance");
        balance[msg.sender] = _amount;
        bool success = _addr.send(_amount);
        require(success, "Transfer Failed");
    }

    function withdrawByTransfer(address payable _addr, uint _amount) public {
        require(balance[msg.sender] > _amount, "Insufficient Balance");
        balance[msg.sender] = _amount;
        _addr.transfer(_amount);
    }

    function getMyBalance() public view returns(uint) {
        return balance[msg.sender];
    }
}