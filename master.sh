#!/bin/bash

#############################FROM ERPAS################################

##User input for IC.
IC="0118"
echo "For the IC dated (format: MMDD) "$IC" "


##Create dircetories as per ERPAS multi-ensembles multi-physics(/home/cccr/valsala/tanvi/PREPDATA/trm/saszc/20031207/c00).
./dir_trm.sh "$IC"
echo "Successfuly created all the directories"


######FOR GLOBAL OCEAN ######
##=========================##
##Converts 11 ocean variables from NetCDF format to .trm format.
#./ocn_11.sh  "$IC"
#echo "Sucessfully generated .trm's for Global Ocean."

######FOR ICE CONCENTRATION ######
##==============================##
##Converts ice concentration from NetCDF format to .trm format.
#./ice_1.sh "$IC"
#echo " Sucessfully generated .trm's for Ice Concentration."


######FOR ATMOSPHERE######
##======================##
##Directory for atmosphere netcdf data.
./dir_atm.sh "$IC"


##Copy atmospheric variables from ERPAS to DESK.
##Rename the paths.
./atm_copy_replace.sh "$IC"


##Rename the perturbation names ((00 -->> c00))
./perturb_rename.sh "$IC"

##Convert ctl format to NetCDF format ((.ctl -->> .nc))
./ssw_nc_regrid.sh "$IC"
./u10_nc_regrid.sh "$IC"
./v10_nc_regrid.sh "$IC"

echo "Successfully created all .nc files"


######FOR ATMOSPHERE ######
##=========================##
./atm_5.sh "$IC"
echo " Sucessfully generated .trm's for Atmosphere."

echo "SUCESSFULLY COMPLETED 17 trm FROM ERPAS."

