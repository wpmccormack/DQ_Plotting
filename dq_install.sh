#!/bin/bash

#sudo mount -t cvmfs seaquest.opensciencegrid.org /cvmfs/seaquest.opensciencegrid.org
#sudo yum install sqlite-devel

#git clone https://github.com/DarkQuest-FNAL/e1039-core.git
git clone https://github.com/wpmccormack/e1039-core.git
cd e1039-core
git checkout electron_tracking
cd script/
cp /data/t3home000/pcharris/DQ/e1039-core/script/setup-install.sh .
cd ..
./script/setup-install.sh auto
source ../core-inst/this-e1039.sh
./build.sh

#git clone https://github.com/DarkQuest-FNAL/DarkQuest.git
git clone https://github.com/wpmccormack/DarkQuest.git
cd DarkQuest
git checkout add_ana_flag
cd e1039-analysis/SimHits/
pwd
sed "s@XXX@$PWD@g" /data/t3home000/pcharris/DQ/DarkQuest/e1039-analysis/SimHits/setup_mye1039_tmp.sh > setup_mye1039.sh 

source setup_mye1039.sh
mkdir work
mkdir install
cd work
#pwd
cmake ../src/ -DCMAKE_INSTALL_PREFIX=../install
make clean
make
make install
cd ../

