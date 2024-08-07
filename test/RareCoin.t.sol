// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {SkillsCoin} from "../src/SkillsCoin.sol";
import {RareCoin} from "../src/RareCoin.sol";

contract RareCoinTest is Test {
    RareCoin public rareCoin;
    SkillsCoin public skillsCoin;

    function setUp() public {
        rareCoin = new RareCoin();
        vm.prank(msg.sender);
        skillsCoin = new SkillsCoin();
    }

    function test_canMintSkillsCoin() public {
        skillsCoin.mint(skillsCoin.owner(), 100);
        assertEq(skillsCoin.totalSupply(), 100);
    }

    function test_approveSkillsToTransfer() public {
        skillsCoin.approve(rareCoin.owner(), 100);
        assertEq(skillsCoin.checkApprovals(rareCoin.owner()), 100);
    }

    function test_transferSkillCoinsToRareCoin() public {
        skillsCoin.mint(skillsCoin.owner(), 100);
        skillsCoin.approve(rareCoin.owner(), 100);

        console.log('skills', skillsCoin.owner(), 'rare', rareCoin.owner());
        rareCoin.trade(skillsCoin, 100);

        assertEq(skillsCoin.getBalance(skillsCoin.owner()), 0);
        assertEq(rareCoin.balanceOf(rareCoin.owner()), 100);
    }
}
