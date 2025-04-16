// SPDX-License-Identifier: GPL-3.0 OR MIT

pragma solidity >=0.8.0 <0.9.0;

contract User {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
     require(msg.sender == owner, "you have to be the owner");
     _;
    }

    modifier validAddr() {
      require(msg.sender != address(0), "you have to be the owner");
      _;
    }

    mapping(uint128 => string) public MyName;
    event NewUser(address indexed user, string name, uint256 time);

    function setName(string memory _name, uint128 _id) public onlyOwner validAddr {
       
        MyName[_id] = _name;
        emit NewUser(msg.sender, _name, block.timestamp);
    }

    function getName(uint128 _id) public view returns (string memory) {
        return MyName[_id];
    }

    function resetName(uint128 _id) public onlyOwner validAddr {
      delete MyName[_id];
    }
}