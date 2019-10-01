const IpfsHashRecord = artifacts.require("IpfsHashRecord");

module.exports = function(deployer) {
  deployer.deploy(IpfsHashRecord);
};
