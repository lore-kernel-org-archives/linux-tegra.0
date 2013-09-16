From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 02/11] tegrarcm: Add missing SKU information
Date: Mon, 16 Sep 2013 15:24:49 -0700
Message-ID: <1379370298-20404-3-git-send-email-amartin@nvidia.com>
References: <1379370298-20404-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379370298-20404-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Sync up SKU numbers with TOT tegra u-boot.  Also change the default
SKU print to just use the chip family name so it's more resistant to
being out of sync in the future.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 27 +++++++++++++++------------
 src/nv3p.h |  3 +++
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/src/main.c b/src/main.c
index 960eb4a..ef0c7e9 100644
--- a/src/main.c
+++ b/src/main.c
@@ -460,26 +460,29 @@ static void dump_platform_info(nv3p_platform_info_t *info)
 	char *chip_name = NULL;
 	if (info->chip_id.id == 0x20) {
 		switch (info->sku) {
-		case TEGRA2_CHIP_SKU_AP20:   chip_name = "ap20"; break;
-		case TEGRA2_CHIP_SKU_T20:    chip_name = "t20"; break;
+		case TEGRA2_CHIP_SKU_AP20:   chip_name = "ap20";  break;
 		case TEGRA2_CHIP_SKU_T25SE:  chip_name = "t25se"; break;
-		case TEGRA2_CHIP_SKU_AP25:   chip_name = "ap25"; break;
-		case TEGRA2_CHIP_SKU_T25:    chip_name = "t25"; break;
+		case TEGRA2_CHIP_SKU_AP25:   chip_name = "ap25";  break;
+		case TEGRA2_CHIP_SKU_T25:    chip_name = "t25";   break;
 		case TEGRA2_CHIP_SKU_AP25E:  chip_name = "ap25e"; break;
-		case TEGRA2_CHIP_SKU_T25E:   chip_name = "t25e"; break;
-		default: chip_name = "unknown"; break;
+		case TEGRA2_CHIP_SKU_T25E:   chip_name = "t25e";  break;
+		case TEGRA2_CHIP_SKU_T20:
+		case TEGRA2_CHIP_SKU_T20_7:
+		default: chip_name = "t20"; break;
 		}
 	} else if (info->chip_id.id == 0x30) {
 		switch (info->sku) {
-		case TEGRA3_CHIP_SKU_AP30:   chip_name = "ap30"; break;
-		case TEGRA3_CHIP_SKU_T30:    chip_name = "t30"; break;
-		case TEGRA3_CHIP_SKU_T30S:   chip_name = "t30s"; break;
-		default: chip_name = "unknown"; break;
+		case TEGRA3_CHIP_SKU_AP30:   chip_name = "ap30";  break;
+		case TEGRA3_CHIP_SKU_T30S:   chip_name = "t30s";  break;
+		case TEGRA3_CHIP_SKU_T33:    chip_name = "t33";   break;
+		case TEGRA3_CHIP_SKU_T30:
+		default: chip_name = "t30"; break;
 		}
 	} else if (info->chip_id.id == 0x35) {
 		switch (info->sku) {
-		case TEGRA114_CHIP_SKU_T114: chip_name = "t114"; break;
-		default: chip_name = "unknown"; break;
+		case TEGRA114_CHIP_SKU_T114:
+		case TEGRA114_CHIP_SKU_T114_1:
+		default: chip_name = "t114"; break;
 		}
 	} else {
 		chip_name = "unknown";
diff --git a/src/nv3p.h b/src/nv3p.h
index 20cb93b..13d0e0b 100644
--- a/src/nv3p.h
+++ b/src/nv3p.h
@@ -53,6 +53,7 @@ typedef struct nv3p_state *nv3p_handle_t;
 
 // tegra2 chip sku
 #define TEGRA2_CHIP_SKU_AP20     0x01
+#define TEGRA2_CHIP_SKU_T20_7    0x07
 #define TEGRA2_CHIP_SKU_T20      0x08
 #define TEGRA2_CHIP_SKU_T25SE    0x14
 #define TEGRA2_CHIP_SKU_AP25     0x17
@@ -64,9 +65,11 @@ typedef struct nv3p_state *nv3p_handle_t;
 #define TEGRA3_CHIP_SKU_AP30     0x87
 #define TEGRA3_CHIP_SKU_T30      0x81
 #define TEGRA3_CHIP_SKU_T30S     0x83
+#define TEGRA3_CHIP_SKU_T33      0X80
 
 // tegra114 chip sku
 #define TEGRA114_CHIP_SKU_T114   0x00
+#define TEGRA114_CHIP_SKU_T114_1 0x01
 
 // boot device type
 #define NV3P_DEV_TYPE_NAND              0x1
-- 
1.8.1.5
