# GPU-based-Graph-Analytics
GPU based graph analytics using IBM P-Systems CPU and NVidia NVLINK GPU (using CUDA and Gunrock)

What is needed for project?

Prerequisites

Required Dependencies:

    CUDA (7.5 or higher) is used to implement Gunrock.
        Refer to NVIDIA's CUDA homepage to download and install CUDA.
        Refer to NVIDIA CUDA C Programming Guide for detailed information and examples on programming CUDA.
    Boost (1.58 or higher) is used for for the CPU reference implementations of Connected Component, Betweenness Centrality, PageRank, Single-Source Shortest Path, and Minimum Spanning Tree.
        Refer to Boost Getting Started Guide to install the required Boost libraries.
        Alternatively, you can also install Boost by running /gunrock/dep/install_boost.sh script (recommended installation method).
        Ideal location for Boost installation is /usr/local/. If the build cannot find your Boost library, make sure a symbolic link for boost installation exists somewhere in /usr/ directory.
    ModernGPU and CUB used as external submodules for Gunrock's APIs.
        You will need to download or clone ModernGPU and CUB, and place them to gunrock/externals.
        Alternatively, you can clone gunrock recursively with git clone --recursive https://github.com/gunrock/gunrock
        or if you already cloned gunrock, under gunrock/ directory:
Compilation

Simple Gunrock Compilation:

    Downloading gunrock:

    # Using git (recursively) download gunrock
    git clone --recursive https://github.com/gunrock/gunrock
    # Using wget to download gunrock
    wget --no-check-certificate https://github.com/gunrock/gunrock/archive/master.zip

    Compiling gunrock:

    cd gunrock
    mkdir build && cd build
    cmake ..
    make

    Binary test files are available in build/bin directory.
    You can either run the test for all primitives by typing make check or ctest in the build directory, or do your own testings manually.
    Detailed test log from ctest can be found in /build/Testing/Temporary/LastTest.log, alternatively you can run tests with verbose option enabled ctest -v.

Advance Gunrock Compilation:

You can also compile gunrock with more specific/advanced settings using cmake -D[OPTION]=ON/OFF. Following options are available:

    GUNROCK_BUILD_LIB (default: ON) - Builds main gunrock library.
    GUNROCK_BUILD_SHARED_LIBS (default: ON) - Turn off to build for static libraries.
    GUNROCK_BUILD_APPLICATIONS (default: ON) - Set off to only build one of the following primitive (GUNROCK_APP_* must be set on to build if this option is turned off.)
        GUNROCK_APP_BC (default: OFF)
        GUNROCK_APP_BFS (default: OFF)
        GUNROCK_APP_CC (default: OFF)
        GUNROCK_APP_PR (default: OFF)
        GUNROCK_APP_SSSP (default: OFF)
        GUNROCK_APP_DOBFS (default: OFF)
        GUNROCK_APP_HITS (default: OFF)
        GUNROCK_APP_SALSA (default: OFF)
        GUNROCK_APP_MST (default: OFF)
        GUNROCK_APP_WTF (default: OFF)
        GUNROCK_APP_TOPK (default: OFF)
    GUNROCK_MGPU_TESTS (default: OFF) - If on, tests multiple GPU primitives with ctest.
    GUNROCK_GENCODE_SM<> (default: GUNROCK_GENCODE_SM30,35,61=ON) change to generate code for a different compute capability.
    CUDA_VERBOSE_PTXAS (default: OFF) - ON to enable verbose output from the PTXAS assembler.

Example for compiling gunrock with only Breadth First Search (BFS) primitive:

    mkdir build && cd build
    cmake -DGUNROCK_BUILD_APPLICATIONS=OFF -DGUNROCK_APP_BFS=ON ..
    make

For dataset, please download files from: https://snap.stanford.edu/data/egonets-Facebook.html
