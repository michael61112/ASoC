#! /bin/csh -f
setenv SYSTEMC_HOME /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/shared
setenv SYSTEMC_LIB_DIR /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/shared/lib
setenv CXX_FLAGS "-g -DCALYPTO_SKIP_SYSTEMC_VERSION_CHECK"
setenv LD_FLAGS "-lpthread"
setenv OSSIM ddd
setenv PATH /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/bin:$PATH
