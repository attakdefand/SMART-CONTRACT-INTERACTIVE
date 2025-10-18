# Test Template

This document describes the standard format for each test case in the Smart Contract Interaction Tests Catalog.

## Test Structure

Each test file follows this structure:

```markdown
# [Test Name]

## Category
[Category Name]

## Sub-Type
[Sub-Type Name]

## Interaction
[read | write | event | offchain]

## What to Do
[Detailed steps describing how to perform the test]

## Key Assertions
[Expected outcomes and verifications]

## Suggested Tools
[Recommended tools for performing the test]

## Notes
[Additional information, references, or considerations]
```

## Field Descriptions

### Test Name
A descriptive name for the test that clearly indicates what is being tested.

### Category
The high-level category this test belongs to (e.g., "Access Control", "ERC-20 Conformance").

### Sub-Type
The specific sub-category or pattern being tested (e.g., "Ownable", "Transfer").

### Interaction
The type of interaction being tested:
- `read`: View functions or state queries
- `write`: State-changing operations
- `event`: Event emission verification
- `offchain`: Off-chain operations or preparations

### What to Do
Step-by-step instructions for performing the test. This should be detailed enough for someone to execute the test without additional context.

### Key Assertions
The expected outcomes that must be verified for the test to pass. These are the critical checks that validate the contract behavior.

### Suggested Tools
Tools that are recommended for performing this test, such as:
- Foundry
- Hardhat
- Truffle
- OpenZeppelin libraries
- Custom mocks
- Specific testing frameworks

### Notes
Additional information that might be helpful, such as:
- Special considerations
- Related standards or EIPs
- Common pitfalls
- References to documentation