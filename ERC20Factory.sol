// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; // parent

//--------- ERC20token start-----------//
contract ERC20token is ERC20 {
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 amount,
        address owner
    ) ERC20(_name, _symbol) {
        _mint(owner, amount);
    }
}
//--------- ERC20token end-----------//

//--------- ERC20Factory-contract start-----------//
contract ERC20TokenFactory {
    IERC20 deployedAddress;

    function create(
        string memory _name,
        string memory _symbol,
        uint256 amount,
        address owner
    ) public returns (IERC20) {
        deployedAddress = new ERC20token(_name, _symbol, amount, owner); 

        return deployedAddress;
    }
}
//--------- ERC20Factory-contract end-----------//
