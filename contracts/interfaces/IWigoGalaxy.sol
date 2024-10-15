// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IWigoGalaxy {
    function getResidentStatus(address _residentAddress) external view returns (bool);

    function getResidentProfile(
        address _residentAddress
    ) external view returns (uint256, uint256, uint256, address, uint256, uint256, bool);

    function hasRegistered(address _residentAddress) external view returns (bool);
}
