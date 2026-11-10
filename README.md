# NeoRedPill (NRP) | Neo X Token Contract

Official Solidity smart contract repository for NeoRedPill (NRP) on Neo X.

This repository provides the ERC-20 token implementation intended for technical review and potential integration with the Neo N3 ↔ Neo X bridge.

## Token Information

| Property | Value |
|---|---|
| Token Name | NeoRedPill |
| Symbol | NRP |
| Blockchain | Neo X |
| Token Standard | ERC-20 |
| Decimals | 18 |
| Maximum Supply | 1,000,000,000 NRP |
| Initial Planned Bridge Liquidity | 60,000,000 NRP |
| Solidity Version | ^0.8.27 |
| Dependencies | OpenZeppelin Contracts 5.x |
| Upgradeability | Non-upgradeable |

## Smart Contract Features

- ERC-20 implementation
- Maximum supply enforcement using `ERC20Capped`
- Role-based minting using `AccessControl`
- `ERC20Burnable` functionality
- Separate administrator and minter permissions
- OpenZeppelin-based implementation

## Bridge Integration

NeoRedPill is preparing for potential integration with the Neo N3 ↔ Neo X bridge.

The proposed initial liquidity allocation is 60,000,000 NRP on Neo X.

The corresponding backing and custody arrangements on Neo N3 must be confirmed before mainnet deployment and liquidity provisioning.

**Bridge integration is not yet completed.**

## Smart Contract

Source file: [`contracts/NeoRedPill.sol`](contracts/NeoRedPill.sol)

The contract uses OpenZeppelin Contracts 5.x.

Constructor parameters:

- `defaultAdmin`: Address receiving `DEFAULT_ADMIN_ROLE`
- `minter`: Address receiving `MINTER_ROLE`

Both addresses must be nonzero.

## Development and Security Status

**Status: Draft / Pre-deployment Review**

The contract has been compiled and subjected to initial testing in the Remix VM, including minting permissions and maximum supply enforcement.

The contract has **not** undergone an independent security audit.

No Neo X mainnet deployment is claimed by this repository.

Do not treat this implementation as production-ready without further testing, security review and deployment verification.

## Official NeoRedPill Links

- Website: https://neoredpill.com
- GitHub: https://github.com/NeoRedPillOfficial
- Contact: nrp@neoredpill.com

## License

MIT License. See the [LICENSE](LICENSE) file.
