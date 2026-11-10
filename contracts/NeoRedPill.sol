// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Capped} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";

/// @title NeoRedPill (NRP)
/// @notice ERC-20 token for Neo X with a hard supply cap, burnable tokens and
///         role-based minting. Non-upgradeable.
/// @dev DRAFT: not audited. Do not treat as production-ready.
contract NeoRedPill is ERC20, ERC20Burnable, ERC20Capped, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    /// @dev 1,000,000,000 NRP with 18 decimals.
    uint256 public constant MAX_SUPPLY = 1_000_000_000 * 10 ** 18;

    error ZeroAddress();

    constructor(address defaultAdmin, address minter)
        ERC20("NeoRedPill", "NRP")
        ERC20Capped(MAX_SUPPLY)
    {
        if (defaultAdmin == address(0) || minter == address(0)) revert ZeroAddress();
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }

    /// @notice Mint new NRP. Reverts if the cap would be exceeded.
    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    // Required override: ERC20 and ERC20Capped both define _update.
    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Capped)
    {
        super._update(from, to, value);
    }
}
