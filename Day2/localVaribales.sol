//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;


// Day2 =. use of local varibales and pure 


contract Day2{



    function getPure() public pure returns(uint256){

        //define local varibales 
        uint256 a = 10;

        return a = 30;



    }
    function getUpdate(string memory _name) public pure returns(string memory){
            string memory name = _name;
            return name;
    
    }

    function getUpdate2() public pure returns(string memory){
            string memory name = "_name";
            return name;
    }

    function _owner1(address _owner) public pure returns(address){
       address _owneraddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        return _owneraddress = _owner;
    } 

    function msgSender() public  view returns(address){
        return msg.sender;
    }

    function msgvalue() public payable returns (uint256){
        return msg.value;
    }

    mapping (address => uint256) record;
    
    function saveRecords(address owner4,uint256 value) public {
        record[owner4] = value;
    }

    function read(address owner3) public view returns(uint256){
        return record[owner3];
    }



     mapping (address =>   string ) owner;
     function exchange(address owner1 , string memory name ) public{
         owner[owner1] = name;
     }

      function read1(address owner1) public view returns (string memory ){
          return owner[owner1];
      }


      mapping (string => uint256) amount;

      function money(string memory name, uint256 value) public{
          amount[name]= value;
      }

      function moneyread(string memory name) public view returns (uint256){
           return amount[name];
      }

    
}
