// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Bank {
    mapping(address => uint256) private balances;

    function deposit() external payable {
        require(msg.value > 0, "Deposit must be > 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");
    }

    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }
}
