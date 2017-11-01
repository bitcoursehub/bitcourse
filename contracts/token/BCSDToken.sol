pragma solidity ^0.4.4;

import './MintableToken.sol';

contract BCSDToken is MintableToken {
  string public name = 'BitCourseDemoToken';
  string public symbol = 'BCSD';
  uint public decimals = 18;

  function transferAndCall(address _to, uint256 _value, string _method) returns (bool success) {
      transfer(_to, _value);
      require(_to.call(bytes4(bytes32(sha3(_method)))));
      return true;
  }
}
