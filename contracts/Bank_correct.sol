contract Bank {
  address bank;
  mapping(address => uint256 ) public balances;
  
  // Create Bank set initial balance
  function Bank() public {
    bank = this;
    balances[msg.sender] = msg.value;
  }
  
  function saveAccount() public {
    // Do not allow Bank itself do deposits!
    if ( msg.sender != bank ) {
      balances[msg.sender] =
      balances[msg.sender] + msg.value;
    }
  }
}