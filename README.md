# Deposit Contract

## Description

The `DepositContract` is a Solidity-based smart contract designed to allow users to deposit funds and earn interest over time. This contract represents a basic model of a deposit system with interest calculations.

## Features

- **Deposit Funds**: Users can deposit ETH into the contract.
- **Interest Accumulation**: Deposited funds earn an interest rate set in the contract.
- **Timed Withdrawals**: Users can withdraw their funds after a specified period.
- **Safety Checks**: The contract ensures that deposits meet the minimum required amount and checks for active deposits.

## Contract Details

- **Platform**: Sepolia Blockchain
- **Contract Address**: [0xc0f1285dF02c7E60F9f16f4Fa3D4F285255a3e58](https://sepolia.etherscan.io/address/0xc0f1285dF02c7E60F9f16f4Fa3D4F285255a3e58)
- **Interest Rate**: 5%
- **Minimum Deposit Amount**: 10000000000 wei
- **Withdrawal Time**: 60 seconds (1 minute, for demonstration purposes)

## Usage

1. **Deploying the Contract**: The contract can be deployed on the Sepolia blockchain. Ensure you have enough ETH to cover the gas fees.
2. **Depositing Funds**: Call the `depositFunds()` function with the amount of ETH you wish to deposit. Ensure the amount is greater than the minimum deposit amount.
3. **Checking Balance**: Use the `getBalance()` function to check the current balance of the depositor.
4. **Withdrawing Funds**: After the specified withdrawal time, call the `withdrawFunds()` function to withdraw your deposit along with the accumulated interest.

## Notes

- This contract is for demonstration purposes. Always conduct thorough testing and audits before deploying any contract in a production environment.
- Ensure you understand the terms and conditions before interacting with the contract.
