# Smart Contract Interaction Tests Catalog

This document contains 146 comprehensive tests for interacting with smart contracts, organized by category and sub-type. These tests cover various aspects of smart contract security, functionality, and best practices.

## Table of Contents
1. [Access Control](#access-control)
2. [Compliance Controls](#compliance-controls)
3. [Cross-Chain & Bridging](#cross-chain--bridging)
4. [DoS & Gas](#dos--gas)
5. [ERC-20 Conformance](#erc-20-conformance)
6. [Economic & MEV Safety](#economic--mev-safety)
7. [Events & Logs](#events--logs)
8. [Governance](#governance)
9. [Interface & ABI](#interface--abi)
10. [Math & Accounting](#math--accounting)
11. [Meta-Transactions & Account Abstraction](#meta-transactions--account-abstraction)
12. [NFT Standards](#nft-standards)
13. [Observability & DevEx](#observability--devex)
14. [Oracle & Market Data](#oracle--market-data)
15. [Pausability & Circuit Breakers](#pausability--circuit-breakers)
16. [Read-Only Views](#read-only-views)
17. [Reentrancy & Atomicity](#reentrancy--atomicity)
18. [Signatures & Permit](#signatures--permit)
19. [State-Changing Writes](#state-changing-writes)
20. [Time & Scheduling](#time--scheduling)
21. [Upgradeability / Proxy](#upgradeability--proxy)

---

## Access Control

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 31 | Ownable | owner-only functions | write | Call as non-owner then owner | Revert for non-owner; succeed for owner | Foundry |
| 32 | RBAC | roles & admin roles | write | Grant/revoke roles, test guards | Role gates enforced; events emitted | OpenZeppelin AccessControl |
| 33 | Timelock | queued operations | write | Queue->wait->execute | Cannot execute early; executes after delay | TimelockController |
| 34 | Guardian | emergency stop | write | Trigger guardian function | Only guardian allowed | Custom |
| 35 | MultiSig | threshold signing | offchain | Propose->sign->execute | Below threshold fails; threshold passes | Safe CLI + Foundry |
| 36 | Claimable | two-step ownership | write | transferOwnership->accept | No hijack; only pending can accept | Ownable2Step |
| 37 | Permit Roles | sig-based role grant | write | EIP-712 role grant | Sig verified; replay blocked | EIP-712 |
| 38 | Revocation | role/token revocation | write | Revoke & test access | Access revoked immediately | AccessControl |

## Compliance Controls

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 138 | Blacklist | blocked addresses | write | blacklist then transfer | Revert | — |
| 139 | Whitelist | allowed only | write | non-whitelisted call | Revert | — |
| 140 | Sanctions Oracle | external check | read | mock oracle says flagged | Blocks action | — |
| 141 | KYC NFT | soulbound gating | write | no-KYC user | Access denied | — |

## Cross-Chain & Bridging

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 113 | Lock & Mint | source deposit | cross-chain | approve+lock() | Event emitted; id produced | Bridge mock |
| 114 | Prove & Claim | target chain | cross-chain | submit proof | Mint/release executed once | Light client mock |
| 115 | Timeout | retry/timeout | cross-chain | expire message | Refund path works | — |
| 116 | Replay | message idempotency | cross-chain | resubmit proof | Second attempt rejected | — |
| 117 | Gas Escrow | fee on target | cross-chain | insufficient fee | Queued or revert | — |
| 118 | Finality Window | optimistic rollup | cross-chain | withdraw -> finalize | Cannot finalize early | Rollup mock |

## DoS & Gas

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 132 | Unbounded Loop | large arrays | write | process many items | Gas within cap or revert early | Gas snapshots |
| 133 | Griefing via Revert | external call revert | write | callee reverts | Handled; no funds stuck | Try-catch |
| 134 | Block Gas Limit | upper bound | write | near block limit | Fails gracefully | Anvil config |
| 135 | Storage Blowup | mapping growth | write | fill large mapping | Cost accounted; no overflow | — |
| 136 | Event Flood | log spam | event | emit many | Indexers cope; gas paid | — |
| 137 | Pull Queue | withdraw queue depth | write | large queue | No starvation; pagination | — |

## ERC-20 Conformance

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 55 | Transfer | happy-path | write | transfer() | Balances adjust; event emitted | OpenZeppelin tests |
| 56 | Approve | set allowance | write | approve() | Allowance set; event | — |
| 57 | TransferFrom | spend allowance | write | transferFrom() | Allowance decreases; balances move | — |
| 58 | Permit | EIP-2612 | write | permit() then transferFrom() | Sig valid; nonce inc | EIP-712 |
| 59 | Zero Address | rejections | write | transfer to 0 | Revert | — |
| 60 | Overflow/Underflow | safe math | write | edge values | Reverts on underflow; clamps if custom | — |
| 61 | Mint/Burn Access | role-guarded | write | mint/burn | Only role can mint/burn | AccessControl |
| 62 | Decimals/Name/Symbol | metadata reads | read | view calls | Static values correct | — |
| 63 | Events | Transfer/Approval | event | run ops | Events present & correct | — |
| 64 | Blacklist/Pause | compliance | write | blacklist+transfer | Revert when blacklisted/paused | Compliance mod |

## Economic & MEV Safety

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 83 | Slippage MinOut | DEX swap | write | swap with minOut | Revert on worse price | Uniswap router |
| 84 | Price Band | bounds | write | order outside band | Revert | Risk engine |
| 85 | Sandwich Defense | commit-reveal | write | commit->reveal | Front-running ineffective | Commit scheme |
| 86 | Flash Loan Check | no-fee drain | write | flashloan attempt | Invariants hold | Aave mock |
| 87 | Cooldown | withdrawal delay | write | attempt early | Revert until cooldown | — |
| 88 | Velocity Caps | per-addr TPS | write | flood tx | Rate limit trips | — |
| 89 | Max Position | position limits | write | exceed limits | Revert | — |

## Events & Logs

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 23 | Emission Coverage | All state writes emit events | event | Exercise all paths | Event emitted with correct args | Foundry logs |
| 24 | Ordering | Event order per operation | event | Trigger multiple emits | Order stable & documented | Foundry |
| 25 | No Ghost Events | Reads don't emit | event | Call views | No logs on read | Foundry |
| 26 | Indexing | Filters by topic | event | Query getLogs with topics | Only matching events returned | cast/ethers-rs |
| 27 | Reorg Handling | Remove/add logs on reorg | event | Simulate reorg on fork | Consumer handles idempotently | Custom indexer |
| 28 | Overflow Topics | Many events in block | event | Emit 1k events | Indexer does not drop | TheGraph/subgraph |
| 29 | Sparse Ranges | Wide block scan | event | Scan large range | No timeouts; pagination ok | Batch scans |
| 30 | ABI Decode Fail | Malformed log data | event | Fuzz topic/data length | Decoder errors handled | Fuzz + decoder |

## Governance

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 107 | Delegate | voting power | write | delegate() | Votes credited | ERC20Votes |
| 108 | Proposal Flow | propose->queue->execute | write | full lifecycle | Only valid states progress | Governor |
| 109 | Quorum | quorum reached | read | getVotes at snapshot | >= quorum | — |
| 110 | Cancel | authorized cancel | write | cancel() | Only proposer/guardian | — |
| 111 | Upgrade via Gov | gov controls proxy | write | execute upgrade | Auth via proposal | — |
| 112 | Attack Sim | flash-loan voting | write | attempt with snapshot rules | Mitigated by snapshots | — |

## Interface & ABI

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 0 | ABI Decoding | Decode view return types | read | eth_call on multiple view fns | Decoded types match ABI; no panic on tuple/array | Foundry/Hardhat, ethers.js, alloy/ethers-rs |
| 1 | ABI Encoding | Encode complex inputs | read | Staticcall with encoded args (structs, arrays) | Contract reads inputs correctly (echo tests) | Foundry cheatcodes |
| 2 | Selector Mapping | Function selector collisions | read | Compare selectors; call via selector | No unintended function executed | Slither/Surya + Foundry |
| 3 | Error Selector | Custom errors ABI | write | Trigger revert paths | Error selectors & args match | Foundry expectRevert |
| 4 | Event Topics | Event signature & indexed topics | event | Emit events; capture logs | Topics align with ABI; non-indexed data decodes | Foundry/ethers-rs log decode |

## Math & Accounting

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 119 | Rounding | down/up rules | read | calc with edge values | Documented rounding held | PRBMath/FixedPoint |
| 120 | Overflow | mul/div add/sub | write | max uint ops | Revert or correct behavior | Checked math |
| 121 | Fee Accounting | fee skim | write | apply fee | Sum of parts == total | — |
| 122 | Dust Handling | tiny amounts | write | transfer dust | Not stuck; policy-defined | — |
| 123 | Invariant Sums | conservation | write | trade/settle | Assets conserved | Invariant test |
| 124 | Precision Loss | decimal scaling | read | scale repeated | Bounded error | — |
| 125 | Signed Ints | negatives | write | borrow/repay negatives | Revert or allowed as spec | — |
| 126 | Funding Rate | perps math | read | calc funding | Matches spec | — |

## Meta-Transactions & Account Abstraction

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 95 | EIP-2771 | trusted forwarder | write | execute via forwarder | _msgSender correct | Forwarder mock |
| 96 | Replay AA | UserOp nonce | write | resubmit same op | Rejected by nonce | ERC-4337 bundler mock |
| 97 | Paymaster | gas sponsorship rules | write | invalid paymaster sig | UserOp rejected | Paymaster mock |
| 98 | AA Sig | aggregated signature | write | invalid agg | Rejected | Aggregator mock |
| 99 | AA PostOp | refund/accounting | write | out-of-gas in postOp | Handled; no stuck state | EntryPoint |
| 100 | Intent Packing | callData packing | write | malformed callData | Validation fails | — |

## NFT Standards

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 65 | Mint721 | safe mint | write | safeMint() | Receiver hook passes | ERC721Receiver |
| 66 | Transfer721 | safe transfer | write | safeTransferFrom() | Owner updates; event | — |
| 67 | Approval721 | approve operator | write | setApprovalForAll() | Operator can transfer | — |
| 68 | URI721 | tokenURI | read | read URI | Correct composition/IPFS | — |
| 69 | Mint1155 | batch mint | write | mintBatch() | Balances updated | — |
| 70 | Transfer1155 | safe batch | write | safeBatchTransferFrom() | Hook checks | ERC1155Receiver |
| 71 | Royalty | ERC2981 | read | royaltyInfo() | Correct receiver/amount | — |
| 72 | Enumerable | ERC721Enumerable | read | totalSupply() | Indexes consistent | — |
| 73 | Freeze/Reveal | metadata flow | write | reveal() | URIs switch correctly | — |
| 74 | PermitNFT | permit-like | write | permit for 721 if supported | Sig grants approval | EIP-4494 |

## Observability & DevEx

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 142 | Event Coverage % | emission ratio | event | trace all writes | >= 95% important writes emit | Coverage tool |
| 143 | Error Codes | custom errors | write | trigger each error | Human-readable & unique | — |
| 144 | NatSpec/Docs | ABI docs | offchain | docgen | Docs up to date | solc --userdoc |
| 145 | Debug Hooks | if enabled | offchain | toggle flags | No leak in prod build | Forge profile |

## Oracle & Market Data

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 75 | Heartbeat | staleness | read | read latestRoundData() | age <= heartbeat | Chainlink mocks |
| 76 | Deviation | drift threshold | read | compare prev vs new | abs% <= limit | — |
| 77 | Quorum | multi-agg | read | aggregate N sources | Require quorum met | Mock oracles |
| 78 | Fallback TWAP | AMM twap | read | uniV2 twap calc | Used when oracle stale | Uniswap math |
| 79 | Sequencer Uptime | L2 flag | read | read uptime feed | If down -> revert/failsafe | Arbitrum/Optimism flag |
| 80 | Scaling | decimals normalization | read | normalize to 18 | No precision loss | Math lib |
| 81 | Freeze | halted prices | read | frozen feed | Fails safe; no trades | Policy |
| 82 | Spoof Defense | insane values | read | fuzz large values | Clamped/rejected | Fuzz |

## Pausability & Circuit Breakers

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 39 | Pause Writes | paused blocks writes | write | pause(); attempt writes | Revert on write; reads OK | Pausable |
| 40 | Unpause | resume operations | write | unpause(); retry | Writes succeed | Pausable |
| 41 | Pause Roles | who can pause | write | non-pauser attempt | Revert for non-pauser | AccessControl |
| 42 | Selective Pause | pause subset | write | pause(feature) | Only affected paths revert | Feature flags |
| 43 | Rate Limit | velocity caps | write | rapid calls | Exceeding rate reverts | TokenBucket |
| 44 | Circuit Trip | error budget burn | write | Inject repeated failures | Auto-trip; require manual reset | Circuit module |

## Read-Only Views

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 5 | Single Read | Simple getter returns | read | Call views | Return values correct; no side-effects | Foundry, cast call |
| 6 | Batch Read | Multicall aggregation | read | Aggregate via Multicall | All results decoded; gas within limits | Multicall, Foundry |
| 7 | Historical Read | blockTag at N-100, hash | read | Call at historical block | Values match archival expectations | Anvil fork, archive RPC |
| 8 | Storage Slots | eth_getStorageAt / mapping slot math | read | Compute slot & fetch | Computed slot returns expected value | Foundry vm.load, cast storage |
| 9 | Boundary Read | Empty/zero state | read | Zero/None cases | No revert; returns default | Foundry |
| 10 | Permissioned View | onlyRole-view guard | read | Role-limited view | Reverts without role; passes with role | Foundry roles |
| 11 | Gasless Sim | eth_call mirrors state | read | Simulate state-changing via staticcall | Reverts on writes under staticcall | Foundry |
| 12 | Reorg-safe Read | Confirm state across blocks | read | Compare consecutive heads | No unexpected drift across 3 blocks | WS provider |

## Reentrancy & Atomicity

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 90 | CEI Pattern | checks-effects-interactions | write | call external then internal | No reentrancy effect | Reentrant tester |
| 91 | ReentrancyGuard | nonReentrant | write | recursive call | Reverts on reenter | Guard |
| 92 | Pull Payments | withdraw pattern | write | multiple withdrawals | No double-withdraw | — |
| 93 | Reentrancy via ERC777 | hooks | write | send with hook | Guard holds | ERC777 mock |
| 94 | Cross-Function | A->B->A path | write | craft path | Guard holds | Custom |

## Signatures & Permit

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 101 | EIP-712 Domain | chainId mismatch | offchain | sign on chain A, send on B | Invalid signature | Foundry/ethers |
| 102 | Permit Nonce | increment per owner | write | reuse permit | Replay blocked | ERC20Permit |
| 103 | Permit Deadline | expired | write | past deadline | Revert | — |
| 104 | Permit2 | allowance bounds | write | spend > allowance | Revert; events | Permit2 |
| 105 | Sig Malleability | v/r/s bounds | offchain | low-s / zero-v | Rejected | secp256k1 rules |
| 106 | Ecrecover Zero | zero addr protection | offchain | ecrecover(0) | Fail gracefully | — |

## State-Changing Writes

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 13 | Direct Tx | Happy-path state write | write | Call core mutating fn | State changed; event emitted | Foundry |
| 14 | Batch/Multicall | Multiple writes in 1 tx | write | Use on-chain Batch/Multicall | All side effects occur atomically | Foundry/Router |
| 15 | Idempotency | Re-submit tx replacement | write | Same nonce higher gas | Single effect; no duplication | Foundry/ethers-rs NonceManager |
| 16 | Replay Protection | ChainId & nonce | write | Try replay on fork with diff chainId | Replay fails | Anvil forks |
| 17 | Access List | EIP-2930 | write | Send with access list | Gas reduced; no behavioral change | geth/Anvil |
| 18 | Revert Reasons | Error paths | write | Trigger each require/revert | Correct custom errors emitted | expectRevert |
| 19 | Fee Caps | EIP-1559 bounds | write | maxFee < basefee -> expect revert | Tx rejected; error code | Anvil config |
| 20 | Permit+Action | Approve+use in same tx | write | Call permit then transferFrom | Allowance set then spent | ERC20Permit |
| 21 | Nonce Gap | Multiple pending tx | write | Send out-of-order nonces | Mempool handling; eventual success | Local node |
| 22 | Deadline | Expiry enforcement | write | Set past deadline | Revert with Expired | Foundry |

## Time & Scheduling

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 127 | Block Timestamps | now usage | read | advance time | Time math correct | vm.warp |
| 128 | Deadlines | tx expiry | write | past deadline | Revert | — |
| 129 | Cliffs & Vesting | schedule | read | claim windows | Claims limited to schedule | — |
| 130 | Cooldowns | per-op delay | write | call twice quickly | Second call blocked | — |
| 131 | TWAP Windows | oracle twap | read | vary window size | Window honored | — |

## Upgradeability / Proxy

| ID | Sub-Type | Test Name | Interaction | What to Do | Key Assertions | Suggested Tools |
|----|----------|-----------|-------------|------------|----------------|-----------------|
| 45 | Proxy Calls Impl | delegatecall correct | write | Call via proxy | State changes in proxy storage | UUPS/Transparent |
| 46 | Storage Layout | layout compatibility | offchain | Compare structs/slots | No slot collision; gaps kept | Storage layout checker |
| 47 | Upgrade Auth | only admin can upgrade | write | Attempt upgrade by non-admin | Revert unauthorized | UUPS/Transparent |
| 48 | Upgrade Event | Upgraded emitted | event | Perform upgrade | Event contains new impl | Event decode |
| 49 | Rollback Plan | upgrade -> rollback | write | Upgrade then rollback | State consistent; no bricking | Playbook test |
| 50 | Initialize Once | initializer guard | write | call initialize twice | Second call reverts | Initializable |
| 51 | Delegatecall Attack | impl selfdestruct | write | Try selfdestruct via impl | Proxy safe; no bricking | Hardhat/Foundry fork |
| 52 | EIP-1967 Slots | read impl/admin | read | Read slots | Addresses match expectations | cast storage |
| 53 | Upgrade with Data | upgradeToAndCall | write | Upgrade + init call | Both succeed atomically | UUPS |
| 54 | Beacon Proxy | beacon pattern | write | Swap beacon impl | All proxies point to new impl | Beacon |

---

*Total Tests: 146*