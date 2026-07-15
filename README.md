# Probabilistic Plan Recognition

*Plan recognition* is the problem of inferring an agent's goal from a partial sequence of its observed
actions. This repository packages Miguel Ramírez and Héctor Geffner's
[*Probabilistic Plan Recognition as Planning*](http://dblp.org/rec/conf/aaai/RamirezG10) (AAAI-10)
into a single, buildable project, gathering the original solver and its planner dependencies with
clear build instructions. It is a structured reorganisation of Ramírez's
[original implementation](https://sites.google.com/site/prasplanning).

## How it works

The method reduces plan recognition to classical planning. Given a domain, a set of candidate goal
*hypotheses*, and an observed action sequence, we compute for each hypothesis `G` two plan costs: the
cost of achieving `G` while honouring the observations (`cost(G, O)`) and the cost of achieving it
while *not* honouring them (`cost(G, ¬O)`). Their difference `Δ = cost(G, O) − cost(G, ¬O)` measures
how much the observations cost the agent under hypothesis `G`. We turn this difference into a
posterior with a Boltzmann (softmax) model,

```text
P(O | G) = exp(−β·Δ) / (1 + exp(−β·Δ)),
```

where `β > 0` penalises non-optimal behaviour. Ranking the hypotheses by `P(O | G)` yields the most
likely goal. The parameter `β` is set with the `-b` flag.

The pipeline has three stages, glued together by the Python driver:

1. **Compile.** `pr2plan` (built from `obs-compiler/`) rewrites a plan-recognition task into a pair of
   classical planning problems, one that forces the observations (`O`) and one that avoids at least
   one of them (`neg-O`).
2. **Plan.** An off-the-shelf planner solves each problem. We support LAMA (satisficing), `hsp_f`
   (optimal), and Metric-FF, selected by command-line flag.
3. **Score.** The driver reads the two plan costs, computes `Δ`, and reports the posterior over
   hypotheses.

## Repository layout

| Path | Contents |
| --- | --- |
| `prob_PR.py` | Main entry point: loads hypotheses, runs the compile–plan–score pipeline, writes `report.txt`. |
| `PR_sim.py` | Simulation driver used for the "Noisy Walk" figure in the AAAI-10 paper; feeds growing observation prefixes and emits per-timestep CSVs. |
| `options.py` | Command-line parsing; also unpacks the experiment archive into the working directory. |
| `hypothesis.py` | Per-hypothesis logic: PDDL generation, planning, and posterior computation. |
| `translation.py` | Wrapper that invokes `pr2plan` to produce the `O`/`neg-O` planning problems. |
| `planners.py` | Thin wrappers over LAMA, `hsp_f`, and Metric-FF that parse plan cost from each planner's log. |
| `benchmark.py` | Resource-bounded process runner (CPU and memory limits via `setrlimit`). |
| `obs-compiler/` | Source of `pr2plan`, the observation compiler, bundled with a modified Metric-FF (`mod-metric-ff`). |
| `pr/optimal/` | Prebuilt `pr2plan` and Patrik Haslum's optimal planner `hsp_f`. |
| `pr/suboptimal/` | Metric-FF-based suboptimal recogniser. |
| `pr/seq-opt-hspsf/` | Sources for `hsp_f` (IPC-6 seq-opt-hspsf). |
| `lama/` | LAMA planner (`translate`, `preprocess`, `search`). |
| `experiments/` | Goal/plan-recognition dataset (git submodule). |

> **Note.** The Python glue is written for **Python 2** (it uses `print >>` statements) and will not
> run under Python 3 as-is. A port is tracked in the issues; see *Converting to Python 3* below.

## Building

Run every command from the repository root, and initialise the dataset submodule first:

```bash
git submodule update --init
```

### LAMA

```bash
pushd lama/preprocess && mkdir -p obj && make && popd
pushd lama/search     && mkdir -p obj && make && make release-search && popd
```

### The observation compiler (`pr2plan`)

`obs-compiler/build.sh` builds `pr2plan` on both Linux and macOS. It selects a GNU toolchain
automatically: the system `gcc`/`g++` on Linux, and a Homebrew `gcc` on macOS, since Apple clang
cannot compile the bundled 2010-era Metric-FF sources.

```bash
# macOS only: install a GNU compiler first
brew install gcc

pushd obs-compiler && ./build.sh && popd
```

Copy the resulting `obs-compiler/pr2plan` into `pr/optimal/` if you want to replace the prebuilt
binary. Building needs `bison` and `flex` on the `PATH` (`brew install bison flex` on macOS).

### The optimal planner (`hsp_f`)

`hsp_f` is Patrik Haslum's optimal planner (IPC-6 `seq-opt-hspsf`, sources under `pr/seq-opt-hspsf/`).
Build it per its own README and place the executable at `pr/optimal/hsp_f`. A prebuilt binary is
already checked in there.

## Running

`prob_PR.py` takes a single experiment archive and a planner choice. For example, satisficing
recognition with LAMA:

```bash
python prob_PR.py -e experiments/blocks-world/50/block-words_p01_hyp-2_50_1.tar.bz2
```

The main flags are:

| Flag | Meaning |
| --- | --- |
| `-e <file>` | Experiment archive (`.tar.bz2`) to run. |
| `-O` | Optimal recognition with `hsp_f`. |
| `-F` | Use Metric-FF for satisficing planning. |
| `-G` | Greedy LAMA (accept the first solution). |
| `-b <β>` | Boltzmann parameter (positive real). |
| `-t <secs>` / `-m <MB>` | Time and memory bounds per hypothesis. |
| `-S` | Simulation mode (generate observations). |
| `-D` | Use the provided `obs.dat` instead of generating observations. |

### Experiment archives

Each archive under `experiments/` is one recognition instance and unpacks to the files the driver
expects: `domain.pddl`, a `template.pddl` carrying a `<HYPOTHESIS>` placeholder, `hyps.dat` (one
candidate hypothesis per line, as comma-separated goal atoms), `obs.dat` (the observed actions), and
`real_hyp.dat` (the ground-truth hypothesis, used only to label results). The numeric subdirectories
(`10`, `30`, `50`, `70`, `100`) give the percentage of the plan that is observed; `-noisy` variants
add spurious observations.

## Converting to Python 3

The driver and its helpers target Python 2. Porting them to Python 3 is tracked as a separate task;
see the open *Convert this to Python 3* issue and the accompanying `python3-translation-test` branch.

## Credits

The recognition method and the original solver are the work of Miguel Ramírez and Héctor Geffner
(Universitat Pompeu Fabra); see their [project page](https://sites.google.com/site/prasplanning) and
the AAAI-10 paper. `hsp_f` is due to Patrik Haslum, and Metric-FF to Jörg Hoffmann.
