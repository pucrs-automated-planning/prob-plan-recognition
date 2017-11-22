# Probabilistic Plan Recognition

Structured Ramirez's implementation of [Probabilistic plan recognition](http://dblp.org/rec/conf/aaai/RamirezG10) organized in a neat repository with links to the dependencies.

## Instructions

### Building LAMA

```bash
pushd lama/preprocess
mkdir obj
make
popd
pushd lama/search
mkdir obj
make
make release-search
popd
```

### Building Plan2PR

Only works in linux
```bash
pushd pr
bash build.sh
poop
```

## Original Notes (From Ramirez):

- You'll need to compile the program for mapping PR tasks into planning tasks (see 'obs-compiler' folder) and put the resulting executable binary file ('plan2pr') inside this folder.
- Download LAMA sources from the IPC-6 homepage, http://bit.ly/aPzUJh. Extract the tarball and copy the contents from 'seq-sat-lama' folder into this one. See LAMA's README for instructions for building and using LAMA.
- Download hsp_f sources from the IPC-6 homepage, http://bit.ly/aI5xoS, build it and place the resulting executable binary file 'hsp_f' inside this folder.
- Note that you can easily add the code for trying different planners by writing a custom wrapper for it (see planners.py for examples).
- 'prob_PR.py' is the main script, which glues together the PR to planning mapping transformation with one of the supported planners.
- 'PR_sim.py' is the script we used to generate the data for the "Noisy Walk" figure in our AAAI-10 paper.
