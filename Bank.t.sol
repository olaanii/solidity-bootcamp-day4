// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {
    Bank bank;

    address user = address(1);

    function setUp() public {
        bank = new Bank();
        vm.deal(user, 10 ether); // give user ETH
    }

    function testDeposit() public {
        vm.prank(user);
        bank.deposit{value: 1 ether}();

        uint256 balance = bank.getBalance(user);
        assertEq(balance, 1 ether);
    }

    function testWithdraw() public {
        vm.startPrank(user);

        bank.deposit{value: 2 ether}();
        bank.withdraw(1 ether);

        uint256 balance = bank.getBalance(user);
        assertEq(balance, 1 ether);

        vm.stopPrank();
    }

    function testCannotWithdrawMoreThanBalance() public {
        vm.startPrank(user);

        bank.deposit{value: 1 ether}();

        vm.expectRevert("Insufficient balance");
        bank.withdraw(2 ether);

        vm.stopPrank();
    }

    function testBalanceUpdatesCorrectly() public {
        vm.startPrank(user);

        bank.deposit{value: 3 ether}();
        bank.withdraw(1 ether);

        uint256 balance = bank.getBalance(user);
        assertEq(balance, 2 ether);

        vm.stopPrank();
    }

    function testRevertOnZeroDeposit() public {
        vm.prank(user);

        vm.expectRevert("Deposit must be > 0");
        bank.deposit{value: 0}();
    }

    function testRevertOnZeroWithdraw() public {
        vm.startPrank(user);

        bank.deposit{value: 1 ether}();

        vm.expectRevert("Amount must be > 0");
        bank.withdraw(0);

        vm.stopPrank();
    }
}
