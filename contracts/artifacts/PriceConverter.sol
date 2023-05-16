// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns(uint256){
        // ABI, Address
        AggregatorV3Interface priceFeed = AggregatorV3Interface(address(0x8A753747A1Fa494EC90E9f37563A8AF630e));
        (, int256 price, , ,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(address(0x8A753747A1Fa494EC90E9f37563A8AF630e));
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmoundInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmoundInUsd;
    }
}