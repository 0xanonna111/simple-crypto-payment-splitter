// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./RevenueSplitter.sol";

contract RevenueSplitterTest is Test {
    RevenueSplitter public splitter;
    address public partnerA = address(0x111);
    address public partnerB = address(0x222);

    function setUp() public {
        address[] memory payees = new address[](2);
        payees[0] = partnerA;
        payees[1] = partnerB;

        uint256[] memory shares = new uint256[](2);
        shares[0] = 70; // 70%
        shares[1] = 30; // 30%

        splitter = new RevenueSplitter(payees, shares);
    }

    function testSplitEther() public {
        // Send 10 ETH to the splitter
        vm.deal(address(this), 10 ether);
        (bool success, ) = address(splitter).call{value: 10 ether}("");
        require(success);

        // Check Partner A's pending share (70% of 10 = 7 ETH)
        uint256 initialBal = partnerA.balance;
        splitter.release(payable(partnerA));
        assertEq(partnerA.balance - initialBal, 7 ether);
    }
}
