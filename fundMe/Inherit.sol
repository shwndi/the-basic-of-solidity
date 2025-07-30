// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;


contract Parent{
    uint256 public a;
    uint256 private b;
    uint256 public c;
    function addOne() public  {
        a++;
    } 

}
contract Childen{
    uint256 public a;
    function addOne() public {
        a ++;
    }
    function addTwo()public {
        a += 2;
    }
}

contract ChildenInherit is Parent{

    function addTwo()public {
        a += 2;
    }
}