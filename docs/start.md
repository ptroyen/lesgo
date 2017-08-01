# Getting started

To get started, download the code using the buttons on the left. You'll need

* A modern **Fortran compiler** that supports the Fortran 95 standard and C 
preprocessor directives. LESGO has been successfully compiled with 
[GFortran](https://gcc.gnu.org/fortran/) and 
[Intel&reg; Fortran](https://software.intel.com/en-us/fortran-compilers).

* **[CMake](https://cmake.org/)** is used to manage preprocessor flags and 
Fortran source dependencies. Compilation options are managed in "CMakeLists.txt".

* **[FFTW3](http://www.fftw.org/)** is used to compute Fourier transforms.

To implement additional optional features in LESGO, you may need 

* An **MPI implementation** is required for parallel computations. LESGO has 
been developed and used successfully with [MPICH](http://www.mpich.org/) and 
[Open MPI](https://www.open-mpi.org/).

* **[HDF5](https://support.hdfgroup.org/HDF5/) and 
[CGNS](http://cgns.github.io/)** are required to build with parallel IO support.

## Compiling LESGO 
To compile LESGO, you'll need to configure "CMakeLists.txt", which includes 
preprocessor flags for compiling in different functionality (MPI support,
immersed boundary support, etc.). On many systems, "CMakeLists.txt" does not 
need to be modified to compile a serial version with the basic features. 

Once you configure "CMakeLists.txt" for your system compile lesgo using:

    ./build-lesgo

The compilation will occur in the subdirectory ./bld/ If major changes to 
"CMakeLists.txt" are made, the above command may fail. In this case, remove
the build directory using:

    rm -r bld

The resulting executable name will reflect the functionality that you have
configured into the executable. For instance, for serial lesgo with no additional
bells and whistles the executable will be called "lesgo"; if you turned on MPI
support it will be called "lesgo-mpi".

LESGO can also be compiled easily on [MacOS using Homebrew](darwin-brew.html)

## Running LESGO
Once you have an executable there is no need to recompile for running different 
cases. This is done using "lesgo.conf", which is commented fairly well and is
hopefully self-descriptive enough to get started. To configure your case simply 
update "lesgo.conf" appropriately.

When running, lesgo will output data to the directory "output". Also during
execution, lesgo writes information to screen based on the value "wbase" in
"lesgo.conf". This information includes time step information, CPU time,
velocity divergence, etc and is helpful for monitoring the case. Another
important file for monitoring the simulation is the file "output/check_ke.dat"
which has the average kinetic energy of the field. Typically the kinetic energy
will decay during the spinup period and asymptote once stationarity is
reached. This gives a good indicator for determining when to start taking
statistics.

The code count the number of timesteps in a series of simulations, the number of 
timesteps at the end of each simulation is stored in total_time.dat to make sure 
that the numbering of all time-dependent files generated by the code are 
continuous as expected when the simulation would have been completed within one 
run. The total time counter is jt_total. Some variables need to be calculated at
the beginning of a simulation, which requires the local jt counter. In order to 
reset the counter one needs to change the file total_time.dat.