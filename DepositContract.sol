// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**@title DepositContract
 * @author [Ваше имя]
 * @notice This contract allows users to deposit funds and earn interest over time.
 * @dev The contract uses basic principles for deposit and interest calculations.
 */

contract DepositContract {
    uint256 public constant TIME_TO_WITHDRAW = 60; // 1 min. 
    uint256 public constant DEPOSIT_MIN_WEI_AMOUNT = 1e10;
    uint256 public constant INTEREST_RATE = 5;

    string constant DEPOSIT_AMOUNT_ERROR = "Your deposit must be greater than 10000000000 wei.";
    string constant HAVE_ACTIVE_DEPOSIT_ERROR = "You have an active deposit.";
    string constant LOCKED_FUNDS_ERROR = "Funds are still locked. Please wait until the end of your contract.";

    address public immutable sender;
    
    struct Deposit {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping (address => Deposit) public deposits;

    constructor() payable {
        sender = msg.sender;
    }

    modifier validDepositAmount() {
        require(msg.value >= DEPOSIT_MIN_WEI_AMOUNT, DEPOSIT_AMOUNT_ERROR);
        _;
    }

    modifier noActiveDeposit() {
        require(deposits[sender].amount == 0, HAVE_ACTIVE_DEPOSIT_ERROR);
        _;
    }

    modifier lockedDepositFunds() {
        require(block.timestamp >= deposits[sender].unlockTime, LOCKED_FUNDS_ERROR);
        _;
    }

    function depositFunds() public payable validDepositAmount noActiveDeposit {
        require(msg.value > DEPOSIT_MIN_WEI_AMOUNT, DEPOSIT_AMOUNT_ERROR);
        require(deposits[sender].amount == 0, HAVE_ACTIVE_DEPOSIT_ERROR);

        deposits[sender] = Deposit({
            amount: msg.value,
            unlockTime: block.timestamp + TIME_TO_WITHDRAW
        });
    }

    function withdrawFunds() public payable lockedDepositFunds {
        uint256 amount = deposits[sender].amount * INTEREST_RATE / 100;
        payable(sender).transfer(amount);
        deposits[sender].amount = 0;
        deposits[sender].unlockTime = 0;
    }

    function getBalance() public view returns(uint256) {
        return deposits[sender].amount;
    }

}