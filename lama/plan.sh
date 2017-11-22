#! /bin/sh

# Command line arguments seem lsto be fine, run planner
echo "1. Running translator"
python ./translate/translate.py $1 $2
echo "2. Running preprocessor"
./preprocess/preprocess < output.sas
echo "3. Running search"
./search/search l $3 < output