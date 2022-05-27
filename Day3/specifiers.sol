pragma solidity ^0.8.0;


contract Specifers{



    // public ,private , internal , external 

    function Public() public view returns (address){

        return msg.sender;
    }

    function Internal() internal view returns (uint256){

        return msg.value;
    }

    function callInternal() public  payable returns(uint256) {
       return Internal();
    }

    function External() external payable returns(uint256){
        return msg.value;
    }

    function callPublic() public view returns(address){
       return Public();
    }

    function callExternal() public view returns(address){
       return Private();
    }

    function Private() private view returns(address){
        return msg.sender;
    }
}

contract Specifers2 is Specifers{


        function check() public view returns(uint256){
            return Internal();
        }

}


