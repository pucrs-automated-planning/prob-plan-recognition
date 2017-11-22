#! /bin/sh

# Command line arguments seem lsto be fine, run planner
echo "1. Running translator"
python /Users/ramonfragapereira/Workspace/MyRecogniser/lama/translate/translate.py $1 $2
echo "2. Running preprocessor"
/Users/ramonfragapereira/Workspace/MyRecogniser/lama/preprocess/preprocess < output.sas
echo "3. Running search"
/Users/ramonfragapereira/Workspace/MyRecogniser/lama/search/search l $3 < output