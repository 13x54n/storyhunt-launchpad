// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StoryHuntTokenLaunchpad {
    // Event to log each new token creation
    event TokenCreated(address indexed tokenAddress, address indexed owner, string name, string symbol, uint256 initialSupply);

    // Deploy a new ERC20 token
    function createToken(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) public returns (address) {
        ERC20Token newToken = new ERC20Token(name, symbol, initialSupply, msg.sender);
        emit TokenCreated(address(newToken), msg.sender, name, symbol, initialSupply);
        return address(newToken);
    }
}

// ERC20Token contract inheriting OpenZeppelin's ERC20 with custom owner
contract ERC20Token is ERC20 {
    address public owner;

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        address tokenOwner
    ) ERC20(name, symbol) {
        _mint(tokenOwner, initialSupply * (10 ** decimals()));
        owner = tokenOwner;
    }
}
