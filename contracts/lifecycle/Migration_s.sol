pragma solidity ^0.4.4;


import '../ownership/Ownable.sol';


contract Migration_s is Ownable {
  uint public lastCompletedMigration;

  function setCompleted(uint completed) onlyOwner {
    lastCompletedMigration = completed;
  }

  function upgrade(address newAddress) onlyOwner {
    Migration_s upgraded = Migration_s(newAddress);
    upgraded.setCompleted(lastCompletedMigration);
  }
}
