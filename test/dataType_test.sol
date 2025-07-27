// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.30;

// Comment ：this is my first smart contract.
contract dateType_test{
    //boolean
    bool boolVar_1 = true;
    bool boolVar_2 = false;

    //无符号
    //0--255
    uint8  unit8Var = 123;
    //0--2^256-1 ：uint256==uint
    uint256 unit256 = 456;

    //有符号 int == int256
    //-128--127
    int8 int8Var = -123;
    //-2**255--2**255-1
    int256 int256Var = -456;

    //字符串 bytes 在bytes中是最大的
    bytes8 bytesVar = "hello";
    bytes32 bytes32Var = "helloWorld";
    string stringVar = "hello world";

   //地址
    address addrVar = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
   
   //function 可见度：public private internal external
   //view ：只对变量进行读取而不修改
   //memory：代表string变量一种存储状态     
  
    function sayHello() public view returns(string memory) {
        return addInfo(stringVar);
    }
    
 
    function setHelloWorld (string memory newString) public{
        stringVar = newString;
    }
    
    function addInfo(string memory helloWorldStr) internal pure returns (string memory){
        return string.concat(helloWorldStr,"from frank's contract");
    }
}