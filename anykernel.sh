### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
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
supported.vendorpatchlevels=
'; } # end properties

## boot shell variables
BLOCK=boot;
IS_SLOT_DEVICES=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

## import functions/variables - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

## start boot install
if [[ -f *Image* ]];
then
  flash_simple;
else
  ui_print "==> Skip kernel installation.";
fi;
## end boot install

## start dtbo & vendor_boot install
BLOCK=vendor_boot;

if [[ -f dtb* ]];
then
  flash_dtbo;
  reset_ak;
  flash_simple;
else
  ui_print "==> Skip DTB/DTBO installation.";
fi;
## end dtbo & vendor_boot install

# Clean caches
ui_print "==> Clean caches.";
rm -rf /data/cache/* /data/dalvik-cache/* /data/resource-cache/* /data/system/package_cache/*
