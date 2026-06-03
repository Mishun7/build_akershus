rm -rf .repo/local_manifests

repo init -u https://github.com/crdroidandroid/android -b 15.0 --depth=1 --git-lfs

rm -rf prebuilts/clang/host/linux-x86

/opt/crave/resync.sh

rm -rf device/zte/akershus
rm -rf vendor/zte/akershus
rm -rf kernel/zte/sdm845

# Device tree
git clone https://github.com/rtx4d/android_device_zte_akershus -b lineage-22.2 device/zte/akershus

# Vendor tree
git clone https://github.com/rtx4d/proprietary_vendor_zte_akershus -b lineage-22.2 vendor/zte/akershus

# Kernel
git clone https://github.com/rtx4d/android_kernel_zte_sdm845 -b lineage-22.2 kernel/zte/sdm845

. build/envsetup.sh
lunch crdroid_akershus-ap4a-user
mka bacon