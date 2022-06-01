// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MoboNFT is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    //--------------------Events-----------------------------//
    event NFTPrice(uint256 indexed updatedNFTprice);
    event WithdrawlAmount(
        uint256 indexed transferableAmount,
        address indexed transferableAddress
    );
    //--------------------Modifier---------------------------//
    modifier onlyNFTholders() {
        require(reClaimStatus[msg.sender] == true, "Nothing to withdraw");
        _;
    }
    //--------------------Constructor------------------------//
    constructor() ERC721("MoboToken", "MTK") {}
    //--------------------State Variables--------------------//
    uint256 counter = 1;
    uint256 public nftPrice = 1 ether;
    //--------------------Mappings----------------------------//
    mapping(address => uint256[]) nftIDrecords;
    mapping(address => bool) reClaimStatus;

    function mintNFT(string memory uri) external payable returns (uint256) {
        require(msg.value == nftPrice, "NFT cost is 1 ether");
        nftIDrecords[msg.sender].push(counter);
        if (reClaimStatus[msg.sender] == false) {
            reClaimStatus[msg.sender] = true;
        }
        safeMint(msg.sender, counter, uri);
        counter++;
        return counter;
    }

    function withdraw()
        external
        payable
        onlyNFTholders
        returns (bool, uint256)
    {
        uint256 transferableAmount = getBalance();
        address transferableAddress = payable(msg.sender);
        reClaimStatus[msg.sender] = false;
        emit WithdrawlAmount(transferableAmount, transferableAddress);
        (bool success, ) = transferableAddress.call{value: transferableAmount}(
            ""
        );
        if (success) {
            return (success, transferableAmount);
        } else {
            revert("error");
        }
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getNFTrecords() external view returns (uint256[] memory) {
        return nftIDrecords[msg.sender];
    }

    function updateNFTprice(uint256 updatedNFTprice) external {
        require(updatedNFTprice > 0, "price cannot be zero");
        emit NFTPrice(updatedNFTprice);
        nftPrice = updatedNFTprice;
    }

    function safeMint(
        address to,
        uint256 tokenId,
        string memory uri
    ) internal {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
