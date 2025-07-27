// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
   /*
    1.storage  ：永久性存储 :
    2.memory   ：临时存储   :运行时需要修改
    3.calldate : 临时存储   :运行时不可修改该
    4.stake
    5.codes
    6.logs
    */ 
    /*
    public 、private 、internal、external作用域 
    view :用于查询操作
    pure :用于计算操作
    */ 
contract keywords_test{

    string srtVar = "Hello World!";

    function sayHello() public view returns(string memory){
        return srtVar;
    }

    function setHello(string memory _str) public {
        srtVar = _str;
    }

    function addInfo(string memory _str) internal pure returns (string memory){
        return string.concat(_str, " from frank's  smart contract ." );
    }


}