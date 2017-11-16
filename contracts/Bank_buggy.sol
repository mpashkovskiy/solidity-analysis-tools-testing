contract Bank {

  mapping(address => uint256) public balances;

  function Bank() public {}

  function saveAccount() public {
    balances[msg.sender] = balances[msg.sender] + msg.value;
  }

}