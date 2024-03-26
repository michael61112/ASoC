#!/bin/csh  -f
set VENDOR = "mentor"
set TOOL = "Questa_Sim"

if (("$0" != "/bin/tcsh") && ("$0" != "tcsh") && ("$0" != "-tcsh")  && ("$0" != "/bin/csh") && ("$0" != "csh") && ("$0" != "-csh")) then
    echo
    echo "Please use 'source' command instead of run this csh directly"
    echo "USAGE:"
    echo "  source $0"
    echo "  source $0 [version]"
    echo "  source $0 [@ver | -help]"
    echo
    exit;
endif

if (-l /usr/cad/$VENDOR/$TOOL/cur) then
    set DEFAUlT_VERSION = `readlink /usr/cad/$VENDOR/$TOOL/cur`
else
    set DEFAUlT_VERSION = `/bin/ls  -tr /usr/cad/$VENDOR/$TOOL |tail -1 | xargs -n1 basename`
endif
if ( $#argv > 0 ) then
    if (("$1" == "@ver") || ("$1" =~ -h*)) then
        echo
        echo Available $TOOL version:
        /bin/ls  -1tr  /usr/cad/$VENDOR/$TOOL |awk '{print "  ",$1}'
        echo
        exit
    endif
    set SOFT_HOME  = "/usr/cad/$VENDOR/$TOOL/$1"
    if ( -e $SOFT_HOME ) then
        if ( $1 == "cur" ) then
            echo set $TOOL version: $DEFAUlT_VERSION
        else
            echo set $TOOL version: $1
        endif
    else
        echo use $TOOL version: $DEFAUlT_VERSION
        set SOFT_HOME  = "/usr/cad/$VENDOR/$TOOL/$DEFAUlT_VERSION"
    endif
else
    echo set $TOOL version: $DEFAUlT_VERSION \(default\)
    set SOFT_HOME  = "/usr/cad/$VENDOR/$TOOL/$DEFAUlT_VERSION"
endif
########################################
set bin_prefix 	= "questasim/bin"
set lib_prefix  = ""
set bin_path	= ""
set lib_path	= ""

foreach bin_pre (${bin_prefix})
   if ( -e "$SOFT_HOME/$bin_pre") then
       set bin_path = "$SOFT_HOME/$bin_pre ${bin_path}"
   endif
end

set path=($bin_path $path)

foreach lib_pre (${lib_prefix})
   if ( -e "$SOFT_HOME/$lib_pre/lib") then
       set lib_path = "$SOFT_HOME/$lib_pre/:${lib_path}"
   endif
end 


if (${?LD_LIBRARY_PATH} == 0) then
   setenv LD_LIBRARY_PATH  ${lib_path}:/lib64:/usr/lib64:/usr/local/lib64
else
   setenv LD_LIBRARY_PATH  ${lib_path}:${LD_LIBRARY_PATH}:/lib64:/usr/lib64:/usr/local/lib64
endif 
########################################

if (-e /usr/cad/$VENDOR/CIC/license.cshrc) then
    source /usr/cad/$VENDOR/CIC/license.cshrc
endif


unset bin_prefix
unset bin_pre
unset lib_prefix
unset lib_pre
unset lib_path
unset bin_path
unset DEFAUlT_VERSION
unset SOFT_HOME
unset VENDOR
unset SOURCE_CMD
unset TOOL
