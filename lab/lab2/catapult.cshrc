#
# Set catapult Env.
#

#Set soft home
set VENDOR_HOME = /usr/cad/mentor
set SOFT_HOME = ${VENDOR_HOME}/Catapult/cur/

#Set license
source ${VENDOR_HOME}/CIC/license.cshrc

#source ${VENDOR_HOME}/CIC/license.csh

#Set soft path
set path = (${SOFT_HOME}/Mgc_home/bin $path)

#Unset variable
unset VENDOR_HOME
unset SOFT_HOME


