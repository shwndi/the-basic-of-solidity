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
    storage_map_test hw;
    storage_map_test[] hws;

    function createHelloWorld() public {
        hw = new storage_map_test();
        hws.push(hw);
    }

    function getHelloWorlds(uint256 _index) public view returns(storage_map_test ){
        return hws[_index];
    }

    function sayHelloWorldFromFactory(uint256 _index,uint256 _id) public view returns (string memory) {
        return hws[_index].sayHello(_id);
    }

    function setInfosFromFactory(uint256 _index, string memory phrase, uint256 _id) public {
        hws[_index].setInfos(phrase, _id);
    }

    
}