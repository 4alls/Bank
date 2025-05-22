// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

contract Bank {

    mapping(address => uint) _balances;

    function getBalance (address _address) public view returns (uint) {
        return _balances[_address];
    }
}