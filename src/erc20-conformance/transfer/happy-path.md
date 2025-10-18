# Happy-path Transfer

## Category
ERC-20 Conformance

## Sub-Type
Transfer

## Interaction
write

## What to Do
1. Deploy an ERC-20 token contract with an initial supply
2. Record the initial balances of the sender and receiver accounts
3. Execute a transfer transaction from the sender to the receiver for a valid amount
4. Verify that the sender's balance has decreased by the transfer amount
5. Verify that the receiver's balance has increased by the transfer amount
6. Confirm that a Transfer event was emitted with the correct parameters

## Key Assertions
- Sender's balance decreases by the transfer amount
- Receiver's balance increases by the transfer amount
- Total supply remains unchanged
- Transfer event is emitted with correct from, to, and value parameters
- Transaction succeeds with appropriate gas consumption

## Suggested Tools
- OpenZeppelin Tests
- Foundry
- Truffle
- Hardhat

## Notes
- This test covers the basic happy path scenario for ERC-20 transfers
- Should be tested with various transfer amounts including edge cases
- Consider testing with zero-value transfers (which should succeed according to ERC-20 spec)
- Ensure compliance with ERC-20 specification requirements