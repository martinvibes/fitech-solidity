// SPDX-License-Identifier: GPL-3.0 OR MIT

pragma solidity >=0.8.0 <0.9.0;

contract Counter {
    uint256 public counter = 0;
    uint private password = 224357;

    function increment() public {
       counter = counter + 1;
    }

    function decrement() public {
        counter--;
    }

    function getCount() public view returns (uint256) {
        return counter;
    }

    function setCount(uint32 _count) external  {
        counter = _count;
    }

    function resetCount() public {
        counter = 0;
    }
}