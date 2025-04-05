// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FunMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        // us -> FundMeTest -> FundMe
        fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        console.log("msg.sender: ", address(this));
        console.log("i_owner: ", fundMe.i_owner());
        assertEq(fundMe.i_owner(), address(this));
    }
}
