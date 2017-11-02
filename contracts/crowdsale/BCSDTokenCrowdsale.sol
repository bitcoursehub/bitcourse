pragma solidity ^0.4.11;

import '../token/BCSDToken.sol';
import '../token/MintableToken.sol';
import './Crowdsale.sol';

contract BCSDTokenCrowdsale is Crowdsale {

  address private token_address;

  function BCSDTokenCrowdsale(uint256 _startBlock,
    uint256 _endBlock, uint256 _rate, address _wallet, address _token_address)
    Crowdsale(_startBlock, _endBlock, _rate, _wallet) {

    token_address = _token_address;
  }

  function createTokenContract() internal returns (MintableToken) {
    return BCSDToken(token_address);
  }
}
