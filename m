From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] cbootimage: Re-organize directory structure
Date: Tue,  9 Apr 2013 16:23:33 -0600
Message-ID: <1365546213-13253-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With the increasing number of boards and vendors supported, create a
directory hierarchy to organize things. The hierarchy is
${soc}/${vendor}/${board}

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../dalmore}/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct.cfg   |    0
 .../dalmore}/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct.cfg    |    0
 .../dalmore}/E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct.cfg   |    0
 {dalmore => tegra114/nvidia/dalmore}/README.txt                        |    0
 {dalmore => tegra114/nvidia/dalmore}/build.sh                          |    0
 {dalmore => tegra114/nvidia/dalmore}/dalmore-t40s-1600.img.cfg         |    0
 {dalmore => tegra114/nvidia/dalmore}/dalmore-t40s-1866.img.cfg         |    0
 {dalmore => tegra114/nvidia/dalmore}/dalmore-t40x-1866.img.cfg         |    0
 {medcom-wide => tegra20/avionic-design/medcom-wide}/build.sh           |    0
 {plutux => tegra20/avionic-design/plutux}/build.sh                     |    0
 .../tamonten}/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg       |    0
 {tamonten => tegra20/avionic-design/tamonten}/tegra20.img.cfg          |    0
 {tec => tegra20/avionic-design/tec}/build.sh                           |    0
 {trimslice => tegra20/compulab/trimslice}/README.txt                   |    0
 {trimslice => tegra20/compulab/trimslice}/build.sh                     |    0
 {trimslice => tegra20/compulab/trimslice}/trimslice-mmc.bct.cfg        |    0
 {trimslice => tegra20/compulab/trimslice}/trimslice-mmc.img.cfg        |    0
 {trimslice => tegra20/compulab/trimslice}/trimslice-spi.bct.cfg        |    0
 {trimslice => tegra20/compulab/trimslice}/trimslice-spi.img.cfg        |    0
 {harmony => tegra20/nvidia/harmony}/build.sh                           |    0
 {harmony => tegra20/nvidia/harmony}/harmony-nand.img.cfg               |    0
 ...02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct.cfg |    0
 .../seaboard}/PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct.cfg      |    0
 {seaboard => tegra20/nvidia/seaboard}/build.sh                         |    0
 {seaboard => tegra20/nvidia/seaboard}/seaboard-nand.img.cfg            |    0
 {ventana => tegra20/nvidia/ventana}/build.sh                           |    0
 {ventana => tegra20/nvidia/ventana}/ventana-emmc.img.cfg               |    0
 ...na_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct.cfg |    0
 .../E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct.cfg    |    0
 {whistler => tegra20/nvidia/whistler}/build.sh                         |    0
 {whistler => tegra20/nvidia/whistler}/whistler-emmc.img.cfg            |    0
 .../Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct.cfg    |    0
 {beaver => tegra30/nvidia/beaver}/beaver-emmc.img.cfg                  |    0
 {beaver => tegra30/nvidia/beaver}/build.sh                             |    0
 ...E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct.cfg |    0
 ...E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct.cfg |    0
 ...E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct.cfg |    0
 {cardhu => tegra30/nvidia/cardhu}/README.txt                           |    0
 {cardhu => tegra30/nvidia/cardhu}/build.sh                             |    0
 {cardhu => tegra30/nvidia/cardhu}/cardhu-a02-a04-1gb-emmc.img.cfg      |    0
 {cardhu => tegra30/nvidia/cardhu}/cardhu-a02-a04-2gb-emmc.img.cfg      |    0
 {cardhu => tegra30/nvidia/cardhu}/cardhu-a05-2gb-emmc.img.cfg          |    0
 42 files changed, 0 insertions(+), 0 deletions(-)
 rename {dalmore => tegra114/nvidia/dalmore}/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct.cfg (100%)
 rename {dalmore => tegra114/nvidia/dalmore}/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct.cfg (100%)
 rename {dalmore => tegra114/nvidia/dalmore}/E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct.cfg (100%)
 rename {dalmore => tegra114/nvidia/dalmore}/README.txt (100%)
 rename {dalmore => tegra114/nvidia/dalmore}/build.sh (100%)
 rename {dalmore => tegra114/nvidia/dalmore}/dalmore-t40s-1600.img.cfg (100%)
 rename {dalmore => tegra114/nvidia/dalmore}/dalmore-t40s-1866.img.cfg (100%)
 rename {dalmore => tegra114/nvidia/dalmore}/dalmore-t40x-1866.img.cfg (100%)
 rename {medcom-wide => tegra20/avionic-design/medcom-wide}/build.sh (100%)
 rename {plutux => tegra20/avionic-design/plutux}/build.sh (100%)
 rename {tamonten => tegra20/avionic-design/tamonten}/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg (100%)
 rename {tamonten => tegra20/avionic-design/tamonten}/tegra20.img.cfg (100%)
 rename {tec => tegra20/avionic-design/tec}/build.sh (100%)
 rename {trimslice => tegra20/compulab/trimslice}/README.txt (100%)
 rename {trimslice => tegra20/compulab/trimslice}/build.sh (100%)
 rename {trimslice => tegra20/compulab/trimslice}/trimslice-mmc.bct.cfg (100%)
 rename {trimslice => tegra20/compulab/trimslice}/trimslice-mmc.img.cfg (100%)
 rename {trimslice => tegra20/compulab/trimslice}/trimslice-spi.bct.cfg (100%)
 rename {trimslice => tegra20/compulab/trimslice}/trimslice-spi.img.cfg (100%)
 rename {harmony => tegra20/nvidia/harmony}/build.sh (100%)
 rename {harmony => tegra20/nvidia/harmony}/harmony-nand.img.cfg (100%)
 rename {harmony => tegra20/nvidia/harmony}/harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct.cfg (100%)
 rename {seaboard => tegra20/nvidia/seaboard}/PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct.cfg (100%)
 rename {seaboard => tegra20/nvidia/seaboard}/build.sh (100%)
 rename {seaboard => tegra20/nvidia/seaboard}/seaboard-nand.img.cfg (100%)
 rename {ventana => tegra20/nvidia/ventana}/build.sh (100%)
 rename {ventana => tegra20/nvidia/ventana}/ventana-emmc.img.cfg (100%)
 rename {ventana => tegra20/nvidia/ventana}/ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct.cfg (100%)
 rename {whistler => tegra20/nvidia/whistler}/E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct.cfg (100%)
 rename {whistler => tegra20/nvidia/whistler}/build.sh (100%)
 rename {whistler => tegra20/nvidia/whistler}/whistler-emmc.img.cfg (100%)
 rename {beaver => tegra30/nvidia/beaver}/Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct.cfg (100%)
 rename {beaver => tegra30/nvidia/beaver}/beaver-emmc.img.cfg (100%)
 rename {beaver => tegra30/nvidia/beaver}/build.sh (100%)
 rename {cardhu => tegra30/nvidia/cardhu}/E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct.cfg (100%)
 rename {cardhu => tegra30/nvidia/cardhu}/E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct.cfg (100%)
 rename {cardhu => tegra30/nvidia/cardhu}/E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct.cfg (100%)
 rename {cardhu => tegra30/nvidia/cardhu}/README.txt (100%)
 rename {cardhu => tegra30/nvidia/cardhu}/build.sh (100%)
 rename {cardhu => tegra30/nvidia/cardhu}/cardhu-a02-a04-1gb-emmc.img.cfg (100%)
 rename {cardhu => tegra30/nvidia/cardhu}/cardhu-a02-a04-2gb-emmc.img.cfg (100%)
 rename {cardhu => tegra30/nvidia/cardhu}/cardhu-a05-2gb-emmc.img.cfg (100%)

diff --git a/dalmore/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct.cfg b/tegra114/nvidia/dalmore/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct.cfg
similarity index 100%
rename from dalmore/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct.cfg
rename to tegra114/nvidia/dalmore/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct.cfg
diff --git a/dalmore/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct.cfg b/tegra114/nvidia/dalmore/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct.cfg
similarity index 100%
rename from dalmore/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct.cfg
rename to tegra114/nvidia/dalmore/E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct.cfg
diff --git a/dalmore/E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct.cfg b/tegra114/nvidia/dalmore/E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct.cfg
similarity index 100%
rename from dalmore/E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct.cfg
rename to tegra114/nvidia/dalmore/E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct.cfg
diff --git a/dalmore/README.txt b/tegra114/nvidia/dalmore/README.txt
similarity index 100%
rename from dalmore/README.txt
rename to tegra114/nvidia/dalmore/README.txt
diff --git a/dalmore/build.sh b/tegra114/nvidia/dalmore/build.sh
similarity index 100%
rename from dalmore/build.sh
rename to tegra114/nvidia/dalmore/build.sh
diff --git a/dalmore/dalmore-t40s-1600.img.cfg b/tegra114/nvidia/dalmore/dalmore-t40s-1600.img.cfg
similarity index 100%
rename from dalmore/dalmore-t40s-1600.img.cfg
rename to tegra114/nvidia/dalmore/dalmore-t40s-1600.img.cfg
diff --git a/dalmore/dalmore-t40s-1866.img.cfg b/tegra114/nvidia/dalmore/dalmore-t40s-1866.img.cfg
similarity index 100%
rename from dalmore/dalmore-t40s-1866.img.cfg
rename to tegra114/nvidia/dalmore/dalmore-t40s-1866.img.cfg
diff --git a/dalmore/dalmore-t40x-1866.img.cfg b/tegra114/nvidia/dalmore/dalmore-t40x-1866.img.cfg
similarity index 100%
rename from dalmore/dalmore-t40x-1866.img.cfg
rename to tegra114/nvidia/dalmore/dalmore-t40x-1866.img.cfg
diff --git a/medcom-wide/build.sh b/tegra20/avionic-design/medcom-wide/build.sh
similarity index 100%
rename from medcom-wide/build.sh
rename to tegra20/avionic-design/medcom-wide/build.sh
diff --git a/plutux/build.sh b/tegra20/avionic-design/plutux/build.sh
similarity index 100%
rename from plutux/build.sh
rename to tegra20/avionic-design/plutux/build.sh
diff --git a/tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg b/tegra20/avionic-design/tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
similarity index 100%
rename from tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
rename to tegra20/avionic-design/tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
diff --git a/tamonten/tegra20.img.cfg b/tegra20/avionic-design/tamonten/tegra20.img.cfg
similarity index 100%
rename from tamonten/tegra20.img.cfg
rename to tegra20/avionic-design/tamonten/tegra20.img.cfg
diff --git a/tec/build.sh b/tegra20/avionic-design/tec/build.sh
similarity index 100%
rename from tec/build.sh
rename to tegra20/avionic-design/tec/build.sh
diff --git a/trimslice/README.txt b/tegra20/compulab/trimslice/README.txt
similarity index 100%
rename from trimslice/README.txt
rename to tegra20/compulab/trimslice/README.txt
diff --git a/trimslice/build.sh b/tegra20/compulab/trimslice/build.sh
similarity index 100%
rename from trimslice/build.sh
rename to tegra20/compulab/trimslice/build.sh
diff --git a/trimslice/trimslice-mmc.bct.cfg b/tegra20/compulab/trimslice/trimslice-mmc.bct.cfg
similarity index 100%
rename from trimslice/trimslice-mmc.bct.cfg
rename to tegra20/compulab/trimslice/trimslice-mmc.bct.cfg
diff --git a/trimslice/trimslice-mmc.img.cfg b/tegra20/compulab/trimslice/trimslice-mmc.img.cfg
similarity index 100%
rename from trimslice/trimslice-mmc.img.cfg
rename to tegra20/compulab/trimslice/trimslice-mmc.img.cfg
diff --git a/trimslice/trimslice-spi.bct.cfg b/tegra20/compulab/trimslice/trimslice-spi.bct.cfg
similarity index 100%
rename from trimslice/trimslice-spi.bct.cfg
rename to tegra20/compulab/trimslice/trimslice-spi.bct.cfg
diff --git a/trimslice/trimslice-spi.img.cfg b/tegra20/compulab/trimslice/trimslice-spi.img.cfg
similarity index 100%
rename from trimslice/trimslice-spi.img.cfg
rename to tegra20/compulab/trimslice/trimslice-spi.img.cfg
diff --git a/harmony/build.sh b/tegra20/nvidia/harmony/build.sh
similarity index 100%
rename from harmony/build.sh
rename to tegra20/nvidia/harmony/build.sh
diff --git a/harmony/harmony-nand.img.cfg b/tegra20/nvidia/harmony/harmony-nand.img.cfg
similarity index 100%
rename from harmony/harmony-nand.img.cfg
rename to tegra20/nvidia/harmony/harmony-nand.img.cfg
diff --git a/harmony/harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct.cfg b/tegra20/nvidia/harmony/harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct.cfg
similarity index 100%
rename from harmony/harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct.cfg
rename to tegra20/nvidia/harmony/harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct.cfg
diff --git a/seaboard/PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct.cfg b/tegra20/nvidia/seaboard/PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct.cfg
similarity index 100%
rename from seaboard/PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct.cfg
rename to tegra20/nvidia/seaboard/PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct.cfg
diff --git a/seaboard/build.sh b/tegra20/nvidia/seaboard/build.sh
similarity index 100%
rename from seaboard/build.sh
rename to tegra20/nvidia/seaboard/build.sh
diff --git a/seaboard/seaboard-nand.img.cfg b/tegra20/nvidia/seaboard/seaboard-nand.img.cfg
similarity index 100%
rename from seaboard/seaboard-nand.img.cfg
rename to tegra20/nvidia/seaboard/seaboard-nand.img.cfg
diff --git a/ventana/build.sh b/tegra20/nvidia/ventana/build.sh
similarity index 100%
rename from ventana/build.sh
rename to tegra20/nvidia/ventana/build.sh
diff --git a/ventana/ventana-emmc.img.cfg b/tegra20/nvidia/ventana/ventana-emmc.img.cfg
similarity index 100%
rename from ventana/ventana-emmc.img.cfg
rename to tegra20/nvidia/ventana/ventana-emmc.img.cfg
diff --git a/ventana/ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct.cfg b/tegra20/nvidia/ventana/ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct.cfg
similarity index 100%
rename from ventana/ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct.cfg
rename to tegra20/nvidia/ventana/ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct.cfg
diff --git a/whistler/E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct.cfg b/tegra20/nvidia/whistler/E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct.cfg
similarity index 100%
rename from whistler/E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct.cfg
rename to tegra20/nvidia/whistler/E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct.cfg
diff --git a/whistler/build.sh b/tegra20/nvidia/whistler/build.sh
similarity index 100%
rename from whistler/build.sh
rename to tegra20/nvidia/whistler/build.sh
diff --git a/whistler/whistler-emmc.img.cfg b/tegra20/nvidia/whistler/whistler-emmc.img.cfg
similarity index 100%
rename from whistler/whistler-emmc.img.cfg
rename to tegra20/nvidia/whistler/whistler-emmc.img.cfg
diff --git a/beaver/Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct.cfg b/tegra30/nvidia/beaver/Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct.cfg
similarity index 100%
rename from beaver/Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct.cfg
rename to tegra30/nvidia/beaver/Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct.cfg
diff --git a/beaver/beaver-emmc.img.cfg b/tegra30/nvidia/beaver/beaver-emmc.img.cfg
similarity index 100%
rename from beaver/beaver-emmc.img.cfg
rename to tegra30/nvidia/beaver/beaver-emmc.img.cfg
diff --git a/beaver/build.sh b/tegra30/nvidia/beaver/build.sh
similarity index 100%
rename from beaver/build.sh
rename to tegra30/nvidia/beaver/build.sh
diff --git a/cardhu/E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct.cfg b/tegra30/nvidia/cardhu/E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct.cfg
similarity index 100%
rename from cardhu/E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct.cfg
rename to tegra30/nvidia/cardhu/E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct.cfg
diff --git a/cardhu/E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct.cfg b/tegra30/nvidia/cardhu/E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct.cfg
similarity index 100%
rename from cardhu/E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct.cfg
rename to tegra30/nvidia/cardhu/E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct.cfg
diff --git a/cardhu/E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct.cfg b/tegra30/nvidia/cardhu/E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct.cfg
similarity index 100%
rename from cardhu/E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct.cfg
rename to tegra30/nvidia/cardhu/E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct.cfg
diff --git a/cardhu/README.txt b/tegra30/nvidia/cardhu/README.txt
similarity index 100%
rename from cardhu/README.txt
rename to tegra30/nvidia/cardhu/README.txt
diff --git a/cardhu/build.sh b/tegra30/nvidia/cardhu/build.sh
similarity index 100%
rename from cardhu/build.sh
rename to tegra30/nvidia/cardhu/build.sh
diff --git a/cardhu/cardhu-a02-a04-1gb-emmc.img.cfg b/tegra30/nvidia/cardhu/cardhu-a02-a04-1gb-emmc.img.cfg
similarity index 100%
rename from cardhu/cardhu-a02-a04-1gb-emmc.img.cfg
rename to tegra30/nvidia/cardhu/cardhu-a02-a04-1gb-emmc.img.cfg
diff --git a/cardhu/cardhu-a02-a04-2gb-emmc.img.cfg b/tegra30/nvidia/cardhu/cardhu-a02-a04-2gb-emmc.img.cfg
similarity index 100%
rename from cardhu/cardhu-a02-a04-2gb-emmc.img.cfg
rename to tegra30/nvidia/cardhu/cardhu-a02-a04-2gb-emmc.img.cfg
diff --git a/cardhu/cardhu-a05-2gb-emmc.img.cfg b/tegra30/nvidia/cardhu/cardhu-a05-2gb-emmc.img.cfg
similarity index 100%
rename from cardhu/cardhu-a05-2gb-emmc.img.cfg
rename to tegra30/nvidia/cardhu/cardhu-a05-2gb-emmc.img.cfg
-- 
1.7.10.4
