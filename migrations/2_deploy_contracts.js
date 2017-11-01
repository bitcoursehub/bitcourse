var BCSDTokenCrowdsale = artifacts.require("./BCSDTokenCrowdsale.sol");
var BCSDToken = artifacts.require("./BCSDToken.sol");

module.exports = function(deployer) {
  const startBlock = web3.eth.blockNumber + 2;
  const endBlock = startBlock + 1000;
  const rate = new web3.BigNumber(1000);
  const wallet = web3.eth.accounts[0];

  var token = deployer.deploy(BCSDToken);
  deployer.deploy(BCSDTokenCrowdsale, startBlock, endBlock, rate, wallet, token);
};
