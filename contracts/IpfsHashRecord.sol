pragma solidity 0.5.1;

import 'openzeppelin-solidity/contracts/access/roles/WhitelistAdminRole.sol';

/**
 * @title IpfsHashRecord
 * @dev Record IPFS hash to Ethereum contract by emitting log.
 */
contract IpfsHashRecord is WhitelistAdminRole {

    // eventID is the first 4 bytes of the Keccak hash of events
    // auction_bidding: 0x636fe49e
    // auction_receipt: 0x4997644b
    // bancor_trading: 0x285a30e1
    event Recorded (bytes4 indexed eventID, uint256 indexed createdAt, bytes32 ipfsHash);

    /**
     * @dev Write ipfsHash as log
     */
    function writeHash(bytes4 _eventID, bytes32 _ipfsHash) public onlyWhitelistAdmin {
        emit Recorded(_eventID, uint256(now), _ipfsHash);
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

    /* Following code is not use as plan, but use if necesary */
    
    // Packing for gas efficiency
    // Note: Don't use as default, use if necessary
    struct IpfsHas {
        uint256 createdAt;
        bytes32 ipfsHash;
        bytes4 eventID;
    }

    // Note: Don't use as default, use if necessary
    IpfsHas[] public records;

    /**
     * @dev Store ipfsHash to array
     * Note: Don't use as default, use if necessary
     */
    function storeHash(bytes4 _eventID, bytes32 _ipfsHash) public onlyWhitelistAdmin {
        uint256 createdAt = uint256(now);

        records.push(IpfsHas({
            createdAt: createdAt,
            ipfsHash: _ipfsHash,
            eventID: _eventID
        }));

        emit Recorded(_eventID, createdAt, _ipfsHash);
    }
}
