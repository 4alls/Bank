// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

/// @title Decentralized Bank
/// @author Thibaut Baudry
/// @notice Contrat basique représantant une banque Web3

contract Bank {

    mapping(address => uint) _balances;

    /// @notice Dépot d'un montant sur un compte
    /// @param _amount Le montant
    function deposit (uint _amount) public {
        _balances[msg.sender] += _amount;
    }

    /// @notice Transfère d'un montant d'un compte à un autre
    /// @param _amount Le montant
    function transfer (address _to, uint _amount) public {
        require(_to != address (0), "Address 0");
        require(_balances[msg.sender] >= _amount, "Not enough funds");
        _balances[_to] += _amount;
        _balances[msg.sender] -= _amount;
    }

    /// @notice Récupère la balance de l'addresse entrée en paramètre
    /// @return uint La balance de l'addresse 
    function getBalance (address _address) public view returns (uint) {
        return _balances[_address];
    }
}