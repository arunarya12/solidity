//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestToken is ERC20 {
    constructor(address _owner) ERC20("RailToken", "RRT") {
        _mint(_owner, 200000000000000000000000000000000000 ether);
    }
}

contract BuySell {
    IERC20 public asset;
    address public owner;

    event Buy(address buyer,uint256 tokenAmount);
    event Sell(address seller,uint256 eth);

    constructor(address _owner) {
        owner = _owner;
        asset = new TestToken(owner);
    }

    struct userRecordsStruct {
        uint256 etherBalance;
        uint256 tokenBalance;
    }

    mapping(address => userRecordsStruct) public userRecords;

    function buy() public payable {
        require(msg.value > 2, "Buy: buy more than 2 ether");
        userRecords[msg.sender].etherBalance = msg.value;
        uint256 transferableToken = (msg.value) * 10; // 1 eth = 10 tokens
        emit Buy(msg.sender,transferableToken);
        userRecords[msg.sender].tokenBalance = transferableToken;
        IERC20(asset).transferFrom(owner, msg.sender, transferableToken);
    }

    function sell(uint256 _token) public payable returns (bool, uint256) {
        require(_token > 2 ether,"Sell: cannot sell less than 2 ether");
        userRecords[msg.sender].tokenBalance -= _token;
        uint256 transferableAmount = (_token * (50000000000000000)) / 1 ether;
        emit Sell(msg.sender,transferableAmount);
        (bool success, ) = msg.sender.call{value: transferableAmount}("");
        if(success){
            return (success, transferableAmount);
        }
        else{
            revert("Sell: error");
        }        
    }

    function checkBalance() public view returns (uint256) {
        return IERC20(asset).balanceOf(msg.sender);
    }

    function maintainContractBalance(address contractAddress) public payable returns (uint256) {
        require(contractAddress != address(0),"Zero: cannot set to zero address");
        (bool success,) = contractAddress.call{value: msg.value}("");
        if(success){
             return msg.value;
        }
        else{
            revert("Ether : fail to deposit");
        }       
    }
}
