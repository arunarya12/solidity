//"SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.0;

contract calculator {
    
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c;
        c = a + b;
        return c;
    }

    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c;
        c = a - b;
        return c;
    }

    function mutiply(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c;
        c = a * b;
        return c;
    }

    function division(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c;
        require(b > 0, " error");
        c = a / b;
        return c;
    }
}
