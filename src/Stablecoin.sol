// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Stablecoin {
  string symbol = "ESZL";
  string name = "Lilangenicoin";
  uint256 decimals = 20;
  uint256 totalSupply = 1000000000000000000000000;
  address contractOwner = 0x823AF5e2e9279B4bc5A6298F281E3456A92608F9;
  mapping(address => uint256) public balances;
  balances[contractOwner] = totalSupply;
  emitTransfer(address(0),contractOwner,totalSupply);
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


