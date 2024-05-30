#!/bin/bash

# Install the required packages
EA_PREFIX=/opt/EA/inf

# gtest

if [ -d gtest_build ]; then
    rm -rf gtest_build
fi
mkdir -p gtest_build
cd gtest_build
cmake ../googletest-release-1.12.1 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} -DCMAKE_PREFIX_PATH=${EA_PREFIX} -DCMAKE_BUILD_TYPE=Release
make -j4
make install
cd ..
rm -rf gtest_build

# benchmark
if [ -d benchmark_build ]; then
    rm -rf benchmark_build
fi
mkdir -p benchmark_build
cd benchmark_build
cmake ../benchmark-1.8.4 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} -DCMAKE_PREFIX_PATH=${EA_PREFIX} -DCMAKE_BUILD_TYPE=Release -DBENCHMARK_ENABLE_TESTING=OFF
make -j4
make install
cd ..
rm -rf benchmark_build

# gflags
# readelf --relocs libdest.a | egrep '(GOT|PLT|JU?MP_SLOT)'

if [ -d gflags_build ]; then
    rm -rf gflags_build
fi

mkdir -p gflags_build
cd gflags_build

cmake ../gflags-2.2.2 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=ON \
    -DGFLAGS_NAMESPACE=google \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DBUILD_gflags_LIB=ON \
    -DBUILD_gflags_nothreads_LIB=ON \
    -DBUILD_gflags_static_LIB=ON \
    -DBUILD_gflags_nothreads_static_LIB=ON
make -j4
make install
cd ..
rm -rf gflags_build

# snappy
if [ -d snappy_build ]; then
    rm -rf snappy_build
fi
mkdir -p snappy_build
cd snappy_build

cmake ../snappy-1.2.0 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF

make -j4
make install
cd ..
rm -rf snappy_build

# leveldb
if [ -d leveldb_build ]; then
    rm -rf leveldb_build
fi
mkdir -p leveldb_build
cd leveldb_build

cmake ../leveldb-1.23 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_TESTING=OFF

make -j4
make install
cd ..
rm -rf leveldb_build

# zlib
if [ -d zlib_build ]; then
    rm -rf zlib_build
fi
mkdir -p zlib_build
cd zlib_build
cmake ../zlib-ng-2.1.6 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DCMAKE_C_FLAGS=-fPIC \
    -DZLIB_COMPAT=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
make -j4
make install
cd ..
rm -rf zlib_build

#lz4
if [ -d lz4_build ]; then
    rm -rf lz4_build
fi
mkdir -p lz4_build
cd lz4_build
cmake ../lz4-1.9.4/build/cmake -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_TESTING=OFF

make -j4
make install
cd ..
rm -rf lz4_build

# zstd
if [ -d zstd_build ]; then
    rm -rf zstd_build
fi
mkdir -p zstd_build
cd zstd_build
cmake ../zstd-1.5.6/build/cmake -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_TESTING=OFF

make -j4
make install
cd ..
rm -rf zstd_build

# openssl

cd openssl-OpenSSL_1_1_1k
./config --prefix=${EA_PREFIX} -fPIC no-shared no-zlib
make -j4
make install
make clean
cd ..

# protobuf
if [ -d protobuf_build ]; then
    rm -rf protobuf_build
fi
mkdir -p protobuf_build
cd protobuf_build
cmake ../protobuf-3.20.0/cmake -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -Dprotobuf_BUILD_TESTS=OFF \
    -Dprotobuf_BUILD_EXAMPLES=OFF \
    -Dprotobuf_BUILD_STATIC_LIBS=ON \
    -Dprotobuf_WITH_ZLIB=ON \
    -Dprotobuf_WITH_PROTOC=ON

make -j4
make install
cd ..
rm -rf protobuf_build

# boost
if [ -d boost_build ]; then
    rm -rf boost_build
fi

mkdir -p boost_build
cd boost_build
cmake ../boost-1.85.0 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_TESTING=OFF

make -j4
make install
cd ..
rm -rf boost_build

# rocksdb
if [ -d rocksdb_build ]; then
    rm -rf rocksdb_build
fi
mkdir -p rocksdb_build
cd rocksdb_build
cmake ../rocksdb-6.29.3 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release

make -j4
make install
cd ..
rm -rf rocksdb_build

# faiss
if [ -d faiss_build ]; then
    rm -rf faiss_build
fi
mkdir -p faiss_build
cd faiss_build
cmake ../faiss-1.8.0 -DCMAKE_INSTALL_PREFIX=${EA_PREFIX} \
    -DCMAKE_PREFIX_PATH=${EA_PREFIX} \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_BUILD_TYPE=Release

make -j4
make install
cd ..
rm -rf faiss_build