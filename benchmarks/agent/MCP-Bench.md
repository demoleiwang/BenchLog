# MCP-Bench

> Accenture's MCP benchmark: LLM agents call **250 tools across 28 live MCP servers** (finance, travel, scientific computing, academic search) on multi-step tasks that test fuzzy tool retrieval, multi-hop planning, and cross-domain orchestration. NeurIPS 2025 Workshop accepted.

|  |  |
|---|---|
| **Category** | agent / MCP / tool use |
| **Released** | 2025-08 |
| **Paper** | [arXiv:2508.20453](https://arxiv.org/abs/2508.20453) |
| **Project / Code** | [github.com/Accenture/mcp-bench](https://github.com/Accenture/mcp-bench) · leaderboard [huggingface.co/spaces/mcpbench/mcp-bench](https://huggingface.co/spaces/mcpbench/mcp-bench) |
| **Maintainer** | Accenture |
| **Size** | 28 MCP servers, 250 tools |
| **License** | per GitHub |
| **Status** | active; accepted to NeurIPS 2025 Workshop on Scaling Environments for Agents |

## What it measures

Whether an LLM agent can retrieve and coordinate tools from a large, diverse pool of **live MCP servers** to complete realistic multi-step tasks. Unlike toy tool-use benchmarks, MCP-Bench connects to actual running MCP servers in production-like domains.

The evaluation surfaces four capabilities not tested well by earlier function-calling benchmarks:

1. **Fuzzy tool retrieval** — finding relevant tools from natural-language instructions without explicit tool names.
2. **Multi-hop planning** — decomposing complex objectives into ordered tool-call trajectories.
3. **Output grounding** — conditioning on intermediate tool outputs before the next call.
4. **Cross-domain orchestration** — chaining tools across finance / travel / science / search domains in one task.

## Task format

- **Input:** a natural-language objective referencing a realistic domain (e.g., "Compile a travel-and-science report for a conference trip to Kyoto").
- **Output:** a tool-call trajectory across one or more MCP servers ending in a final response.
- **Scoring:** multi-faceted — tool-level schema understanding, trajectory-level planning, and task completion. Specific metric weightings per paper.
- **Splits:** varies by the task's domain combination.

## Example

Representative task (paraphrased): *"I'm attending a conference in Singapore in September. Find the top 3 papers from this year's ACL that cite Transformer-XL, book a direct flight from SFO with a flexible cancellation, and reserve a co-working desk near Marina Bay for the 4 conference days."* The agent must use an academic-search MCP, a travel MCP, and a booking MCP in one coordinated trajectory.

_Source: [github.com/Accenture/mcp-bench](https://github.com/Accenture/mcp-bench)._

## Leaderboard (snapshot)

The live leaderboard is at [huggingface.co/spaces/mcpbench/mcp-bench](https://huggingface.co/spaces/mcpbench/mcp-bench). Cite it directly for current rankings.

| Model | Score | Source |
|---|---:|---|
| _live leaderboard — fetch during daily update_ | _unknown_ | [huggingface.co/spaces/mcpbench/mcp-bench](https://huggingface.co/spaces/mcpbench/mcp-bench) |

_The paper reports results across 20 frontier LLMs; MCP-Bench is distinct from [MCPMark](MCPMark.md) (stress-test oriented) — both are valuable and typically reported separately._

## Critique & known issues

- **"Live MCP servers" is a feature and a maintenance cost.** Scores degrade over time as servers drift; the benchmark requires active maintenance.
- **Accenture is a vendor.** Benchmark positioning may be influenced by what matters to enterprise customers. Useful signal, not an independent academic baseline.
- **Multi-faceted scoring is hard to aggregate.** The paper reports multiple axes; "overall MCP-Bench score" is not a clean single number.
- **Cross-domain tasks reward generalist training.** Specialist single-domain agents may score poorly despite being production-ready for their narrow use case.
- **Frequent re-runs needed.** MCP server updates can shift scores between evaluation runs even without model change.

## Related benchmarks

- [MCPMark](MCPMark.md) — stress-test oriented, 127 tasks, pass^4 metric
- [Tool-Decathlon](Tool-Decathlon.md) — broader than MCP, 604 tools across 32 apps
- [BFCL](BFCL.md) — function-calling accuracy, no MCP specialisation
- MCPAgentBench / MCP-Universe — community siblings tracked in digests

## Update log

- 2026-04-15: Initial entry — live leaderboard intentionally left as a pointer to the HF Space
