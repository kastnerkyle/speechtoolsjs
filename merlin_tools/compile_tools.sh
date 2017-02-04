#!/bin/bash

# 1. Get and compile SPTK

if [ ! -d "SPTK-3.9" ]; then
  echo "Not found, downloading SPTK-3.9..."
  wget http://downloads.sourceforge.net/sp-tk/SPTK-3.9.tar.gz
  tar xzf SPTK-3.9.tar.gz
  # Control will enter here if $DIRECTORY doesn't exist.
fi

echo "compiling SPTK..."
# edge case related to emscripten and pos.__pos and clang...
# in bin/vc - skip it...
#mv SPTK-3.9/bin/vc .
#mv SPTK-3.9/bin/xgr .
cp SPTK-3.9/configure.ac .
cp configure.ac configure.ac.bak
sed -i '277 d' configure.ac
sed -i '268 d' configure.ac
cp configure.ac SPTK-3.9/configure.ac
(
    cd SPTK-3.9;
    autoconf
    emconfigure ./configure --prefix=$PWD/build --enable-da=no;
    emmake make;
)
#rm -rf SPTK-3.9/bin/vc
#rm -rf SPTK-3.9/bin/xgr
#mv vc SPTK-3.9/bin
#mv xgr SPTK-3.9/bin
cp configure.ac.bak SPTK-3.9/configure.ac

# 2. Getting WORLD

echo "compiling WORLD..."
(
    cd WORLD;
    emmake make
    emmake make analysis synth
)

#make clean
# 3. Copy binaries

#mkdir -p bin
#mkdir -p bin/SPTK-3.9
#mkdir -p bin/WORLD

#cp SPTK-3.9/build/bin/* bin/SPTK-3.9/
#cp WORLD/build/analysis bin/WORLD/
#cp WORLD/build/synth bin/WORLD/

#echo "All tools successfully compiled!!"
