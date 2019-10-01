const { assertRevert } = require('./helpers/assertRevert')
const IpfsHashRecord = artifacts.require("IpfsHashRecord");

EVENT_ID = '0x636fe49e';
IPFS_HASH = '0x017dfd85d4f6cb4dcd715a88101f7b1f06cd1e009b2327a0809d01eb9c91f231';

contract("IpfsHashRecord test", async accounts => {
  it("should admin be contract creater", async () => {
    const instance = await IpfsHashRecord.deployed();
    const isAdmin = await instance.isWhitelistAdmin.call(accounts[0]);
    assert.equal(isAdmin, true);
  });

  it("should write ipfs hash by admin", async () => {
    const instance = await IpfsHashRecord.deployed();
    const { logs } = await instance.writeHash(EVENT_ID, IPFS_HASH, {from: accounts[0]});
    assert.equal(logs[0].args.eventSig.substr(0,10), EVENT_ID);
    assert.equal(logs[0].args.ipfsHash, IPFS_HASH);
  });

  it("should not write ipfs hash by no admin", async () => {
    const instance = await IpfsHashRecord.deployed();
    await assertRevert(instance.writeHash(EVENT_ID, IPFS_HASH, {from: accounts[1]}))
  });

  it("should add admin", async () => {
    const instance = await IpfsHashRecord.deployed();
    await instance.addWhitelistAdmin(accounts[1], {from: accounts[0]});
    const isAdmin = await instance.isWhitelistAdmin.call(accounts[1]);
    assert.equal(isAdmin, true);
  });

  it("should renounce admin", async () => {
    const instance = await IpfsHashRecord.deployed();
    await instance.renounceWhitelistAdmin({from: accounts[0]});
    const isAdmin = await instance.isWhitelistAdmin.call(accounts[0]);
    assert.equal(isAdmin, false);
  });

});