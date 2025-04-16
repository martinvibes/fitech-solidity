// SPDX-License-Identifier: GPL-3.0 OR MIT

pragma solidity >=0.8.0 <0.9.0;

contract UserRegistry {
    address public owner;

    struct UserInfo {
        string name;
        uint128 age;
        string class;
        uint128 studentId;
        bool isRegistered;
    }

     constructor() {
        owner = msg.sender;
     }

     modifier onlyOwner() {
        require(msg.sender == owner, "caller not owner");
        _;
     }

     modifier validAddress() {
        require(msg.sender != address(0), "Invalid address");
        _;
     }


    // mapping(uint => UserInfo) public users;
    UserInfo[] public users;

     modifier validArray() {
        require(users.length >= 0, "array is empty");
        _;
     }

    function addUser(string memory _name, uint128 _age, string memory  _class, uint128 _studentId, bool _isRegistered ) public onlyOwner validAddress validArray  {
        // users[_id] = UserInfo(_name, _age, _class, _studentId, _isRegistered);
        require(!_isRegistered, "user is registered");

        users.push(UserInfo(_name, _age, _class, _studentId, _isRegistered));
    }

    function UpdateUser(string memory _name, uint32 _id, uint128 _age, string memory  _class) public onlyOwner validAddress validArray  {
        // users[_id] = UserInfo(_name, _age, _class, _studentId, _isRegistered);
        require(users[_id].isRegistered == false, "user is not registered");

        users[_id].name = _name;
        users[_id].age = _age;
        users[_id].class = _class;
    }

    function GetAllStudent() public validArray view returns (UserInfo[] memory) {
        return  users;
    }

    function GetAllStudentById(uint _id) public validArray view returns (UserInfo memory) {
        return  users[_id];
    }

    function getBalance() public view returns (uint) {
    return address(this).balance;
    }

}