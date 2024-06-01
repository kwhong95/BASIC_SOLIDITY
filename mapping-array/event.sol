// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.2 < 0.9.0;

contract Event {
    event Message(address indexed _from, address indexed  _to, string message);
    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}