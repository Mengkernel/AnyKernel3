### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# begin properties
properties() { '
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=alioth
device.name2=aliothin
supported.versions=
supported.patchlevels=
'; } # end properties


## boot shell variables
block=boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;
no_block_display=1;

## import functions/variables - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

## start boot install
split_boot;
flash_boot;
## end boot install

## start dtbo install
flash_dtbo;
## end dtbo install

## start vendor_boot install
# reset boot device variables
reset_ak;

# set boot device variables
block=vendor_boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;
no_block_display=1;

split_boot;
flash_boot;
## end vendor_boot install