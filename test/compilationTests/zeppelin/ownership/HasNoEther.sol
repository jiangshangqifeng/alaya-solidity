pragma solidity ^0.4.11;

import "./Ownable.sol";

/** 
 * @title Contracts that should not own Lat
 * @author Remco Bloemen <remco@2π.com>
 * @dev This tries to block incoming lat to prevent accidental loss of Lat. Should Lat end up
 * in the contract, it will allow the owner to reclaim this lat.
 * @notice Lat can still be send to this contract by:
 * calling functions labeled `payable`
 * `selfdestruct(contract_address)`
 * mining directly to the contract address
*/
contract HasNoEther is Ownable {

  /**
  * @dev Constructor that rejects incoming Lat
  * @dev The `payable` flag is added so we can access `msg.value` without compiler warning. If we 
  * leave out payable, then Solidity will allow inheriting contracts to implement a payable 
  * constructor. By doing it this way we prevent a payable constructor from working. Alternatively 
  * we could use assembly to access msg.value.
  */
  function HasNoEther() payable {
    if(msg.value > 0) {
      throw;
    }
  }

  /**
   * @dev Disallows direct send by settings a default function without the `payable` flag.
   */
  function() external {
  }

  /**
   * @dev Transfer all Lat held by the contract to the owner.
   */
  function reclaimEther() external onlyOwner {
    if(!owner.send(this.balance)) {
      throw;
    }
  }
}
