cd 'C:/Users/fan/M4Econ/external/interpolate/'

mex splinterp1.cpp CXXOPTIMFLAGS='-O2 -DNDEBUG' CXXFLAGS='$CXXFLAGS -O2 -DNDEBUG'
mex splinterp3.cpp CXXOPTIMFLAGS='-O2 -DNDEBUG' CXXFLAGS='$CXXFLAGS -O2 -DNDEBUG'
mex splinterp2.cpp CXXOPTIMFLAGS='-O2 -DNDEBUG' CXXFLAGS='$CXXFLAGS -O2 -DNDEBUG'
