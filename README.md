# Simple Crypto Payment Splitter

This repository features a robust, secure implementation of a Payment Splitter. It allows a decentralized group of contributors, partners, or creators to receive funds and claim their share of the revenue according to predefined percentages.

## How it Works
The contract follows a **Pull Payment** pattern. Instead of the contract automatically pushing funds to users (which can be gas-intensive or fail due to recipient contract logic), the contract holds the funds. Each stakeholder can then "release" their share whenever they choose.

## Key Features
- **Transparent Allocation:** Shares are set at deployment and cannot be tampered with.
- **Ether & ERC-20 Support:** Handles both native ETH and any standard ERC-20 token.
- **Gas Efficient:** Stakeholders pay for their own withdrawal transactions, protecting the primary contract balance.



## Tech Stack
- **Solidity ^0.8.20**
- **OpenZeppelin Payments Library**
- **Foundry**
