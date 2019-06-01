# TWRP Device configuration for Xiaomi Mi A2

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 8x Qualcomm® Kryo™ 260 up to 2.2GHz
CHIPSET | Qualcomm SDM660 Snapdragon 660
GPU     | Adreno 512
Memory  | 3GB / 4GB / 6GB RAM (LPDDR4X)
Shipped Android Version | 8.1.0
Storage | 32/64/128GB eMMC 5.1 flash storage
Battery | Non-removable Li-Po 3010 mAh
Dimensions | 158.7 x 75.4 x 7.3 mm
Display | 1080x2160 pixels, 5.99
Rear Camera  | 12MP+20MP, AI Dual Camera
Front Camera | 20 MP

![Device Picture](https://www.scanmalta.com/newstore/media/catalog/product/cache/1/image/641x/9df78eab33525d08d6e5fb8d27136e95/x/i/xiaomi-mi-a2-mi-6x-3_1.jpg)

### Kernel Source
Check here: https://github.com/d4e8ede8f1f2/android_kernel_xiaomi_jasmine_sprout/tree/TWRP-9.0

### How to compile
```sh
. build/envsetup.sh
lunch omni_jasmine_sprout-eng
make -j4 recoveryimage
```