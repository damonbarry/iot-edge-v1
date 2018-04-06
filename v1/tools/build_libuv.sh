#!/bin/bash

# Copyright (c) Microsoft. All rights reserved.
# Licensed under the MIT license. See LICENSE file
# in the project root for full license information.

set -e

libuv_config=$1
libuv_root=$(cd "$(dirname "$0")/../deps/libuv" && pwd)

cd $libuv_root
sh autogen.sh
./configure --libdir=$libuv_root/build/$libuv_config CFLAGS='-fPIC' CXXFLAGS='-fPIC'
make -j $(nproc)
make install