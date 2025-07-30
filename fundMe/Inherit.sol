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
//——————————————————————————————————————————————————————————————————————————
//| ERC20    |  FT   |  fungible token   | 同质化货币   | 可以切分|互换之后不变 |
//| ERC721   |  NFT  |Non-fungible token | 非同质化货币 | 不可切分| 互换之后变了|
//——————————————————————————————————————————————————————————————————————————
//|           abstract、 virtual、 override
//————————————————————————————————————————————————————————————————————————————
abstract contract Parent2{
    uint256 public a;
    
    function addOne() public  virtual;
    function addTwo()public virtual {
        a += 2;
    }
    function addThree()public virtual {
        a += 3;
    }
}

contract ChildenInherit2 is Parent2{

    function addOne() public override {
        a++;
    }
    function addThree() public override {
        a = a+ 4;
    }
}

