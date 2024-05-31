// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library CustomCounter {
    struct Counter {
        uint256 _value;
    }

    function increment(Counter storage self) internal {
        self._value += 1;
    }

    function decrement(Counter storage self) internal {
        require(self._value > 0, "Counter: decrement underflow");
        self._value -= 1;
    }

    function value(Counter storage self) internal view returns (uint256) {
        return self._value;
    }
}
