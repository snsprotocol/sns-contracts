// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

// SNS token contract inheriting from ERC20 for the basic token functionality, ERC20Permit for gasless approvals.

contract SNSToken is ERC20, ERC20Permit {
    // Event to be emitted when tokens are minted
    event Mint(address indexed recipient, uint256 amount);
    // Event to be emitted when tokens are burned
    event Burn(address indexed burner, uint256 amount);

    // Constructor to initialize the token with name, symbol, and initial owner
    constructor(
        address initialOwner,
        uint256 migratedAmount
    ) ERC20("Sonic Name Service", "SNS") ERC20Permit("Sonic Name Service") {
        require(initialOwner != address(0), "Initial Owner address cannot be zero");
        _mint(initialOwner, migratedAmount);

        emit Mint(initialOwner, migratedAmount);
    }

    // Function to allow token holders to burn their own tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }
}
