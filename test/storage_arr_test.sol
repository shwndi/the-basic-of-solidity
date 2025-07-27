// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;
/*
1、结构体struct
2、数组
3、mapping
*/ 
contract storage_arr_test{
    string strVar = "Hello world!";
    struct Info{
    string phrase;
    uint256 id;
    address addr;
    }

    Info[] infos;

    function sayHello(uint256 _id)public view returns(string memory){
        for (uint256 i = 0; i < infos.length; i++){
            if (infos[i].id == _id){
              return addInfo(infos[i].phrase);
            }
        }
        return addInfo(strVar);
    }

    function setInfos(string memory phrase, uint256 _id) public {
        Info memory info = Info(phrase, _id, msg.sender);
        infos.push(info);
    }
    
    function addInfo(string memory phrase) internal pure returns(string memory){
        return string.concat(phrase," from flank's smart contract");
    }
}
