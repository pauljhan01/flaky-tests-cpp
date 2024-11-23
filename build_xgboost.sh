#!/bin/bash
mkdir xgboost/build
cd xgboost/build
cmake ..
make -j16
