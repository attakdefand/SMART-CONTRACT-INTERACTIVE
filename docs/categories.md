# Smart Contract Test Categories

This document provides an overview of all the categories and sub-types in the Smart Contract Interaction Tests Catalog.

## 1. Access Control
Tests related to controlling who can perform specific actions in a smart contract.

**Sub-types:**
- Ownable: Tests for owner-only functions
- RBAC: Role-based access control tests
- Timelock: Tests for queued operations with delays
- Guardian: Emergency stop functionality tests
- MultiSig: Threshold signing tests
- Claimable: Two-step ownership transfer tests
- Permit Roles: Signature-based role granting tests
- Revocation: Role or token revocation tests

## 2. Compliance Controls
Tests ensuring compliance with regulatory and policy requirements.

**Sub-types:**
- Blacklist: Tests for blocking specific addresses
- Whitelist: Tests for allowing only specific addresses
- Sanctions Oracle: External compliance checking
- KYC NFT: Identity verification through NFTs

## 3. Cross-Chain & Bridging
Tests for cross-chain functionality and bridge operations.

**Sub-types:**
- Lock & Mint: Source chain deposit mechanism
- Prove & Claim: Target chain mint/release
- Timeout: Retry and timeout handling
- Replay: Message idempotency
- Gas Escrow: Fee handling on target chain
- Finality Window: Rollup finality handling

## 4. DoS & Gas
Tests for denial-of-service and gas optimization vulnerabilities.

**Sub-types:**
- Unbounded Loop: Large array processing
- Griefing via Revert: External call failure handling
- Block Gas Limit: Upper bound testing
- Storage Blowup: Mapping growth limits
- Event Flood: Log spam handling
- Pull Queue: Withdrawal queue depth

## 5. ERC-20 Conformance
Tests ensuring compliance with ERC-20 token standard.

**Sub-types:**
- Transfer: Basic token transfer functionality
- Approve: Allowance setting
- TransferFrom: Allowance spending
- Permit: EIP-2612 signature-based approval
- Zero Address: Rejection handling
- Overflow/Underflow: Safe math operations
- Mint/Burn Access: Controlled token creation/destruction
- Decimals/Name/Symbol: Metadata verification
- Events: Transfer and approval event emission
- Blacklist/Pause: Compliance controls

## 6. Economic & MEV Safety
Tests for economic security and MEV protection.

**Sub-types:**
- Slippage MinOut: Minimum output protection
- Price Band: Price bounds enforcement
- Sandwich Defense: Front-running protection
- Flash Loan Check: Flash loan attack prevention
- Cooldown: Withdrawal delay enforcement
- Velocity Caps: Transaction rate limiting
- Max Position: Position size limits

## 7. Events & Logs
Tests for event emission and log handling.

**Sub-types:**
- Emission Coverage: State change event coverage
- Ordering: Event sequence consistency
- No Ghost Events: Read operations don't emit
- Indexing: Topic filtering
- Reorg Handling: Reorganization resilience
- Overflow Topics: High-volume event handling
- Sparse Ranges: Wide block scanning
- ABI Decode Fail: Malformed data handling

## 8. Governance
Tests for decentralized governance mechanisms.

**Sub-types:**
- Delegate: Voting power delegation
- Proposal Flow: Full proposal lifecycle
- Quorum: Minimum participation requirements
- Cancel: Authorized proposal cancellation
- Upgrade via Gov: Governance-controlled upgrades
- Attack Sim: Flash loan voting prevention

## 9. Interface & ABI
Tests for contract interface and ABI compliance.

**Sub-types:**
- ABI Decoding: Return value decoding
- ABI Encoding: Input parameter encoding
- Selector Mapping: Function selector collision avoidance
- Error Selector: Custom error handling
- Event Topics: Event signature consistency

## 10. Math & Accounting
Tests for mathematical operations and accounting accuracy.

**Sub-types:**
- Rounding: Down/up rounding rules
- Overflow: Arithmetic overflow protection
- Fee Accounting: Fee calculation and distribution
- Dust Handling: Tiny amount processing
- Invariant Sums: Conservation of assets
- Precision Loss: Decimal scaling accuracy
- Signed Ints: Negative value handling
- Funding Rate: Perpetual funding calculations

## 11. Meta-Transactions & Account Abstraction
Tests for meta-transactions and account abstraction features.

**Sub-types:**
- EIP-2771: Trusted forwarder pattern
- Replay AA: UserOp nonce handling
- Paymaster: Gas sponsorship rules
- AA Sig: Aggregated signature validation
- AA PostOp: Post-operation handling
- Intent Packing: CallData validation

## 12. NFT Standards
Tests for NFT standard compliance.

**Sub-types:**
- Mint721: ERC-721 safe minting
- Transfer721: ERC-721 safe transfers
- Approval721: ERC-721 operator approval
- URI721: ERC-721 token URI composition
- Mint1155: ERC-1155 batch minting
- Transfer1155: ERC-1155 batch transfers
- Royalty: ERC-2981 royalty information
- Enumerable: ERC-721 enumeration
- Freeze/Reveal: Metadata flow control
- PermitNFT: ERC-721 signature-based approval

## 13. Observability & DevEx
Tests for developer experience and observability features.

**Sub-types:**
- Event Coverage %: Event emission ratio
- Error Codes: Custom error implementation
- NatSpec/Docs: Documentation generation
- Debug Hooks: Development-time features

## 14. Oracle & Market Data
Tests for oracle integration and market data handling.

**Sub-types:**
- Heartbeat: Data freshness checking
- Deviation: Price drift thresholds
- Quorum: Multi-source aggregation
- Fallback TWAP: Time-weighted average price fallback
- Sequencer Uptime: L2 sequencer status
- Scaling: Decimal normalization
- Freeze: Halted price handling
- Spoof Defense: Invalid value rejection

## 15. Pausability & Circuit Breakers
Tests for emergency pause functionality and circuit breakers.

**Sub-types:**
- Pause Writes: Write operation blocking
- Unpause: Operation resumption
- Pause Roles: Authorization for pausing
- Selective Pause: Feature-specific pausing
- Rate Limit: Velocity-based controls
- Circuit Trip: Error budget management

## 16. Read-Only Views
Tests for view functions and read operations.

**Sub-types:**
- Single Read: Simple getter functions
- Batch Read: Multicall aggregation
- Historical Read: Past state access
- Storage Slots: Direct storage access
- Boundary Read: Edge case handling
- Permissioned View: Role-limited views
- Gasless Sim: Static call simulation
- Reorg-safe Read: Consistency across blocks

## 17. Reentrancy & Atomicity
Tests for reentrancy protection and atomic operations.

**Sub-types:**
- CEI Pattern: Checks-Effects-Interactions pattern
- ReentrancyGuard: Non-reentrant modifier
- Pull Payments: Withdrawal pattern
- Reentrancy via ERC777: ERC-777 hook attacks
- Cross-Function: Multi-function attack paths

## 18. Signatures & Permit
Tests for signature verification and permit functionality.

**Sub-types:**
- EIP-712 Domain: Domain separator validation
- Permit Nonce: Nonce management
- Permit Deadline: Expiration handling
- Permit2: Allowance management
- Sig Malleability: Signature format validation
- Ecrecover Zero: Zero address protection

## 19. State-Changing Writes
Tests for state-modifying operations.

**Sub-types:**
- Direct Tx: Basic state changes
- Batch/Multicall: Multiple operations in one transaction
- Idempotency: Duplicate transaction handling
- Replay Protection: Chain and nonce validation
- Access List: EIP-2930 access lists
- Revert Reasons: Error message accuracy
- Fee Caps: EIP-1559 fee limits
- Permit+Action: Combined approval and action
- Nonce Gap: Out-of-order transaction handling
- Deadline: Expiration enforcement

## 20. Time & Scheduling
Tests for time-based functionality.

**Sub-types:**
- Block Timestamps: Time-based logic
- Deadlines: Expiration handling
- Cliffs & Vesting: Schedule-based access
- Cooldowns: Delay between operations
- TWAP Windows: Time-weighted average price windows

## 21. Upgradeability / Proxy
Tests for upgradeable contract patterns.

**Sub-types:**
- Proxy Calls Impl: Delegatecall correctness
- Storage Layout: Layout compatibility
- Upgrade Auth: Authorization for upgrades
- Upgrade Event: Upgrade event emission
- Rollback Plan: Reversion procedures
- Initialize Once: Single initialization
- Delegatecall Attack: Self-destruct protection
- EIP-1967 Slots: Standard storage slots
- Upgrade with Data: Initialization during upgrade
- Beacon Proxy: Beacon pattern implementation