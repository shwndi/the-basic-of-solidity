//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract FundToken{
    // 1、通证名称
    // 2、通证简称
    // 3、通证数量
    // 4、owner的地址
    // 5、通证的合约地址对应的余额

    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;
    address public owner;
    mapping (address => uint256) public balances;

    constructor(string memory _tokenName, string memory _tokenSymbol){
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        owner = msg.sender;
    }

    //mint: 获取通证
    function mint(uint256 amount) external {
        totalSupply += amount;
        balances[msg.sender] += amount;
    }
    //转账
    function transfer(address payee, uint256 amount) external {
        require(balances[msg.sender] >= amount, "balance is not enough");
        balances[msg.sender] -= amount;
        balances[payee] += amount;
    }
    //查看
    function getBalance(address addr) external view returns(uint256){
        return balances[addr];
    }
    
}