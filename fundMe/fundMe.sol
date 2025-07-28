// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

//发布出现问题看这里！！！

// 这里使用Remix在线编写，同时使用了DOC 因此要部署到测试网络上，环境选择Injected Provider - MetaMask
//我在选择环境的时候找不到走了很多弯路，在这里只需要先提交 git (防止代码丢失)，然后浏览器清缓存、刷新页面、换个类型浏览器，差不多就解决问题了！
//我是从 Edge 换成 Chrome 解决的，edge 太卡了 环境刷新出来，下面的账户连不上！

contract fundMe{
    // 1、创建一个筹款功能
    // 2、记录参与筹款的名称
    // 3、在锁定期内，达到目标，生产商提款
    // 4、在锁定期外，未达成目标的投资人退款
    uint256 MAX_VALUE = 1*10**18;
    mapping(address funder => uint256 amount) public funderToAmount;
    AggregatorV3Interface public funtFeed;

    constructor() {
        funtFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);    
    }

    function fund() external payable {
        //断言语句，如果为false 执行“，”后里的内容
        require(converEthToUsd(msg.value) >= MAX_VALUE,"send more ETH");

        funderToAmount[msg.sender] = msg.value;
    }

    /**
     * Returns the latest answer.
     */
    function getChainlinkDataFeedLatestAnswer() public view returns (int) {
        // prettier-ignore
        (
            /* uint80 roundId */,
            int256 answer,
            /*uint256 startedAt*/,
            /*uint256 updatedAt*/,
            /*uint80 answeredInRound*/
        ) = funtFeed.latestRoundData();
        return answer;
    }

    function converEthToUsd(uint256 amount) private view returns (uint256){
        uint256 ethPrice = uint256(getChainlinkDataFeedLatestAnswer());
        return amount*ethPrice/10**8;
    }

}