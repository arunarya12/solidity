 pragma solidity ^0.8.1;
 
 contract minibank{

      mapping(string => uint256) deposit;

      function Deposit(string memory _name, uint256 _amount) public{
          deposit[_name] +=_amount;            
      }

      function checkdeposit(string memory _name) public view returns(uint256){
          return deposit[ _name];
      }
    
       function withdrawal(string memory _name, uint256 _amount) public{
          deposit[_name] -=_amount; 
       }   
  }
