// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IToken {
    function renounceOwnership() external;
    function mint(address to, uint256 amount) external;
    function burn(uint256 amount) external;
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}
