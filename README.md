# 🏦 Bank Smart Contract (Foundry)

A simple Ethereum bank smart contract built with **Solidity** and tested using **Foundry**. This project demonstrates core concepts of smart contract development including deposits, withdrawals, balance tracking, and unit testing.

---

## 📌 Overview

This contract allows users to:

* Deposit ETH into the contract
* Withdraw their ETH
* Check their account balance

All functionalities are tested using Foundry to ensure correctness and security.

---

## ⚙️ Tech Stack

* **Solidity** (Smart Contract)
* **Foundry (Forge)** for testing
* **Ethereum Virtual Machine (EVM)**

---

## ✨ Features

* ✅ Deposit ETH
* ✅ Withdraw ETH
* ✅ Track balances per user
* ✅ Prevent over-withdrawal
* ✅ Proper revert handling
* ✅ Fully tested with Foundry

---

## 🚀 Getting Started

### 1. Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

---

### 2. Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/bank-foundry.git
cd bank-foundry
```

---

### 3. Build the Project

```bash
forge build
```

---

### 4. Run Tests

```bash
forge test
```

---

## 🧪 Test Coverage

The following test cases are implemented:

* ✔️ User can deposit ETH
* ✔️ User can withdraw ETH
* ✔️ Cannot withdraw more than available balance
* ✔️ Balance updates correctly after transactions
* ✔️ Reverts on invalid operations (zero deposit/withdraw, insufficient balance)

---

## 🔒 Security Considerations

* Uses `require` statements for validation
* Prevents invalid transactions
* Uses `call` for ETH transfer (recommended approach)

---

## 📌 Contract Functions

### `deposit()`

* Allows users to send ETH to the contract
* Updates user balance

### `withdraw(uint amount)`

* Allows users to withdraw their ETH
* Checks for sufficient balance

### `getBalance(address user)`

* Returns the balance of a given address
