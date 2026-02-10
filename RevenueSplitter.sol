// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

/**
 * @title RevenueSplitter
 * @dev A secure contract to split ETH and ERC20 payments between multiple addresses.
 */
contract RevenueSplitter is PaymentSplitter {
    /**
     * @dev Initialize the splitter with payees and their respective shares.
     * @param payees List of addresses receiving the funds.
     * @param shares_ List of weights/shares assigned to each payee.
     */
    constructor(address[] memory payees, uint256[] memory shares_)
        PaymentSplitter(payees, shares_)
    {}

    /**
     * @notice Fallback function to receive ETH.
     */
    receive() external payable override {
        super.receive();
    }
}
