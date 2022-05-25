//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0; // must declare latest version of solidity 

contract Erc20 {
    //always start with contract name

    function getSenderAdress() public view returns (address) {
        return msg.sender; // this is for only selected address of account
    }

    uint256 value = 20;

    function getUpdate() public {
        value = 30;
    }

    function readvarible() public view returns (uint256) {
        return value;
    }

    string name = "arun";

    function getUpdate2() public {
        name = "varun";
    }

    function readSting() public view returns (string memory) {
        return name;
    }

    address _owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function getUpdate3() public {
        _owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    }

    function readOwnerADDress() public view returns (address) {
        return _owner;
    }
}
