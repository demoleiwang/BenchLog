# Tracked sources

Claude reads this file at the start of each daily run and fetches each URL.

## Primary feeds

| Source | URL | Notes |
|---|---|---|
| HuggingFace Daily Papers | https://huggingface.co/papers | Curated daily; high signal |
| arXiv cs.CL recent | https://arxiv.org/list/cs.CL/recent | NLP / LLM papers |
| arXiv cs.AI recent | https://arxiv.org/list/cs.AI/recent | Broader AI |
| OpenAI news | https://openai.com/news/ | Model releases, evals |
| Anthropic news | https://www.anthropic.com/news | Model releases, evals |

## Secondary feeds (fetch when time permits)

| Source | URL | Notes |
|---|---|---|
| Papers With Code SOTA | https://paperswithcode.com/sota | Cross-benchmark leaderboards |
| Google DeepMind blog | https://deepmind.google/discover/blog/ | Releases & research |
| Meta AI blog | https://ai.meta.com/blog/ | Llama, model releases |
| Hugging Face Open LLM Leaderboard | https://huggingface.co/spaces/open-llm-leaderboard/open_llm_leaderboard | Community scores |

## Manual sources (user pastes URLs)

- **Twitter/X**: Lei pastes individual tweet URLs in the chat when running an update.
- **Conference / workshop announcements**: pasted ad-hoc.

## Adding a new source

Append to "Primary" or "Secondary" with: human-readable name, canonical URL, one-line note. Then commit.
