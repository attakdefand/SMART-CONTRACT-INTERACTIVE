# Using the Smart Contract Interaction Tests Catalog

This document explains how to use the organized test catalog structure for smart contract security and functionality testing.

## Structure Overview

The test catalog is organized into 21 main categories, each containing multiple sub-types, which in turn contain specific test cases:

```
smart-contract-interaction-tests/
├── README.md
├── USAGE.md
├── docs/
│   ├── categories.md
│   └── test-template.md
├── src/
│   ├── access-control/
│   │   ├── ownable/
│   │   │   ├── owner-only-functions.md
│   │   │   └── ...
│   │   ├── rbac/
│   │   └── ...
│   ├── compliance-controls/
│   ├── cross-chain-bridging/
│   ├── dos-gas/
│   ├── erc20-conformance/
│   ├── economic-mev-safety/
│   ├── events-logs/
│   ├── governance/
│   ├── interface-abi/
│   ├── math-accounting/
│   ├── meta-transactions/
│   ├── nft-standards/
│   ├── observability-devex/
│   ├── oracle-market-data/
│   ├── pausability/
│   ├── read-only-views/
│   ├── reentrancy-atomicity/
│   ├── signatures-permit/
│   ├── state-changing-writes/
│   ├── time-scheduling/
│   └── upgradeability-proxy/
└── Smart-Contract_Interaction__146_Tests_Catalog.csv
```

## How to Use This Catalog

### 1. Understanding the Categories

Each category focuses on a specific aspect of smart contract functionality or security. Refer to [categories.md](docs/categories.md) for detailed descriptions of all categories and their sub-types.

### 2. Test Format

Each test is documented in a markdown file following the template described in [test-template.md](docs/test-template.md). Each test file contains:

- **Test Name**: Clear description of what is being tested
- **Category**: High-level category (e.g., "Access Control")
- **Sub-Type**: Specific pattern or standard (e.g., "Ownable")
- **Interaction**: Type of interaction (read, write, event, offchain)
- **What to Do**: Step-by-step instructions for executing the test
- **Key Assertions**: Expected outcomes to verify
- **Suggested Tools**: Recommended tools for implementation
- **Notes**: Additional considerations or references

### 3. Running Tests

The tests are designed to be implementation-agnostic. You can implement them using:

- **Foundry**: Using Forge for testing
- **Hardhat**: With Hardhat's testing framework
- **Truffle**: Using Truffle's testing capabilities
- **Other frameworks**: Adapt the test descriptions to your preferred framework

### 4. Customizing for Your Project

Not all 146 tests may be relevant to your specific smart contract. Use the catalog as a checklist:

1. Identify which categories and sub-types apply to your contract
2. Review the relevant test cases
3. Implement the tests that are applicable to your use case
4. Skip or modify tests that don't apply to your specific implementation

### 5. Adding New Tests

To add new tests or modify existing ones:

1. Follow the directory structure pattern
2. Use the template in [test-template.md](docs/test-template.md)
3. Place new tests in the appropriate category and sub-type directory
4. Update [categories.md](docs/categories.md) if adding new categories or sub-types

## Best Practices

1. **Prioritize by Risk**: Implement high-risk tests first (e.g., access control, reentrancy)
2. **Automate**: Convert test descriptions into automated test scripts
3. **Document Results**: Keep records of test outcomes for audit purposes
4. **Regular Review**: Periodically review and update tests as contracts evolve
5. **Comprehensive Coverage**: Aim to implement tests from multiple categories relevant to your contract

## Contributing

To contribute improvements to this catalog:

1. Fork the repository
2. Make your changes following the established structure
3. Submit a pull request with a clear description of your changes
4. Ensure new tests follow the established template

## Support

For questions or issues with using this catalog, please open an issue in the repository or contact the maintainers.