pragma solidity 0.5.1;

import 'openzeppelin-solidity/contracts/access/roles/WhitelistAdminRole.sol';

/**
 * @title IpfsHashRecord
 * @dev Record IPFS hash to Ethereum contract by emitting log.
 */
contract IpfsHashRecord is WhitelistAdminRole {

  // eventSig is the first 4 bytes of the Keccak256 hash of event name
  // auction_bidding: 0x636fe49e
  // auction_receipt: 0x4997644b
  // bancor_trading: 0x285a30e1
  event Recorded (bytes4 indexed eventSig, uint256 indexed createdAt, bytes32 ipfsHash);

  /**
   * @dev Write ipfsHash as log
   */
  function writeHash(bytes4 _eventSig, bytes32 _ipfsHash) public onlyWhitelistAdmin {
    emit Recorded(_eventSig, uint256(now), _ipfsHash);
  }

  /**
   * @dev Add admin
   */
  function addWhitelistAdmin(address account) public onlyWhitelistAdmin {
    super.addWhitelistAdmin(account);
  }

  /**
   * @dev Renounce admin
   */
  function renounceWhitelistAdmin() public {
    super.renounceWhitelistAdmin();
  }

  /**
   * @dev Check whether address is admin or not
   */
  function isWhitelistAdmin(address account) public view returns (bool) {
    return super.isWhitelistAdmin(account);
  }
}
