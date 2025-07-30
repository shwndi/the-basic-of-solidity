// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {FundMe} from "./FundMe.sol";
//FundMe
// 1、让 fundMe参与者，在筹款结束后可以根据mapping领取通证
// 2、让 fundMe参与者可以transfer通证< ERC 已经实现 function transfer()>
// 3、兑换并且销毁通证<销毁通证ERC20 已经实现 function burn()>
contract FunTokenERC20 is ERC20{
    FundMe fundMe;
    constructor(address fundMeContractAddr) ERC20("FunTokenERC20", "FT"){
        fundMe = FundMe(fundMeContractAddr);
    }

    function mint(uint256 amountToMint) public {
        require(fundMe.funderToAmount(msg.sender) >= amountToMint, "you cannot mint this many tokens");
        require(fundMe.getFundSuccess(),"fundMe is not complated yet");
        _mint(msg.sender,amountToMint);
        fundMe.setFunderToAmount(msg.sender,fundMe.funderToAmount(msg.sender)-amountToMint);
    }

    function claim(uint256 amountToClaim) public {
        //finished/complate claim
        require(balanceOf(msg.sender) >= amountToClaim,"you don`t have enough ERC20 tokens");
        require(fundMe.getFundSuccess(),"fundMe is not complated yet");
        /*to add */ 
        _burn(msg.sender, amountToClaim);
        //burn amountToClaim Tokens<已实现>
    }
}