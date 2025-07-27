// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/*
引入合约的三种方式：
1、在同一文件系统中引入合约  ：import { storage_map_test } from "../storage_map_test.sol";
2、引入 GitHub 上的合约     ：import { storage_map_test } from "https://github.com/smartcontractkit/Web3_tutorial_Chinese/blob/main/lesson-2/HelloWorld.sol";
3、通过包引入               ：import { storage_map_test } from "@companyName/product/contract";
*/ 
import { storage_map_test } from "../storage_map_test.sol";
import { HelloWorld } from "https://github.com/smartcontractkit/Web3_tutorial_Chinese/blob/main/lesson-2/HelloWorld.sol";

contract HelloWarldFactory{

    
}