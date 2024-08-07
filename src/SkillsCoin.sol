// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";

contract SkillsCoin {
    address public owner;
    string public name = "skills-coin";
    string public symbol = "SKILLS";
    uint256 public totalSupply;

    mapping(address => uint) public balanceOf;
    mapping(address => uint) public approvals;

    constructor() {
        owner = msg.sender;
    }

    function approve(address rareCoinAddress, uint256 yourBalanceOfSkillsCoin) public {
        approvals[rareCoinAddress] = yourBalanceOfSkillsCoin;
    }

    function checkApprovals(address _address) public view returns (uint){
        return approvals[_address];
    }

    function getBalance(address _addr) public view returns (uint)   {
        return balanceOf[_addr];
    }

    function mint(address to, uint256 amount) public {
        totalSupply += amount;
        balanceOf[to] += amount;
    }


    function transferFrom(address you, address rareCoin, uint256 yourBalanceOfSkillsCoin) public returns (bool, uint){
        require(approvals[rareCoin] >= yourBalanceOfSkillsCoin, "no address found");

        balanceOf[you] -= yourBalanceOfSkillsCoin;
        return (true, yourBalanceOfSkillsCoin);
    }

}
