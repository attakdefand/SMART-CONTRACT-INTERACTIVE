# Smart Contract Interaction Tests Catalog

This project contains 146 comprehensive tests for interacting with smart contracts, organized by category and sub-type. The tests cover various aspects of smart contract security, functionality, and best practices.

## Overview

The catalog is based on industry best practices and covers the following main categories:

- Access Control
- Compliance Controls
- Cross-Chain & Bridging
- DoS & Gas
- ERC-20 Conformance
- Economic & MEV Safety
- Events & Logs
- Governance
- Interface & ABI
- Math & Accounting
- Meta-Transactions & Account Abstraction
- NFT Standards
- Observability & DevEx
- Oracle & Market Data
- Pausability & Circuit Breakers
- Read-Only Views
- Reentrancy & Atomicity
- Signatures & Permit
- State-Changing Writes
- Time & Scheduling
- Upgradeability / Proxy

Each category contains multiple sub-types with specific test cases designed to validate different aspects of smart contract behavior.

## Structure

The project is organized as follows:
```
smart-contract-interaction-tests/
├── README.md
├── docs/
│   ├── categories.md
│   └── test-template.md
├── src/
│   ├── [category]/
│   │   ├── [sub-type]/
│   │   │   ├── [test-name].md
│   │   │   └── ...
│   │   └── ...
│   └── ...
└── Smart-Contract_Interaction__146_Tests_Catalog.csv
```

## Usage

Each test file contains:
- Test name
- Interaction type
- Detailed steps to perform the test
- Key assertions to verify
- Suggested tools
- Additional notes

These tests can be used as a checklist when developing, auditing, or testing smart contracts to ensure comprehensive coverage of potential issues and edge cases.