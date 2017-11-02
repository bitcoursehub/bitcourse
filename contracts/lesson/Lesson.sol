pragma solidity ^0.4.11;

import '../token/BCSDToken.sol';

contract Lesson {

    address public instructor;
    uint256 public price;
    BCSDToken public token;

    enum State { Created, InProgress, Success, Conflict }
    State public state;

    modifier condition(bool _condition) {
        require(_condition);
        _;
    }

    modifier inState(State _state) {
        require(state == _state);
        _;
    }

    function Lesson(address _token, uint256 _price) {
      instructor = msg.sender;
      token = BCSDToken(_token);
      price = _price;
      state = State.Created;
    }
}
