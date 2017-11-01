pragma solidity ^0.4.13;

import "./Lesson.sol";

contract IndividualLesson is Lesson {
    address public student;

    event Balance(uint256 balance);

    function IndividualLesson(address _student, address _token, uint256 _price) Lesson(_token, _price) {
          student = _student;
    }

    modifier isStudent() {
        msg.sender == student;
        _;
    }

    function applyLesson() inState(State.Created) {
        uint256 balance = token.balanceOf(this);
        require(balance == price);
        state = State.InProgress;
    }

    function confirmLesson() inState(State.InProgress) isStudent() {
        token.transfer(instructor, price);
        state = State.Success;
    }

    function rejectLesson() inState(State.InProgress) isStudent() {
        state = State.Conflict;
    }
}
