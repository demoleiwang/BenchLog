# ScreenSpot-Pro

> A high-resolution **GUI grounding** benchmark — given a natural-language instruction and a professional-app screenshot (Photoshop, IDE, CAD, etc.), predict the exact pixel coordinates of the target element. At launch, best base model hit only 18.9%; a dedicated visual-search method (ScreenSeekeR) reached 48.1%.

|  |  |
|---|---|
| **Category** | agent / GUI / grounding |
| **Released** | 2025-04 |
| **Paper** | [arXiv:2504.07981](https://arxiv.org/abs/2504.07981) |
| **Project / Code** | [github.com/likaixin2000/ScreenSpot-Pro-GUI-Grounding](https://github.com/likaixin2000/ScreenSpot-Pro-GUI-Grounding) · leaderboard [llm-stats.com/benchmarks/screenspot-pro](https://llm-stats.com/benchmarks/screenspot-pro) |
| **Maintainer** | Kaixin Li et al.; ACM Multimedia 2025 |
| **Size** | expert-annotated images spanning **23 applications** across 5 industries and 3 operating systems |
| **License** | per GitHub |
| **Status** | active; the reference "can the model actually click the right button" benchmark at high resolution |

## What it measures

**GUI grounding** — the foundational skill for any computer-use agent: given a screenshot and a natural-language instruction ("click the Masks panel", "select the second frame in the timeline"), output the correct (x, y) pixel coordinates of the target.

Unlike OSWorld (which measures end-to-end task completion) or WebArena (which measures DOM-mediated web actions), ScreenSpot-Pro isolates *perception + localisation* on the visual modality alone. If a model can't ground, it can't act — regardless of how good its planning or reasoning is.

The **professional / high-resolution** framing is the differentiator:
- Targets are tiny (small toolbar icons in Photoshop, CAD widgets, IDE symbols)
- Screens are large (4K+ displays common in professional workflows)
- Applications are complex (Photoshop, Premiere, Blender, VSCode, Jupyter, AutoCAD)

Base models at launch scored **18.9% top** — a fundamental perception gap. The paper's **ScreenSeekeR** visual search method reached 48.1% without additional training, demonstrating that search-and-zoom is cheap latent capability.

## Task format

- **Input:** high-resolution screenshot + natural-language description of a target UI element.
- **Output:** (x, y) pixel coordinate.
- **Scoring:** correct if the predicted coordinate falls within the ground-truth bounding box. Reported per-industry and overall.
- **Splits:** by OS (3) × industry (5) × application (23).

## Example

Representative example: *"Click the 'Curves' adjustment layer icon in the Layers panel."* In a 3840×2160 Photoshop screenshot, the Curves icon is ~30×30 pixels; the model must output coordinates within that tiny target.

_Source: [github.com/likaixin2000/ScreenSpot-Pro-GUI-Grounding](https://github.com/likaixin2000/ScreenSpot-Pro-GUI-Grounding)._

## Leaderboard (snapshot)

Live leaderboard at [llm-stats.com/benchmarks/screenspot-pro](https://llm-stats.com/benchmarks/screenspot-pro).

| Model / Method | Accuracy | Note | Source |
|---|---:|---|---|
| ScreenSeekeR (visual search method) | 48.1% | no additional training | [arXiv:2504.07981](https://arxiv.org/abs/2504.07981) |
| Best base GUI grounding model at launch | 18.9% | 2025-04 | [arXiv:2504.07981](https://arxiv.org/abs/2504.07981) |

_Dedicated GUI-grounding models (UGround, OS-Atlas, ShowUI, Claude-with-computer-use) publish ScreenSpot-Pro numbers; add source-linked rows from those reports._

## Critique & known issues

- **Pure grounding, no reasoning.** The benchmark isolates perception; real agents also need planning. A model great at ScreenSpot-Pro may still flounder on OSWorld if its action planning is weak.
- **High-resolution is a deliberate choice.** Models trained on low-res screenshots collapse; this is fair for professional use cases but excludes simpler GUI domains where resolution is lower.
- **23 applications is narrow for "professional".** CAD/video-editing/IDE-heavy; industries like medical imaging, scientific instrumentation are absent.
- **Bounding-box ground truth has tolerance issues.** Targets near boundary get penalised for near-miss predictions; intrinsic metric noise.
- **Single-step only.** No multi-step interactions. A task like "drag this layer to rename it" isn't testable.
- **ScreenSeekeR's 48.1% sets a search-based ceiling.** The gap between 48.1% and base-model 18.9% suggests grounding is mostly a search / zoom problem, not a perception problem.

## Related benchmarks

- ScreenSpot / ScreenSpot-v2 — original lower-resolution predecessor
- [OSWorld](OSWorld.md) — end-to-end desktop agent; ScreenSpot-Pro is a component skill
- [AndroidWorld](AndroidWorld.md) — mobile counterpart
- [VisualWebArena](VisualWebArena.md) — web multimodal sibling
- UGround / OS-Atlas / ShowUI — models trained specifically to do GUI grounding

## Update log

- 2026-04-15: Initial entry
