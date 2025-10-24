#! /bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Command line arguments seem lsto be fine, run planner
echo "1. Running translator"
python ${DIR}/translate/translate.py $1 $2
echo "2. Running preprocessor"
${DIR}/preprocess/preprocess < output.sas
echo "3. Running search"
${DIR}/search/search l $3 < output