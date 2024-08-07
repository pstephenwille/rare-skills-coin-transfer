// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {RareCoin} from "../src/RareCoin.sol";

contract CounterScript is Script {
    RareCoin public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new RareCoin();

        vm.stopBroadcast();
    }
}
