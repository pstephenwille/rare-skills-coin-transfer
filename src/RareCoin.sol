// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";

import "./SkillsCoin.sol";

contract RareCoin {
    address public owner;
    string public name = "rare-coin";
    string public symbol = "RARE";
    uint256 public totalSupply;

    mapping(address => uint) public balanceOf;

    constructor() {
        owner = msg.sender;
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "only owner can create tokens");
        totalSupply += amount;
        balanceOf[to] += amount;
    }

    function trade(SkillsCoin skills, uint amount) public {
        (bool ok, uint result) =  skills.transferFrom(skills.owner(), owner, amount);

//        (bool ok, bytes memory result) = skills.owner().call(abi.encodeWithSignature("transferFrom(address,address,uint256)", skills.owner(), owner, amount));
        require(ok, "transfer failed");

        balanceOf[owner] += result;
    }




    function transfer(address to, uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "you aint rich enough");
        require(to != address(0), "cannot send to address(0)");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
}
