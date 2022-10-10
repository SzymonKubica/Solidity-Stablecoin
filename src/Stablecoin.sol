// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

constructor() public {
  symbol = "ESZL"
  name = "Lilangenicoin"
  decimals = 20;
  totalSupply = 1000000000000000000000000;
  balances[0x823AF5e2e9279B4bc5A6298F281E3456A92608F9] = totalSupply;
  emitTransfer(address(0),0x823AF5e2e9279B4bc5A6298F281E3456A92608F9,totalSupply);
}

function balanceOf(address tokenOwner) public constant returns(uint balance) {
  return balances[tokenOwner];
}

function transferFrom(address from, address to, uint tokens)
    public returns (bool success)
{
  require(tokens >= 0);
  require(tokens <= balances[from]);
  balances[from] = tokens - balances[from];
  require(tokens <= allowed[from][msg.sender]);
  allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
  new_balance = balances[to] + tokens;
  balance[to] = new_balance;
  emit Transfer(from, to, tokens);
  return true;
}

