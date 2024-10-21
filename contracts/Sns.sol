// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

// SNS token contract inheriting from ERC20 for the basic token functionality, ERC20Permit for gasless approvals, and Ownable to handle ownership-related features.

contract SNSToken is ERC20, Ownable, ERC20Permit {
    // Event to be emitted when tokens are burned
    event Burn(address indexed burner, uint256 amount);
    // Event to be emitted when tokens are minted
    event Mint(address indexed minter, address indexed recipient, uint256 amount);

    // Constructor to initialize the token with name, symbol, and initial owner
    constructor(
        address initialOwner
    ) ERC20("Sonic Name Service", "SNS") Ownable(initialOwner) ERC20Permit("Sonic Name Service") {}

    // Function to allow token holders to burn their own tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    /*
    Function to mint new tokens, restricted to the owner only.
    After renouncing ownership of the SNS token, minting new SNS tokens will no longer be possible.
    This ensures that no additional tokens can be minted once the burn-to-mint process is finalized, 
    providing trust in the token's supply cap.
    */
    function mint(address to, uint256 amount) external onlyOwner {
        require(to != address(0), "Mint to zero address!");
        _mint(to, amount);
        emit Mint(msg.sender, to, amount);
    }
}
