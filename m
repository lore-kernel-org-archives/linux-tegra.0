From: Penny-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chiu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: [PATCH 1/1] Add support for Tegra114 SPI boot device
Date: Wed, 5 Jun 2013 16:35:33 +0800
Message-ID: <1370421333-2748-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This patch adds SpiFlashParams to generate/dump BCT for SPI flash.

Change-Id: Icf256caade8d0aa2d1639541377fa0aa71786eda
Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/parse.h                |  3 +++
 src/t114/nvbctlib_t114.c   | 17 ++++++++++++++--
 src/t114/nvboot_bct_t114.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 src/t114/parse_t114.c      | 25 ++++++++++++++++++++++++
 4 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/src/parse.h b/src/parse.h
index 21a2c7c..ced4cfc 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -120,6 +120,7 @@ typedef enum
 	token_sdmmc_sd_controller,
 	token_sdmmc_max_power_class_supported,
 	token_spiflash_read_command_type_fast,
+	token_spiflash_page_size_2k_or_16k,
 	token_spiflash_clock_source,
 	token_spiflash_clock_divider,
 	token_sdmmc_data_width_4bit,
@@ -790,6 +791,7 @@ extern enum_item s_sdmmc_data_width_table_t114[];
 
 extern enum_item s_spi_clock_source_table_t20[];
 extern enum_item s_spi_clock_source_table_t30[];
+extern enum_item s_spi_clock_source_table_t114[];
 
 extern enum_item s_nvboot_memory_type_table_t20[];
 extern enum_item s_nvboot_memory_type_table_t30[];
@@ -808,6 +810,7 @@ extern field_item s_sdmmc_table_t114[];
 
 extern field_item s_spiflash_table_t20[];
 extern field_item s_spiflash_table_t30[];
+extern field_item s_spiflash_table_t114[];
 
 extern parse_subfield_item s_device_type_table_t20[];
 extern parse_subfield_item s_device_type_table_t30[];
diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c
index 9b11c76..f7e449a 100644
--- a/src/t114/nvbctlib_t114.c
+++ b/src/t114/nvbctlib_t114.c
@@ -116,6 +116,11 @@ t114_set_dev_param(build_image_context *context,
 	CASE_SET_DEV_PARAM(sdmmc, max_power_class_supported);
 	CASE_SET_DEV_PARAM(sdmmc, multi_page_support);
 
+	CASE_SET_DEV_PARAM(spiflash, clock_source);
+	CASE_SET_DEV_PARAM(spiflash, clock_divider);
+	CASE_SET_DEV_PARAM(spiflash, read_command_type_fast);
+	CASE_SET_DEV_PARAM(spiflash, page_size_2k_or_16k);
+
 	case token_dev_type:
 		bct->dev_type[index] = value;
 		break;
@@ -145,6 +150,11 @@ t114_get_dev_param(build_image_context *context,
 	CASE_GET_DEV_PARAM(sdmmc, max_power_class_supported);
 	CASE_GET_DEV_PARAM(sdmmc, multi_page_support);
 
+	CASE_GET_DEV_PARAM(spiflash, clock_source);
+	CASE_GET_DEV_PARAM(spiflash, clock_divider);
+	CASE_GET_DEV_PARAM(spiflash, read_command_type_fast);
+	CASE_GET_DEV_PARAM(spiflash, page_size_2k_or_16k);
+
 	case token_dev_type:
 		*value = bct->dev_type[index];
 		break;
@@ -955,8 +965,11 @@ t114_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 	CASE_GET_CONST(max_bct_search_blks, NVBOOT_MAX_BCT_SEARCH_BLOCKS);
 
 	CASE_GET_CONST_PREFIX(dev_type_sdmmc, nvboot);
+	CASE_GET_CONST_PREFIX(dev_type_spi, nvboot);
 	CASE_GET_CONST_PREFIX(sdmmc_data_width_4bit, nvboot);
 	CASE_GET_CONST_PREFIX(sdmmc_data_width_8bit, nvboot);
+	CASE_GET_CONST_PREFIX(spi_clock_source_pllp_out0, nvboot);
+	CASE_GET_CONST_PREFIX(spi_clock_source_clockm, nvboot);
 
 	CASE_GET_CONST_PREFIX(memory_type_none, nvboot);
 	CASE_GET_CONST_PREFIX(memory_type_ddr, nvboot);
@@ -1060,12 +1073,12 @@ cbootimage_soc_config tegra114_config = {
 
 	.devtype_table				= s_devtype_table_t114,
 	.sdmmc_data_width_table		= s_sdmmc_data_width_table_t114,
-	.spi_clock_source_table		= 0,
+	.spi_clock_source_table		= s_spi_clock_source_table_t114,
 	.nvboot_memory_type_table	= s_nvboot_memory_type_table_t114,
 	.sdram_field_table			= s_sdram_field_table_t114,
 	.nand_table					= 0,
 	.sdmmc_table				= s_sdmmc_table_t114,
-	.spiflash_table				= 0,
+	.spiflash_table				= s_spiflash_table_t114,
 	.device_type_table			= s_device_type_table_t114,
 };
 
diff --git a/src/t114/nvboot_bct_t114.h b/src/t114/nvboot_bct_t114.h
index d759803..e42d149 100644
--- a/src/t114/nvboot_bct_t114.h
+++ b/src/t114/nvboot_bct_t114.h
@@ -207,6 +207,49 @@ typedef struct nvboot_sdmmc_params_rec {
 	u_int8_t multi_page_support;
 } nvboot_sdmmc_params;
 
+typedef enum {
+	/* Specifies SPI clock source to be PLLP. */
+	nvboot_spi_clock_source_pllp_out0 = 0,
+
+	/* Specifies SPI clock source to be ClockM. */
+	nvboot_spi_clock_source_clockm = 6,
+
+	nvboot_spi_clock_source_num,
+	nvboot_spi_clock_source_force32 = 0x7FFFFFF
+} nvboot_spi_clock_source;
+
+/**
+ * Defines the parameters SPI FLASH devices.
+ */
+typedef struct nvboot_spiflash_params_rec {
+	/**
+	 * Specifies the clock source to use.
+	 */
+	u_int32_t clock_source;
+
+	/**
+	 * Specifes the clock divider to use.
+	 * The value is a 7-bit value based on an input clock of 432Mhz.
+	 * Divider = (432+ DesiredFrequency-1)/DesiredFrequency;
+	 * Typical values:
+	 *     NORMAL_READ at 20MHz: 22
+	 *     FAST_READ   at 33MHz: 14
+	 *     FAST_READ   at 40MHz: 11
+	 *     FAST_READ   at 50MHz:  9
+	 */
+	u_int8_t clock_divider;
+
+	/**
+	 * Specifies the type of command for read operations.
+	 * NV_FALSE specifies a NORMAL_READ Command
+	 * NV_TRUE  specifies a FAST_READ   Command
+	 */
+	u_int8_t read_command_type_fast;
+
+	/* 0 = 2k page size, 1 = 16K page size */
+	u_int8_t page_size_2k_or_16k;
+} nvboot_spiflash_params;
+
 /**
 * Defines the union of the parameters required by each device.
 */
@@ -214,6 +257,8 @@ typedef union {
 	u_int8_t size[64];
 	/* Specifies optimized parameters for eMMC and eSD */
 	nvboot_sdmmc_params sdmmc_params;
+	/* Specifies optimized parameters for SPI NOR */
+	nvboot_spiflash_params spiflash_params;
 } nvboot_dev_params;
 
 /**
@@ -226,6 +271,9 @@ typedef enum {
 	/* Specifies a default (unset) value. */
 	nvboot_dev_type_none = 0,
 
+	/* Specifies SPI NOR. */
+	nvboot_dev_type_spi = 3,
+
 	/* Specifies SDMMC (either eMMC or eSD). */
 	nvboot_dev_type_sdmmc = 4,
 
diff --git a/src/t114/parse_t114.c b/src/t114/parse_t114.c
index 81ac024..17f612e 100644
--- a/src/t114/parse_t114.c
+++ b/src/t114/parse_t114.c
@@ -26,7 +26,9 @@
 
 enum_item s_devtype_table_t114[] = {
 	{ "NvBootDevType_Sdmmc", nvboot_dev_type_sdmmc },
+	{ "NvBootDevType_Spi", nvboot_dev_type_spi },
 	{ "Sdmmc", nvboot_dev_type_sdmmc },
+	{ "Spi", nvboot_dev_type_spi },
 	{ NULL, 0 }
 };
 
@@ -44,6 +46,16 @@ enum_item s_sdmmc_data_width_table_t114[] = {
 	{ NULL, 0 }
 };
 
+enum_item s_spi_clock_source_table_t114[] = {
+	{ "NvBootSpiClockSource_PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "NvBootSpiClockSource_ClockM", nvboot_spi_clock_source_clockm },
+	{ "ClockSource_PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "ClockSource_ClockM", nvboot_spi_clock_source_clockm },
+	{ "PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "ClockM", nvboot_spi_clock_source_clockm },
+	{ NULL, 0 }
+};
+
 enum_item s_nvboot_memory_type_table_t114[] = {
 	{ "NvBootMemoryType_None", nvboot_memory_type_none },
 	{ "NvBootMemoryType_Ddr3", nvboot_memory_type_ddr3 },
@@ -398,8 +410,21 @@ field_item s_sdmmc_table_t114[] = {
 	{ NULL, 0, 0, NULL }
 };
 
+field_item s_spiflash_table_t114[] = {
+	{ "ReadCommandTypeFast",        TOKEN(spiflash_read_command_type_fast) },
+	{ "PageSize2kor16k",            TOKEN(spiflash_page_size_2k_or_16k) },
+	{ "ClockDivider",               TOKEN(spiflash_clock_divider) },
+	{ "ClockSource",
+	  token_spiflash_clock_source,
+	  field_type_enum,
+	  s_spi_clock_source_table_t114 },
+	{ NULL, 0, 0, NULL }
+};
+
 parse_subfield_item s_device_type_table_t114[] = {
 	{ "SdmmcParams.", token_sdmmc_params,
 		s_sdmmc_table_t114, t114_set_dev_param },
+	{ "SpiFlashParams.", token_spiflash_params,
+		s_spiflash_table_t114, t114_set_dev_param },
 	{ NULL, 0, NULL }
 };
-- 
1.8.1.5
