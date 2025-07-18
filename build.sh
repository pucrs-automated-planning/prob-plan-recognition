echo "1. Building preprocess"
cd ./lama/preprocess && mkdir -p obj && make
if [ $? -ne 0 ]; then
  echo "Preprocess build failed."
  cd ../..
  exit 1
fi

echo "2. Building search"
cd ../search && mkdir -p obj && make
if [ $? -ne 0 ]; then
  echo "Search build failed."
  cd ../..
  exit 1
fi

cd ../..