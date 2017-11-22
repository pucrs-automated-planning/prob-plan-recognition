#! /bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


rm -rf output.sas
rm -rf output

# BLOCKSWORLD
#pddlDomain="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/blocksworld/blocksworld.pddl"
#pddlProblem="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/blocksworld/pb0.pddl"

# BLOCKSWORLD_ARM
#pddlDomain="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/blocksworld_arm/blocksworld_arm.pddl"
#pddlProblem="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/blocksworld_arm/pb98.pddl"

# LOGISTICS
# pddlDomain="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/logistics/logistics.pddl"
# pddlProblem="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/logistics/pb99.pddl"

# pddlDomain = $1
# pddlProblem = $2

# DEPOS
#pddlDomain="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/depots/depots.pddl"
#pddlProblem="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/depots/pb1.pddl"

# EASY_IPC_GRID
#pddlDomain="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/easy_ipc_grid/easy_ipc_grid.pddl"
#pddlProblem="/Users/ramonfragapereira/Workspace/MyRecogniser/planabandonment/easy-ipc-grid/pb5.pddl"

# GRIPPER
#pddlDomain="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/gripper/gripper.pddl"
#pddlProblem="/Users/ramonfragapereira/Workspace/Planning-Utils/examples/pddl/gripper/pb2.pddl"

# ELEVATORS
#pddlDomain="/Users/ramonfragapereira/Workspace/MyRecogniser/examples/pddl/elevators-strips/p01-domain.pddl"
#pddlProblem="/Users/ramonfragapereira/Workspace/MyRecogniser/examples/pddl/elevators-strips/p01.pddl"

# Command line arguments seem lsto be fine, run planner
echo "1. Running translator with $1 $2"
python ${DIR}/translate/translate.py $1 $2
echo "2. Running preprocessor"
${DIR}/preprocess/preprocess < output.sas
echo "3. Running search"
${DIR}/search/search l outputLama < output