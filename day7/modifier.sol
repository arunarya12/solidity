//"SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.1;

contract Modifers {
    address user;

    mapping(string => address) data;
    mapping(address => uint256) data1;

    modifier checkforaddress(address _user) {
        require(_user != address(0));
        _;
    }

    function set(address _user) public checkforaddress(_user) {
        //require (_user != address(0));

        user = _user;
    }

    function setdata1(string memory _name, address _user)
        public
        checkforaddress(_user)
    {
        //require (_user != address(0));

        data[_name] = _user;
    }

    function setdata2(address _user, uint256 value)
        public
        checkforaddress(_user)
    {
        //require (_user != address(0));

        data1[_user] = value;
    }
}
