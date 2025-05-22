// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

contract Bank {

    mapping(address => uint) _balances;

    function deposit (uint _amount) public {
        _balances[msg.sender] += _amount;
    }

    function transfer (address _to, uint _amount) public {
        require(_to != address (0), "Address 0");
        require(_balances[msg.sender] >= _amount, "Not enough funds");
        _balances[_to] += _amount;
        _balances[msg.sender] -= _amount;
    }

    function getBalance (address _address) public view returns (uint) {
        return _balances[_address];
    }
}