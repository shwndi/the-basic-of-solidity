// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract storage_map_test{
    string strVar = "Hello world!";
    struct Info{
        string phrase;
        uint256 id;
        address addr;
    }
    mapping(uint256 id => Info info)  infoMapping;

    function sayHello(uint256 _id) public view returns (string memory){
        if (infoMapping[_id].addr != address(0x0)){
         return addInfo(infoMapping[_id].phrase);  
        }
        return addInfo(strVar);
    }
    function setInfos(string memory phrase, uint256 _id) public {
        Info memory info = Info(phrase, _id, msg.sender);
        infoMapping[_id] = info;
    }

    function addInfo(string memory phrase) internal pure returns(string memory){
        return string.concat(phrase," from flank's smart contract");
    }

}
