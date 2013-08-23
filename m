From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH 1/1] Add Tegra124 support
Date: Fri, 23 Aug 2013 11:46:31 +0800
Message-ID: <1377229591-21235-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the Tegra124 chip support to cbootimage. User can use "-t124" as
option to parse .cfg and generate BCT/image for Tegra124.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/Makefile.am                    |   12 +-
 src/cbootimage.c                   |   18 +-
 src/cbootimage.h                   |    1 +
 src/data_layout.c                  |    2 +
 src/parse.h                        |  104 ++++
 src/t124/nvbctlib_t124.c           | 1104 ++++++++++++++++++++++++++++++++++++
 src/t124/nvboot_bct_t124.h         |  359 ++++++++++++
 src/t124/nvboot_sdram_param_t124.h |  803 ++++++++++++++++++++++++++
 src/t124/parse_t124.c              |  429 ++++++++++++++
 9 files changed, 2822 insertions(+), 10 deletions(-)
 create mode 100644 src/t124/nvbctlib_t124.c
 create mode 100644 src/t124/nvboot_bct_t124.h
 create mode 100644 src/t124/nvboot_sdram_param_t124.h
 create mode 100644 src/t124/parse_t124.c

diff --git a/src/Makefile.am b/src/Makefile.am
index 6fcc0d8..b1d6bb7 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -9,9 +9,11 @@ cbootimage_SOURCES = \
 	aes_ref.c \
 	context.c \
 	parse.c \
+	t124/parse_t124.c \
 	t114/parse_t114.c \
 	t30/parse_t30.c \
 	t20/parse_t20.c \
+	t124/nvbctlib_t124.c \
 	t114/nvbctlib_t114.c \
 	t30/nvbctlib_t30.c \
 	t20/nvbctlib_t20.c \
@@ -27,7 +29,9 @@ cbootimage_SOURCES = \
 	t30/nvboot_bct_t30.h \
 	t30/nvboot_sdram_param_t30.h \
 	t114/nvboot_bct_t114.h \
-	t114/nvboot_sdram_param_t114.h
+	t114/nvboot_sdram_param_t114.h \
+	t124/nvboot_bct_t124.h \
+	t124/nvboot_sdram_param_t124.h
 
 cbootimage_LDADD = -lm
 
@@ -39,9 +43,11 @@ bct_dump_SOURCES = \
 	aes_ref.c \
 	context.c \
 	parse.c \
+	t124/parse_t124.c \
 	t114/parse_t114.c \
 	t30/parse_t30.c \
 	t20/parse_t20.c \
+	t124/nvbctlib_t124.c \
 	t114/nvbctlib_t114.c \
 	t30/nvbctlib_t30.c \
 	t20/nvbctlib_t20.c \
@@ -57,4 +63,6 @@ bct_dump_SOURCES = \
 	t30/nvboot_bct_t30.h \
 	t30/nvboot_sdram_param_t30.h \
 	t114/nvboot_bct_t114.h \
-	t114/nvboot_sdram_param_t114.h
+	t114/nvboot_sdram_param_t114.h \
+	t124/nvboot_bct_t124.h \
+	t124/nvboot_sdram_param_t124.h
diff --git a/src/cbootimage.c b/src/cbootimage.c
index 937bac9..aa6beab 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -64,14 +64,14 @@ usage(void)
 {
 	printf("Usage: cbootimage [options] configfile imagename\n");
 	printf("    options:\n");
-	printf("    -h, --help, -?        Display this message.\n");
-	printf("    -d, --debug           Output debugging information.\n");
-	printf("    -gbct                 Generate the new bct file.\n");
-	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
-	printf("    [-t20|-t30|-t114]     Select one of the possible target devices,\n");
-	printf("                          -t20 if unspecified.\n");
-	printf("    configfile            File with configuration information\n");
-	printf("    imagename             Output image name\n");
+	printf("    -h, --help, -?              Display this message.\n");
+	printf("    -d, --debug                 Output debugging information.\n");
+	printf("    -gbct                       Generate the new bct file.\n");
+	printf("    -o<ODM_DATA>                Specify the odm_data(in hex).\n");
+	printf("    [-t20|-t30|-t114|-t124]     Select one of the possible target devices,\n");
+	printf("                                -t20 if unspecified.\n");
+	printf("    configfile                  File with configuration information\n");
+	printf("    imagename                   Output image name\n");
 }
 
 static int
@@ -107,6 +107,8 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 				t30_get_soc_config(context, &g_soc_config);
 			} else if (!strcasecmp("114", optarg)) {
 				t114_get_soc_config(context, &g_soc_config);
+			} else if (!strcasecmp("124", optarg)) {
+				t124_get_soc_config(context, &g_soc_config);
 			} else {
 				printf("Unsupported chipname!\n");
 				usage();
diff --git a/src/cbootimage.h b/src/cbootimage.h
index b8f5c57..46e3b8b 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -42,6 +42,7 @@
 #define BOOTDATA_VERSION_T20		NVBOOT_BOOTDATA_VERSION(0x2, 0x1)
 #define BOOTDATA_VERSION_T30		NVBOOT_BOOTDATA_VERSION(0x3, 0x1)
 #define BOOTDATA_VERSION_T114		NVBOOT_BOOTDATA_VERSION(0x35, 0x1)
+#define BOOTDATA_VERSION_T124		NVBOOT_BOOTDATA_VERSION(0x40, 0x1)
 
 /*
  * Enumerations
diff --git a/src/data_layout.c b/src/data_layout.c
index ae62126..a085912 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -691,6 +691,8 @@ read_bct_file(struct build_image_context_rec *context)
 		return 0;
 	if (if_bct_is_t114_get_soc_config(context, &g_soc_config))
 		return 0;
+	if (if_bct_is_t124_get_soc_config(context, &g_soc_config))
+		return 0;
 
 	return ENODATA;
 }
diff --git a/src/parse.h b/src/parse.h
index ced4cfc..80f42c4 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -160,6 +160,17 @@ typedef enum
 	token_pllm_kcp,
 	token_pllm_kvco,
 	token_emc_bct_spare0,
+	token_emc_bct_spare1,
+	token_emc_bct_spare2,
+	token_emc_bct_spare3,
+	token_emc_bct_spare4,
+	token_emc_bct_spare5,
+	token_emc_bct_spare6,
+	token_emc_bct_spare7,
+	token_emc_bct_spare8,
+	token_emc_bct_spare9,
+	token_emc_bct_spare10,
+	token_emc_bct_spare11,
 	token_emc_clock_divider,
 	token_emc_auto_cal_interval,
 	token_emc_auto_cal_config,
@@ -185,16 +196,21 @@ typedef enum
 	token_emc_wdv,
 	token_emc_wdv_mask,
 	token_emc_quse,
+	token_emc_quse_width,
 	token_emc_ibdly,
 	token_emc_einput,
 	token_emc_einput_duration,
 	token_emc_puterm_extra,
+	token_emc_puterm_width,
+	token_emc_puterm_adj,
 	token_emc_cdb_cntl1,
 	token_emc_cdb_cntl2,
+	token_emc_cdb_cntl3,
 	token_emc_qrst,
 	token_emc_qsafe,
 	token_emc_rdv,
 	token_emc_rdv_mask,
+	token_emc_qpop,
 	token_emc_refresh,
 	token_emc_burst_refresh_num,
 	token_emc_pdex2wr,
@@ -230,6 +246,7 @@ typedef enum
 	token_mc_emem_cfg,
 	token_emc_cfg,
 	token_emc_cfg2,
+	token_emc_cfg_pipe,
 	token_emc_dbg,
 	token_emc_cfg_dig_dll,
 	token_emc_cfg_dig_dll_period,
@@ -308,6 +325,14 @@ typedef enum
 	token_emc_dll_xform_dqs5,
 	token_emc_dll_xform_dqs6,
 	token_emc_dll_xform_dqs7,
+	token_emc_dll_xform_dqs8,
+	token_emc_dll_xform_dqs9,
+	token_emc_dll_xform_dqs10,
+	token_emc_dll_xform_dqs11,
+	token_emc_dll_xform_dqs12,
+	token_emc_dll_xform_dqs13,
+	token_emc_dll_xform_dqs14,
+	token_emc_dll_xform_dqs15,
 	token_emc_dll_xform_quse0,
 	token_emc_dll_xform_quse1,
 	token_emc_dll_xform_quse2,
@@ -319,6 +344,17 @@ typedef enum
 	token_emc_dll_xform_addr0,
 	token_emc_dll_xform_addr1,
 	token_emc_dll_xform_addr2,
+	token_emc_dll_xform_addr3,
+	token_emc_dll_xform_addr4,
+	token_emc_dll_xform_addr5,
+	token_emc_dll_xform_quse8,
+	token_emc_dll_xform_quse9,
+	token_emc_dll_xform_quse10,
+	token_emc_dll_xform_quse11,
+	token_emc_dll_xform_quse12,
+	token_emc_dll_xform_quse13,
+	token_emc_dll_xform_quse14,
+	token_emc_dll_xform_quse15,
 	token_emc_dli_trim_tx_dqs0,
 	token_emc_dli_trim_tx_dqs1,
 	token_emc_dli_trim_tx_dqs2,
@@ -327,10 +363,22 @@ typedef enum
 	token_emc_dli_trim_tx_dqs5,
 	token_emc_dli_trim_tx_dqs6,
 	token_emc_dli_trim_tx_dqs7,
+	token_emc_dli_trim_tx_dqs8,
+	token_emc_dli_trim_tx_dqs9,
+	token_emc_dli_trim_tx_dqs10,
+	token_emc_dli_trim_tx_dqs11,
+	token_emc_dli_trim_tx_dqs12,
+	token_emc_dli_trim_tx_dqs13,
+	token_emc_dli_trim_tx_dqs14,
+	token_emc_dli_trim_tx_dqs15,
 	token_emc_dll_xform_dq0,
 	token_emc_dll_xform_dq1,
 	token_emc_dll_xform_dq2,
 	token_emc_dll_xform_dq3,
+	token_emc_dll_xform_dq4,
+	token_emc_dll_xform_dq5,
+	token_emc_dll_xform_dq6,
+	token_emc_dll_xform_dq7,
 	token_emc_zcal_interval,
 	token_emc_zcal_init_dev0,
 	token_emc_zcal_init_dev1,
@@ -349,32 +397,42 @@ typedef enum
 	token_emc_warm_boot_emr3,
 	token_emc_warm_boot_mrs_extra,
 	token_emc_clken_override,
+	token_mc_dis_extra_snap_levels,
 	token_emc_extra_refresh_num,
 	token_emc_clken_override_allwarm_boot,
 	token_mc_clken_override_allwarm_boot,
 	token_emc_cfg_dig_dll_period_warm_boot,
 	token_pmc_vddp_sel,
+	token_pmc_vddp_sel_wait,
 	token_pmc_ddr_cfg,
 	token_pmc_io_dpd_req,
 	token_pmc_io_dpd2_req,
+	token_pmc_io_dpd3_req,
+	token_pmc_io_dpd3_req_wait,
 	token_pmc_reg_short,
 	token_pmc_eno_vtt_gen,
 	token_pmc_no_io_power,
+	token_pmc_por_dpd_ctrl_wait,
 	token_emc_xm2cmd_pad_ctrl,
 	token_emc_xm2cmd_pad_ctrl2,
 	token_emc_xm2cmd_pad_ctrl3,
 	token_emc_xm2cmd_pad_ctrl4,
+	token_emc_xm2cmd_pad_ctrl5,
 	token_emc_xm2dqs_pad_ctrl,
 	token_emc_xm2dqs_pad_ctrl2,
 	token_emc_xm2dqs_pad_ctrl3,
 	token_emc_xm2dqs_pad_ctrl4,
+	token_emc_xm2dqs_pad_ctrl5,
+	token_emc_xm2dqs_pad_ctrl6,
 	token_emc_xm2dq_pad_ctrl,
 	token_emc_xm2dq_pad_ctrl2,
+	token_emc_xm2dq_pad_ctrl3,
 	token_emc_xm2clk_pad_ctrl,
 	token_emc_xm2clk_pad_ctrl2,
 	token_emc_xm2comp_pad_ctrl,
 	token_emc_xm2vttgen_pad_ctrl,
 	token_emc_xm2vttgen_pad_ctrl2,
+	token_emc_xm2vttgen_pad_ctrl3,
 	token_emc_xm2quse_pad_ctrl,
 	token_emc_acpd_control,
 	token_emc_swizzle_rank0_byte_cfg,
@@ -394,6 +452,7 @@ typedef enum
 	token_emc_addr_swizzle_stack3,
 	token_emc_dsr_vttgen_drv,
 	token_emc_txdsrvttgen,
+	token_emc_bgbias_ctl0,
 	token_mc_emem_adr_cfg,
 	token_mc_emem_adr_cfg_dev0,
 	token_mc_emem_adr_cfg_dev1,
@@ -402,6 +461,7 @@ typedef enum
 	token_mc_emem_adr_cfg_bank_mask0,
 	token_mc_emem_adr_cfg_bank_mask1,
 	token_mc_emem_adr_cfg_bank_mask2,
+	token_mc_emem_adr_cfg_bank_swizzle3,
 	token_mc_emem_arb_cfg,
 	token_mc_emem_arb_outstanding_req,
 	token_mc_emem_arb_timing_rcd,
@@ -422,13 +482,21 @@ typedef enum
 	token_mc_emem_arb_misc1,
 	token_mc_emem_arb_ring1_throttle,
 	token_mc_emem_arb_override,
+	token_mc_emem_arb_override1,
 	token_mc_emem_arb_rsv,
 	token_mc_clken_override,
 	token_mc_emc_reg_mode,
+	token_mc_stat_control,
+	token_mc_display_snap_ring,
 	token_mc_video_protect_bom,
+	token_mc_video_protect_bom_adr_hi,
 	token_mc_video_protect_size_mb,
 	token_mc_video_protect_vpr_override,
+	token_mc_video_protect_vpr_override1,
+	token_mc_video_protect_gpu_override0,
+	token_mc_video_protect_gpu_override1,
 	token_mc_sec_carveout_bom,
+	token_mc_sec_carveout_adr_hi,
 	token_mc_sec_carveout_size_mb,
 	token_mc_video_protect_write_access,
 	token_mc_sec_carveout_protect_write_access,
@@ -499,6 +567,10 @@ typedef enum
 	token_ch1_emc_xm2_dqs_pad_ctrl,
 	token_ch1_emc_xm2_dqs_pad_ctrl3,
 	token_ch1_emc_xm2_dqs_pad_ctrl4,
+	token_mc_mts_carveout_bom,
+	token_mc_mts_carveout_adr_hi,
+	token_mc_mts_carveout_size_mb,
+	token_mc_mts_carveout_reg_ctrl,
 
 	token_force32 = 0x7fffffff
 } parse_token;
@@ -693,6 +765,8 @@ typedef struct cbootimage_soc_config_rec {
 
 void process_config_file(build_image_context *context, u_int8_t simple_parse);
 
+void t124_get_soc_config(build_image_context *context,
+	cbootimage_soc_config **soc_config);
 void t114_get_soc_config(build_image_context *context,
 	cbootimage_soc_config **soc_config);
 void t30_get_soc_config(build_image_context *context,
@@ -700,6 +774,8 @@ void t30_get_soc_config(build_image_context *context,
 void t20_get_soc_config(build_image_context *context,
 	cbootimage_soc_config **soc_config);
 
+int if_bct_is_t124_get_soc_config(build_image_context *context,
+	cbootimage_soc_config **soc_config);
 int if_bct_is_t114_get_soc_config(build_image_context *context,
 	cbootimage_soc_config **soc_config);
 int if_bct_is_t30_get_soc_config(build_image_context *context,
@@ -708,6 +784,26 @@ int if_bct_is_t20_get_soc_config(build_image_context *context,
 	cbootimage_soc_config **soc_config);
 
 int
+t124_get_dev_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t *value);
+int
+t124_set_dev_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t value);
+int
+t124_get_sdram_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t *value);
+int
+t124_set_sdram_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t value);
+int
 t114_get_dev_param(build_image_context *context,
 	u_int32_t index,
 	parse_token token,
@@ -784,22 +880,27 @@ extern cbootimage_soc_config *g_soc_config;
 extern enum_item s_devtype_table_t20[];
 extern enum_item s_devtype_table_t30[];
 extern enum_item s_devtype_table_t114[];
+extern enum_item s_devtype_table_t124[];
 
 extern enum_item s_sdmmc_data_width_table_t20[];
 extern enum_item s_sdmmc_data_width_table_t30[];
 extern enum_item s_sdmmc_data_width_table_t114[];
+extern enum_item s_sdmmc_data_width_table_t124[];
 
 extern enum_item s_spi_clock_source_table_t20[];
 extern enum_item s_spi_clock_source_table_t30[];
 extern enum_item s_spi_clock_source_table_t114[];
+extern enum_item s_spi_clock_source_table_t124[];
 
 extern enum_item s_nvboot_memory_type_table_t20[];
 extern enum_item s_nvboot_memory_type_table_t30[];
 extern enum_item s_nvboot_memory_type_table_t114[];
+extern enum_item s_nvboot_memory_type_table_t124[];
 
 extern field_item s_sdram_field_table_t20[];
 extern field_item s_sdram_field_table_t30[];
 extern field_item s_sdram_field_table_t114[];
+extern field_item s_sdram_field_table_t124[];
 
 extern field_item s_nand_table_t20[];
 extern field_item s_nand_table_t30[];
@@ -807,13 +908,16 @@ extern field_item s_nand_table_t30[];
 extern field_item s_sdmmc_table_t20[];
 extern field_item s_sdmmc_table_t30[];
 extern field_item s_sdmmc_table_t114[];
+extern field_item s_sdmmc_table_t124[];
 
 extern field_item s_spiflash_table_t20[];
 extern field_item s_spiflash_table_t30[];
 extern field_item s_spiflash_table_t114[];
+extern field_item s_spiflash_table_t124[];
 
 extern parse_subfield_item s_device_type_table_t20[];
 extern parse_subfield_item s_device_type_table_t30[];
 extern parse_subfield_item s_device_type_table_t114[];
+extern parse_subfield_item s_device_type_table_t124[];
 
 #endif /* #ifndef INCLUDED_PARSE_H */
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
new file mode 100644
index 0000000..27e5a62
--- /dev/null
+++ b/src/t124/nvbctlib_t124.c
@@ -0,0 +1,1104 @@
+/*
+ * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ */
+
+#include "../cbootimage.h"
+#include "../parse.h"
+#include "../crypto.h"
+#include "nvboot_bct_t124.h"
+#include "string.h"
+
+/* nvbctlib_t124.c: The implementation of the nvbctlib API for t124. */
+
+/* Definitions that simplify the code which follows. */
+#define CASE_GET_SDRAM_PARAM(x) \
+case token_##x:\
+	*value = params->x; \
+	break
+
+#define CASE_SET_SDRAM_PARAM(x) \
+case token_##x:\
+	params->x = value; \
+	break
+
+#define CASE_GET_DEV_PARAM(dev, x) \
+case token_##dev##_##x:\
+	*value = bct->dev_params[index].dev##_params.x; \
+	break
+
+#define CASE_SET_DEV_PARAM(dev, x) \
+case token_##dev##_##x:\
+	bct->dev_params[index].dev##_params.x = value; \
+	break
+
+#define CASE_GET_BL_PARAM(x) \
+case token_bl_##x:\
+	*data = bct_ptr->bootloader[set].x; \
+	break
+
+#define CASE_SET_BL_PARAM(x) \
+case token_bl_##x:\
+	bct_ptr->bootloader[set].x = *data; \
+	break
+
+#define CASE_GET_NVU32(id) \
+case token_##id:\
+	if (bct == NULL) \
+		return -ENODATA; \
+	*data = bct_ptr->id; \
+	break
+
+#define CASE_GET_CONST(id, val) \
+case token_##id:\
+	*data = val; \
+	break
+
+#define CASE_GET_CONST_PREFIX(id, val_prefix) \
+case token_##id:\
+	*data = val_prefix##_##id; \
+	break
+
+#define CASE_SET_NVU32(id) \
+case token_##id:\
+	bct_ptr->id = data; \
+	break
+
+#define CASE_GET_DATA(id, size) \
+case token_##id:\
+	if (*length < size) \
+		return -ENODATA;\
+	memcpy(data, &(bct_ptr->id), size);   \
+	*length = size;\
+	break
+
+#define CASE_SET_DATA(id, size) \
+case token_##id:\
+	if (length < size) \
+		return -ENODATA;\
+	memcpy(&(bct_ptr->id), data, size);   \
+	break
+
+#define DEFAULT()                                   \
+default :                                           \
+	printf("Unexpected token %d at line %d\n",  \
+		token, __LINE__);                   \
+	return 1
+
+int
+t124_set_dev_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t value)
+{
+	nvboot_config_table *bct = NULL;
+
+	bct = (nvboot_config_table *)(context->bct);
+	assert(context != NULL);
+	assert(bct != NULL);
+
+	bct->num_param_sets = NV_MAX(bct->num_param_sets, index + 1);
+
+	switch (token) {
+	CASE_SET_DEV_PARAM(sdmmc, clock_divider);
+	CASE_SET_DEV_PARAM(sdmmc, data_width);
+	CASE_SET_DEV_PARAM(sdmmc, max_power_class_supported);
+	CASE_SET_DEV_PARAM(sdmmc, multi_page_support);
+
+	CASE_SET_DEV_PARAM(spiflash, clock_source);
+	CASE_SET_DEV_PARAM(spiflash, clock_divider);
+	CASE_SET_DEV_PARAM(spiflash, read_command_type_fast);
+	CASE_SET_DEV_PARAM(spiflash, page_size_2k_or_16k);
+
+	case token_dev_type:
+		bct->dev_type[index] = value;
+		break;
+
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+int
+t124_get_dev_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t *value)
+{
+	nvboot_config_table *bct = NULL;
+
+	bct = (nvboot_config_table *)(context->bct);
+	assert(context != NULL);
+	assert(bct != NULL);
+
+	switch (token) {
+	CASE_GET_DEV_PARAM(sdmmc, clock_divider);
+	CASE_GET_DEV_PARAM(sdmmc, data_width);
+	CASE_GET_DEV_PARAM(sdmmc, max_power_class_supported);
+	CASE_GET_DEV_PARAM(sdmmc, multi_page_support);
+
+	CASE_GET_DEV_PARAM(spiflash, clock_source);
+	CASE_GET_DEV_PARAM(spiflash, clock_divider);
+	CASE_GET_DEV_PARAM(spiflash, read_command_type_fast);
+	CASE_GET_DEV_PARAM(spiflash, page_size_2k_or_16k);
+
+	case token_dev_type:
+		*value = bct->dev_type[index];
+		break;
+
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+int
+t124_get_sdram_param(build_image_context *context,
+		u_int32_t index,
+		parse_token token,
+		u_int32_t *value)
+{
+	nvboot_sdram_params *params;
+	nvboot_config_table *bct = NULL;
+
+	bct = (nvboot_config_table *)(context->bct);
+	assert(context != NULL);
+	assert(bct != NULL);
+	params = &(bct->sdram_params[index]);
+
+	switch (token) {
+	CASE_GET_SDRAM_PARAM(memory_type);
+	CASE_GET_SDRAM_PARAM(pllm_input_divider);
+	CASE_GET_SDRAM_PARAM(pllm_feedback_divider);
+	CASE_GET_SDRAM_PARAM(pllm_stable_time);
+	CASE_GET_SDRAM_PARAM(pllm_setup_control);
+	CASE_GET_SDRAM_PARAM(pllm_select_div2);
+	CASE_GET_SDRAM_PARAM(pllm_pdlshift_ph45);
+	CASE_GET_SDRAM_PARAM(pllm_pdlshift_ph90);
+	CASE_GET_SDRAM_PARAM(pllm_pdlshift_ph135);
+	CASE_GET_SDRAM_PARAM(pllm_kcp);
+	CASE_GET_SDRAM_PARAM(pllm_kvco);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare0);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare1);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare2);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare3);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare4);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare5);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare6);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare7);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare8);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare9);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare10);
+	CASE_GET_SDRAM_PARAM(emc_bct_spare11);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_interval);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config2);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config3);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_wait);
+	CASE_GET_SDRAM_PARAM(emc_pin_program_wait);
+	CASE_GET_SDRAM_PARAM(emc_rc);
+	CASE_GET_SDRAM_PARAM(emc_rfc);
+	CASE_GET_SDRAM_PARAM(emc_rfc_slr);
+	CASE_GET_SDRAM_PARAM(emc_ras);
+	CASE_GET_SDRAM_PARAM(emc_rp);
+	CASE_GET_SDRAM_PARAM(emc_r2r);
+	CASE_GET_SDRAM_PARAM(emc_w2w);
+	CASE_GET_SDRAM_PARAM(emc_r2w);
+	CASE_GET_SDRAM_PARAM(emc_w2r);
+	CASE_GET_SDRAM_PARAM(emc_r2p);
+	CASE_GET_SDRAM_PARAM(emc_w2p);
+	CASE_GET_SDRAM_PARAM(emc_rd_rcd);
+	CASE_GET_SDRAM_PARAM(emc_wr_rcd);
+	CASE_GET_SDRAM_PARAM(emc_rrd);
+	CASE_GET_SDRAM_PARAM(emc_rext);
+	CASE_GET_SDRAM_PARAM(emc_wdv);
+	CASE_GET_SDRAM_PARAM(emc_wdv_mask);
+	CASE_GET_SDRAM_PARAM(emc_quse);
+	CASE_GET_SDRAM_PARAM(emc_quse_width);
+	CASE_GET_SDRAM_PARAM(emc_ibdly);
+	CASE_GET_SDRAM_PARAM(emc_einput);
+	CASE_GET_SDRAM_PARAM(emc_einput_duration);
+	CASE_GET_SDRAM_PARAM(emc_puterm_extra);
+	CASE_GET_SDRAM_PARAM(emc_puterm_width);
+	CASE_GET_SDRAM_PARAM(emc_puterm_adj);
+	CASE_GET_SDRAM_PARAM(emc_cdb_cntl1);
+	CASE_GET_SDRAM_PARAM(emc_cdb_cntl2);
+	CASE_GET_SDRAM_PARAM(emc_cdb_cntl3);
+	CASE_GET_SDRAM_PARAM(emc_qrst);
+	CASE_GET_SDRAM_PARAM(emc_qsafe);
+	CASE_GET_SDRAM_PARAM(emc_rdv);
+	CASE_GET_SDRAM_PARAM(emc_rdv_mask);
+	CASE_GET_SDRAM_PARAM(emc_qpop);
+	CASE_GET_SDRAM_PARAM(emc_refresh);
+	CASE_GET_SDRAM_PARAM(emc_burst_refresh_num);
+	CASE_GET_SDRAM_PARAM(emc_pdex2wr);
+	CASE_GET_SDRAM_PARAM(emc_pdex2rd);
+	CASE_GET_SDRAM_PARAM(emc_pchg2pden);
+	CASE_GET_SDRAM_PARAM(emc_act2pden);
+	CASE_GET_SDRAM_PARAM(emc_ar2pden);
+	CASE_GET_SDRAM_PARAM(emc_rw2pden);
+	CASE_GET_SDRAM_PARAM(emc_txsr);
+	CASE_GET_SDRAM_PARAM(emc_tcke);
+	CASE_GET_SDRAM_PARAM(emc_tckesr);
+	CASE_GET_SDRAM_PARAM(emc_tpd);
+	CASE_GET_SDRAM_PARAM(emc_tfaw);
+	CASE_GET_SDRAM_PARAM(emc_trpab);
+	CASE_GET_SDRAM_PARAM(emc_tclkstable);
+	CASE_GET_SDRAM_PARAM(emc_tclkstop);
+	CASE_GET_SDRAM_PARAM(emc_trefbw);
+	CASE_GET_SDRAM_PARAM(emc_fbio_cfg5);
+	CASE_GET_SDRAM_PARAM(emc_fbio_cfg6);
+	CASE_GET_SDRAM_PARAM(emc_fbio_spare);
+	CASE_GET_SDRAM_PARAM(emc_mrs);
+	CASE_GET_SDRAM_PARAM(emc_emrs);
+	CASE_GET_SDRAM_PARAM(emc_emrs2);
+	CASE_GET_SDRAM_PARAM(emc_emrs3);
+	CASE_GET_SDRAM_PARAM(emc_mrw1);
+	CASE_GET_SDRAM_PARAM(emc_mrw2);
+	CASE_GET_SDRAM_PARAM(emc_mrw3);
+	CASE_GET_SDRAM_PARAM(emc_mrw4);
+	CASE_GET_SDRAM_PARAM(emc_mrw_reset_command);
+	CASE_GET_SDRAM_PARAM(emc_mrw_reset_ninit_wait);
+	CASE_GET_SDRAM_PARAM(emc_adr_cfg);
+	CASE_GET_SDRAM_PARAM(mc_emem_cfg);
+	CASE_GET_SDRAM_PARAM(emc_cfg);
+	CASE_GET_SDRAM_PARAM(emc_cfg2);
+	CASE_GET_SDRAM_PARAM(emc_cfg_pipe);
+	CASE_GET_SDRAM_PARAM(emc_dbg);
+	CASE_GET_SDRAM_PARAM(emc_cfg_dig_dll);
+	CASE_GET_SDRAM_PARAM(emc_cfg_dig_dll_period);
+	CASE_GET_SDRAM_PARAM(warm_boot_wait);
+	CASE_GET_SDRAM_PARAM(emc_ctt_term_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_odt_write);
+	CASE_GET_SDRAM_PARAM(emc_odt_read);
+	CASE_GET_SDRAM_PARAM(emc_zcal_wait_cnt);
+	CASE_GET_SDRAM_PARAM(emc_zcal_mrw_cmd);
+	CASE_GET_SDRAM_PARAM(emc_mrs_reset_dll);
+	CASE_GET_SDRAM_PARAM(emc_mrs_reset_dll_wait);
+	CASE_GET_SDRAM_PARAM(emc_emrs_ddr2_dll_enable);
+	CASE_GET_SDRAM_PARAM(emc_mrs_ddr2_dll_reset);
+	CASE_GET_SDRAM_PARAM(emc_emrs_ddr2_ocd_calib);
+	CASE_GET_SDRAM_PARAM(emc_ddr2_wait);
+	CASE_GET_SDRAM_PARAM(pmc_ddr_pwr);
+	CASE_GET_SDRAM_PARAM(emc_clock_source);
+	CASE_GET_SDRAM_PARAM(emc_pin_extra_wait);
+	CASE_GET_SDRAM_PARAM(emc_timing_control_wait);
+	CASE_GET_SDRAM_PARAM(emc_wext);
+	CASE_GET_SDRAM_PARAM(emc_ctt);
+	CASE_GET_SDRAM_PARAM(emc_ctt_duration);
+	CASE_GET_SDRAM_PARAM(emc_prerefresh_req_cnt);
+	CASE_GET_SDRAM_PARAM(emc_txsr_dll);
+	CASE_GET_SDRAM_PARAM(emc_cfg_rsv);
+	CASE_GET_SDRAM_PARAM(emc_mrw_extra);
+	CASE_GET_SDRAM_PARAM(emc_warm_boot_mrw_extra);
+	CASE_GET_SDRAM_PARAM(emc_warm_boot_extramode_reg_write_enable);
+	CASE_GET_SDRAM_PARAM(emc_extramode_reg_write_enable);
+	CASE_GET_SDRAM_PARAM(emc_mrs_wait_cnt);
+	CASE_GET_SDRAM_PARAM(emc_mrs_wait_cnt2);
+	CASE_GET_SDRAM_PARAM(emc_cmd_q);
+	CASE_GET_SDRAM_PARAM(emc_mc2emc_q);
+	CASE_GET_SDRAM_PARAM(emc_dyn_self_ref_control);
+	CASE_GET_SDRAM_PARAM(ahb_arbitration_xbar_ctrl_meminit_done);
+	CASE_GET_SDRAM_PARAM(emc_dev_select);
+	CASE_GET_SDRAM_PARAM(emc_sel_dpd_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs0);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs1);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs2);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs3);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs4);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs5);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs6);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs7);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs8);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs9);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs10);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs11);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs12);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs13);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs14);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dqs15);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse0);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse1);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse2);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse3);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse4);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse5);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse6);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse7);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_addr0);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_addr1);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_addr2);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_addr3);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_addr4);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_addr5);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse8);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse9);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse10);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse11);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse12);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse13);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse14);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_quse15);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs0);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs1);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs2);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs3);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs4);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs5);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs6);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs7);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs8);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs9);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs10);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs11);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs12);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs13);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs14);
+	CASE_GET_SDRAM_PARAM(emc_dli_trim_tx_dqs15);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dq0);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dq1);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dq2);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dq3);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dq4);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dq5);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dq6);
+	CASE_GET_SDRAM_PARAM(emc_dll_xform_dq7);
+	CASE_GET_SDRAM_PARAM(emc_zcal_interval);
+	CASE_GET_SDRAM_PARAM(emc_zcal_init_dev0);
+	CASE_GET_SDRAM_PARAM(emc_zcal_init_dev1);
+	CASE_GET_SDRAM_PARAM(emc_zcal_init_wait);
+	CASE_GET_SDRAM_PARAM(emc_zcal_warm_cold_boot_enables);
+	CASE_GET_SDRAM_PARAM(emc_mrw_lpddr2zcal_warm_boot);
+	CASE_GET_SDRAM_PARAM(emc_zqcal_ddr3_warm_boot);
+	CASE_GET_SDRAM_PARAM(emc_zcal_warm_boot_wait);
+	CASE_GET_SDRAM_PARAM(emc_mrs_warm_boot_enable);
+	CASE_GET_SDRAM_PARAM(emc_mrs_extra);
+	CASE_GET_SDRAM_PARAM(emc_warm_boot_mrs_extra);
+	CASE_GET_SDRAM_PARAM(emc_clken_override);
+	CASE_GET_SDRAM_PARAM(mc_dis_extra_snap_levels);
+	CASE_GET_SDRAM_PARAM(emc_extra_refresh_num);
+	CASE_GET_SDRAM_PARAM(emc_clken_override_allwarm_boot);
+	CASE_GET_SDRAM_PARAM(mc_clken_override_allwarm_boot);
+	CASE_GET_SDRAM_PARAM(emc_cfg_dig_dll_period_warm_boot);
+	CASE_GET_SDRAM_PARAM(pmc_vddp_sel);
+	CASE_GET_SDRAM_PARAM(pmc_vddp_sel_wait);
+	CASE_GET_SDRAM_PARAM(pmc_ddr_cfg);
+	CASE_GET_SDRAM_PARAM(pmc_io_dpd3_req);
+	CASE_GET_SDRAM_PARAM(pmc_io_dpd3_req_wait);
+	CASE_GET_SDRAM_PARAM(pmc_reg_short);
+	CASE_GET_SDRAM_PARAM(pmc_no_io_power);
+	CASE_GET_SDRAM_PARAM(pmc_por_dpd_ctrl_wait);
+	CASE_GET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl2);
+	CASE_GET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl3);
+	CASE_GET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl4);
+	CASE_GET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl5);
+	CASE_GET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl2);
+	CASE_GET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl3);
+	CASE_GET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl4);
+	CASE_GET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl5);
+	CASE_GET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl6);
+	CASE_GET_SDRAM_PARAM(emc_xm2dq_pad_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_xm2dq_pad_ctrl2);
+	CASE_GET_SDRAM_PARAM(emc_xm2dq_pad_ctrl3);
+	CASE_GET_SDRAM_PARAM(emc_xm2clk_pad_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_xm2clk_pad_ctrl2);
+	CASE_GET_SDRAM_PARAM(emc_xm2comp_pad_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_xm2vttgen_pad_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_xm2vttgen_pad_ctrl2);
+	CASE_GET_SDRAM_PARAM(emc_xm2vttgen_pad_ctrl3);
+	CASE_GET_SDRAM_PARAM(emc_acpd_control);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte_cfg);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte0);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte1);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte2);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte3);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte_cfg);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte0);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte1);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte2);
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte3);
+	CASE_GET_SDRAM_PARAM(emc_dsr_vttgen_drv);
+	CASE_GET_SDRAM_PARAM(emc_txdsrvttgen);
+	CASE_GET_SDRAM_PARAM(emc_bgbias_ctl0);
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg);
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_dev0);
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_dev1);
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask0);
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask1);
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask2);
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_bank_swizzle3);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_cfg);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_outstanding_req);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rcd);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rp);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rc);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_ras);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_faw);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rrd);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rap2pre);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_wap2pre);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_r2r);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_w2w);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_r2w);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_w2r);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_da_turns);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_da_covers);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_misc0);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_misc1);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_ring1_throttle);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_override);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_override1);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_rsv);
+	CASE_GET_SDRAM_PARAM(mc_clken_override);
+	CASE_GET_SDRAM_PARAM(mc_stat_control);
+	CASE_GET_SDRAM_PARAM(mc_display_snap_ring);
+	CASE_GET_SDRAM_PARAM(mc_video_protect_bom);
+	CASE_GET_SDRAM_PARAM(mc_video_protect_bom_adr_hi);
+	CASE_GET_SDRAM_PARAM(mc_video_protect_size_mb);
+	CASE_GET_SDRAM_PARAM(mc_video_protect_vpr_override);
+	CASE_GET_SDRAM_PARAM(mc_video_protect_vpr_override1);
+	CASE_GET_SDRAM_PARAM(mc_video_protect_gpu_override0);
+	CASE_GET_SDRAM_PARAM(mc_video_protect_gpu_override1);
+	CASE_GET_SDRAM_PARAM(mc_sec_carveout_bom);
+	CASE_GET_SDRAM_PARAM(mc_sec_carveout_adr_hi);
+	CASE_GET_SDRAM_PARAM(mc_sec_carveout_size_mb);
+	CASE_GET_SDRAM_PARAM(mc_video_protect_write_access);
+	CASE_GET_SDRAM_PARAM(mc_sec_carveout_protect_write_access);
+	CASE_GET_SDRAM_PARAM(emc_ca_training_enable);
+	CASE_GET_SDRAM_PARAM(emc_ca_training_timing_cntl1);
+	CASE_GET_SDRAM_PARAM(emc_ca_training_timing_cntl2);
+	CASE_GET_SDRAM_PARAM(swizzle_rank_byte_encode);
+	CASE_GET_SDRAM_PARAM(boot_rom_patch_control);
+	CASE_GET_SDRAM_PARAM(boot_rom_patch_data);
+	CASE_GET_SDRAM_PARAM(mc_mts_carveout_bom);
+	CASE_GET_SDRAM_PARAM(mc_mts_carveout_adr_hi);
+	CASE_GET_SDRAM_PARAM(mc_mts_carveout_size_mb);
+	CASE_GET_SDRAM_PARAM(mc_mts_carveout_reg_ctrl);
+
+	DEFAULT();
+	}
+	return 0;
+}
+
+int
+t124_set_sdram_param(build_image_context *context,
+		u_int32_t index,
+		parse_token token,
+		u_int32_t value)
+{
+	nvboot_sdram_params *params;
+	nvboot_config_table *bct = NULL;
+
+	bct = (nvboot_config_table *)(context->bct);
+	assert(context != NULL);
+	assert(bct != NULL);
+	params = &(bct->sdram_params[index]);
+	/* Update the number of SDRAM parameter sets. */
+	bct->num_sdram_sets = NV_MAX(bct->num_sdram_sets, index + 1);
+
+	switch (token) {
+	CASE_SET_SDRAM_PARAM(memory_type);
+	CASE_SET_SDRAM_PARAM(pllm_input_divider);
+	CASE_SET_SDRAM_PARAM(pllm_feedback_divider);
+	CASE_SET_SDRAM_PARAM(pllm_stable_time);
+	CASE_SET_SDRAM_PARAM(pllm_setup_control);
+	CASE_SET_SDRAM_PARAM(pllm_select_div2);
+	CASE_SET_SDRAM_PARAM(pllm_pdlshift_ph45);
+	CASE_SET_SDRAM_PARAM(pllm_pdlshift_ph90);
+	CASE_SET_SDRAM_PARAM(pllm_pdlshift_ph135);
+	CASE_SET_SDRAM_PARAM(pllm_kcp);
+	CASE_SET_SDRAM_PARAM(pllm_kvco);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare0);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare1);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare2);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare3);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare4);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare5);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare6);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare7);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare8);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare9);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare10);
+	CASE_SET_SDRAM_PARAM(emc_bct_spare11);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_interval);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config2);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config3);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_wait);
+	CASE_SET_SDRAM_PARAM(emc_pin_program_wait);
+	CASE_SET_SDRAM_PARAM(emc_rc);
+	CASE_SET_SDRAM_PARAM(emc_rfc);
+	CASE_SET_SDRAM_PARAM(emc_rfc_slr);
+	CASE_SET_SDRAM_PARAM(emc_ras);
+	CASE_SET_SDRAM_PARAM(emc_rp);
+	CASE_SET_SDRAM_PARAM(emc_r2r);
+	CASE_SET_SDRAM_PARAM(emc_w2w);
+	CASE_SET_SDRAM_PARAM(emc_r2w);
+	CASE_SET_SDRAM_PARAM(emc_w2r);
+	CASE_SET_SDRAM_PARAM(emc_r2p);
+	CASE_SET_SDRAM_PARAM(emc_w2p);
+	CASE_SET_SDRAM_PARAM(emc_rd_rcd);
+	CASE_SET_SDRAM_PARAM(emc_wr_rcd);
+	CASE_SET_SDRAM_PARAM(emc_rrd);
+	CASE_SET_SDRAM_PARAM(emc_rext);
+	CASE_SET_SDRAM_PARAM(emc_wdv);
+	CASE_SET_SDRAM_PARAM(emc_wdv_mask);
+	CASE_SET_SDRAM_PARAM(emc_quse);
+	CASE_SET_SDRAM_PARAM(emc_quse_width);
+	CASE_SET_SDRAM_PARAM(emc_ibdly);
+	CASE_SET_SDRAM_PARAM(emc_einput);
+	CASE_SET_SDRAM_PARAM(emc_einput_duration);
+	CASE_SET_SDRAM_PARAM(emc_puterm_extra);
+	CASE_SET_SDRAM_PARAM(emc_puterm_width);
+	CASE_SET_SDRAM_PARAM(emc_puterm_adj);
+	CASE_SET_SDRAM_PARAM(emc_cdb_cntl1);
+	CASE_SET_SDRAM_PARAM(emc_cdb_cntl2);
+	CASE_SET_SDRAM_PARAM(emc_cdb_cntl3);
+	CASE_SET_SDRAM_PARAM(emc_qrst);
+	CASE_SET_SDRAM_PARAM(emc_qsafe);
+	CASE_SET_SDRAM_PARAM(emc_rdv);
+	CASE_SET_SDRAM_PARAM(emc_rdv_mask);
+	CASE_SET_SDRAM_PARAM(emc_qpop);
+	CASE_SET_SDRAM_PARAM(emc_refresh);
+	CASE_SET_SDRAM_PARAM(emc_burst_refresh_num);
+	CASE_SET_SDRAM_PARAM(emc_pdex2wr);
+	CASE_SET_SDRAM_PARAM(emc_pdex2rd);
+	CASE_SET_SDRAM_PARAM(emc_pchg2pden);
+	CASE_SET_SDRAM_PARAM(emc_act2pden);
+	CASE_SET_SDRAM_PARAM(emc_ar2pden);
+	CASE_SET_SDRAM_PARAM(emc_rw2pden);
+	CASE_SET_SDRAM_PARAM(emc_txsr);
+	CASE_SET_SDRAM_PARAM(emc_tcke);
+	CASE_SET_SDRAM_PARAM(emc_tckesr);
+	CASE_SET_SDRAM_PARAM(emc_tpd);
+	CASE_SET_SDRAM_PARAM(emc_tfaw);
+	CASE_SET_SDRAM_PARAM(emc_trpab);
+	CASE_SET_SDRAM_PARAM(emc_tclkstable);
+	CASE_SET_SDRAM_PARAM(emc_tclkstop);
+	CASE_SET_SDRAM_PARAM(emc_trefbw);
+	CASE_SET_SDRAM_PARAM(emc_fbio_cfg5);
+	CASE_SET_SDRAM_PARAM(emc_fbio_cfg6);
+	CASE_SET_SDRAM_PARAM(emc_fbio_spare);
+	CASE_SET_SDRAM_PARAM(emc_mrs);
+	CASE_SET_SDRAM_PARAM(emc_emrs);
+	CASE_SET_SDRAM_PARAM(emc_emrs2);
+	CASE_SET_SDRAM_PARAM(emc_emrs3);
+	CASE_SET_SDRAM_PARAM(emc_mrw1);
+	CASE_SET_SDRAM_PARAM(emc_mrw2);
+	CASE_SET_SDRAM_PARAM(emc_mrw3);
+	CASE_SET_SDRAM_PARAM(emc_mrw4);
+	CASE_SET_SDRAM_PARAM(emc_mrw_reset_command);
+	CASE_SET_SDRAM_PARAM(emc_mrw_reset_ninit_wait);
+	CASE_SET_SDRAM_PARAM(emc_adr_cfg);
+	CASE_SET_SDRAM_PARAM(mc_emem_cfg);
+	CASE_SET_SDRAM_PARAM(emc_cfg);
+	CASE_SET_SDRAM_PARAM(emc_cfg2);
+	CASE_SET_SDRAM_PARAM(emc_cfg_pipe);
+	CASE_SET_SDRAM_PARAM(emc_dbg);
+	CASE_SET_SDRAM_PARAM(emc_cfg_dig_dll);
+	CASE_SET_SDRAM_PARAM(emc_cfg_dig_dll_period);
+	CASE_SET_SDRAM_PARAM(warm_boot_wait);
+	CASE_SET_SDRAM_PARAM(emc_ctt_term_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_odt_write);
+	CASE_SET_SDRAM_PARAM(emc_odt_read);
+	CASE_SET_SDRAM_PARAM(emc_zcal_wait_cnt);
+	CASE_SET_SDRAM_PARAM(emc_zcal_mrw_cmd);
+	CASE_SET_SDRAM_PARAM(emc_mrs_reset_dll);
+	CASE_SET_SDRAM_PARAM(emc_mrs_reset_dll_wait);
+	CASE_SET_SDRAM_PARAM(emc_emrs_ddr2_dll_enable);
+	CASE_SET_SDRAM_PARAM(emc_mrs_ddr2_dll_reset);
+	CASE_SET_SDRAM_PARAM(emc_emrs_ddr2_ocd_calib);
+	CASE_SET_SDRAM_PARAM(emc_ddr2_wait);
+	CASE_SET_SDRAM_PARAM(pmc_ddr_pwr);
+	CASE_SET_SDRAM_PARAM(emc_clock_source);
+	CASE_SET_SDRAM_PARAM(emc_pin_extra_wait);
+	CASE_SET_SDRAM_PARAM(emc_timing_control_wait);
+	CASE_SET_SDRAM_PARAM(emc_wext);
+	CASE_SET_SDRAM_PARAM(emc_ctt);
+	CASE_SET_SDRAM_PARAM(emc_ctt_duration);
+	CASE_SET_SDRAM_PARAM(emc_prerefresh_req_cnt);
+	CASE_SET_SDRAM_PARAM(emc_txsr_dll);
+	CASE_SET_SDRAM_PARAM(emc_cfg_rsv);
+	CASE_SET_SDRAM_PARAM(emc_mrw_extra);
+	CASE_SET_SDRAM_PARAM(emc_warm_boot_mrw_extra);
+	CASE_SET_SDRAM_PARAM(emc_warm_boot_extramode_reg_write_enable);
+	CASE_SET_SDRAM_PARAM(emc_extramode_reg_write_enable);
+	CASE_SET_SDRAM_PARAM(emc_mrs_wait_cnt);
+	CASE_SET_SDRAM_PARAM(emc_mrs_wait_cnt2);
+	CASE_SET_SDRAM_PARAM(emc_cmd_q);
+	CASE_SET_SDRAM_PARAM(emc_mc2emc_q);
+	CASE_SET_SDRAM_PARAM(emc_dyn_self_ref_control);
+	CASE_SET_SDRAM_PARAM(ahb_arbitration_xbar_ctrl_meminit_done);
+	CASE_SET_SDRAM_PARAM(emc_dev_select);
+	CASE_SET_SDRAM_PARAM(emc_sel_dpd_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs0);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs1);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs2);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs3);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs4);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs5);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs6);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs7);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs8);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs9);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs10);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs11);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs12);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs13);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs14);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dqs15);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse0);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse1);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse2);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse3);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse4);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse5);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse6);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse7);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_addr0);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_addr1);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_addr2);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_addr3);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_addr4);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_addr5);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse8);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse9);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse10);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse11);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse12);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse13);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse14);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_quse15);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs0);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs1);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs2);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs3);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs4);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs5);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs6);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs7);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs8);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs9);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs10);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs11);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs12);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs13);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs14);
+	CASE_SET_SDRAM_PARAM(emc_dli_trim_tx_dqs15);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dq0);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dq1);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dq2);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dq3);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dq4);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dq5);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dq6);
+	CASE_SET_SDRAM_PARAM(emc_dll_xform_dq7);
+	CASE_SET_SDRAM_PARAM(emc_zcal_interval);
+	CASE_SET_SDRAM_PARAM(emc_zcal_init_dev0);
+	CASE_SET_SDRAM_PARAM(emc_zcal_init_dev1);
+	CASE_SET_SDRAM_PARAM(emc_zcal_init_wait);
+	CASE_SET_SDRAM_PARAM(emc_zcal_warm_cold_boot_enables);
+	CASE_SET_SDRAM_PARAM(emc_mrw_lpddr2zcal_warm_boot);
+	CASE_SET_SDRAM_PARAM(emc_zqcal_ddr3_warm_boot);
+	CASE_SET_SDRAM_PARAM(emc_zcal_warm_boot_wait);
+	CASE_SET_SDRAM_PARAM(emc_mrs_warm_boot_enable);
+	CASE_SET_SDRAM_PARAM(emc_mrs_extra);
+	CASE_SET_SDRAM_PARAM(emc_warm_boot_mrs_extra);
+	CASE_SET_SDRAM_PARAM(emc_clken_override);
+	CASE_SET_SDRAM_PARAM(mc_dis_extra_snap_levels);
+	CASE_SET_SDRAM_PARAM(emc_extra_refresh_num);
+	CASE_SET_SDRAM_PARAM(emc_clken_override_allwarm_boot);
+	CASE_SET_SDRAM_PARAM(mc_clken_override_allwarm_boot);
+	CASE_SET_SDRAM_PARAM(emc_cfg_dig_dll_period_warm_boot);
+	CASE_SET_SDRAM_PARAM(pmc_vddp_sel);
+	CASE_SET_SDRAM_PARAM(pmc_vddp_sel_wait);
+	CASE_SET_SDRAM_PARAM(pmc_ddr_cfg);
+	CASE_SET_SDRAM_PARAM(pmc_io_dpd3_req);
+	CASE_SET_SDRAM_PARAM(pmc_io_dpd3_req_wait);
+	CASE_SET_SDRAM_PARAM(pmc_reg_short);
+	CASE_SET_SDRAM_PARAM(pmc_no_io_power);
+	CASE_SET_SDRAM_PARAM(pmc_por_dpd_ctrl_wait);
+	CASE_SET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl2);
+	CASE_SET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl3);
+	CASE_SET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl4);
+	CASE_SET_SDRAM_PARAM(emc_xm2cmd_pad_ctrl5);
+	CASE_SET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl2);
+	CASE_SET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl3);
+	CASE_SET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl4);
+	CASE_SET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl5);
+	CASE_SET_SDRAM_PARAM(emc_xm2dqs_pad_ctrl6);
+	CASE_SET_SDRAM_PARAM(emc_xm2dq_pad_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_xm2dq_pad_ctrl2);
+	CASE_SET_SDRAM_PARAM(emc_xm2dq_pad_ctrl3);
+	CASE_SET_SDRAM_PARAM(emc_xm2clk_pad_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_xm2clk_pad_ctrl2);
+	CASE_SET_SDRAM_PARAM(emc_xm2comp_pad_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_xm2vttgen_pad_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_xm2vttgen_pad_ctrl2);
+	CASE_SET_SDRAM_PARAM(emc_xm2vttgen_pad_ctrl3);
+	CASE_SET_SDRAM_PARAM(emc_acpd_control);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte_cfg);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte0);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte1);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte2);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte3);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte_cfg);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte0);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte1);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte2);
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte3);
+	CASE_SET_SDRAM_PARAM(emc_dsr_vttgen_drv);
+	CASE_SET_SDRAM_PARAM(emc_txdsrvttgen);
+	CASE_SET_SDRAM_PARAM(emc_bgbias_ctl0);
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg);
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_dev0);
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_dev1);
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask0);
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask1);
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask2);
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_bank_swizzle3);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_cfg);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_outstanding_req);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rcd);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rp);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rc);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_ras);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_faw);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rrd);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rap2pre);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_wap2pre);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_r2r);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_w2w);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_r2w);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_w2r);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_da_turns);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_da_covers);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_misc0);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_misc1);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_ring1_throttle);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_override);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_override1);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_rsv);
+	CASE_SET_SDRAM_PARAM(mc_clken_override);
+	CASE_SET_SDRAM_PARAM(mc_stat_control);
+	CASE_SET_SDRAM_PARAM(mc_display_snap_ring);
+	CASE_SET_SDRAM_PARAM(mc_video_protect_bom);
+	CASE_SET_SDRAM_PARAM(mc_video_protect_bom_adr_hi);
+	CASE_SET_SDRAM_PARAM(mc_video_protect_size_mb);
+	CASE_SET_SDRAM_PARAM(mc_video_protect_vpr_override);
+	CASE_SET_SDRAM_PARAM(mc_video_protect_vpr_override1);
+	CASE_SET_SDRAM_PARAM(mc_video_protect_gpu_override0);
+	CASE_SET_SDRAM_PARAM(mc_video_protect_gpu_override1);
+	CASE_SET_SDRAM_PARAM(mc_sec_carveout_bom);
+	CASE_SET_SDRAM_PARAM(mc_sec_carveout_adr_hi);
+	CASE_SET_SDRAM_PARAM(mc_sec_carveout_size_mb);
+	CASE_SET_SDRAM_PARAM(mc_video_protect_write_access);
+	CASE_SET_SDRAM_PARAM(mc_sec_carveout_protect_write_access);
+	CASE_SET_SDRAM_PARAM(emc_ca_training_enable);
+	CASE_SET_SDRAM_PARAM(emc_ca_training_timing_cntl1);
+	CASE_SET_SDRAM_PARAM(emc_ca_training_timing_cntl2);
+	CASE_SET_SDRAM_PARAM(swizzle_rank_byte_encode);
+	CASE_SET_SDRAM_PARAM(boot_rom_patch_control);
+	CASE_SET_SDRAM_PARAM(boot_rom_patch_data);
+	CASE_SET_SDRAM_PARAM(mc_mts_carveout_bom);
+	CASE_SET_SDRAM_PARAM(mc_mts_carveout_adr_hi);
+	CASE_SET_SDRAM_PARAM(mc_mts_carveout_size_mb);
+	CASE_SET_SDRAM_PARAM(mc_mts_carveout_reg_ctrl);
+
+	DEFAULT();
+	}
+	return 0;
+}
+
+int
+t124_getbl_param(u_int32_t set,
+		parse_token id,
+		u_int32_t *data,
+		u_int8_t *bct)
+{
+	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
+
+	if (set >= NVBOOT_MAX_BOOTLOADERS)
+		return -ENODATA;
+	if (data == NULL || bct == NULL)
+		return -ENODATA;
+
+	switch (id) {
+	CASE_GET_BL_PARAM(version);
+	CASE_GET_BL_PARAM(start_blk);
+	CASE_GET_BL_PARAM(start_page);
+	CASE_GET_BL_PARAM(length);
+	CASE_GET_BL_PARAM(load_addr);
+	CASE_GET_BL_PARAM(entry_point);
+	CASE_GET_BL_PARAM(attribute);
+
+	case token_bl_crypto_hash:
+		memcpy(data,
+		&(bct_ptr->bootloader[set].signature.crypto_hash),
+		sizeof(nvboot_hash));
+		break;
+
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+int
+t124_setbl_param(u_int32_t set,
+		parse_token id,
+		u_int32_t *data,
+		u_int8_t *bct)
+{
+	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
+
+	if (set >= NVBOOT_MAX_BOOTLOADERS)
+		return -ENODATA;
+	if (data == NULL || bct == NULL)
+		return -ENODATA;
+
+	switch (id) {
+	CASE_SET_BL_PARAM(version);
+	CASE_SET_BL_PARAM(start_blk);
+	CASE_SET_BL_PARAM(start_page);
+	CASE_SET_BL_PARAM(length);
+	CASE_SET_BL_PARAM(load_addr);
+	CASE_SET_BL_PARAM(entry_point);
+	CASE_SET_BL_PARAM(attribute);
+
+	case token_bl_crypto_hash:
+		memcpy(&(bct_ptr->bootloader[set].signature.crypto_hash),
+		data,
+		sizeof(nvboot_hash));
+		break;
+
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+int
+t124_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
+{
+	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
+	nvboot_config_table  samplebct; /* Used for computing offsets. */
+
+	/*
+	 * Note: Not all queries require use of the BCT, so testing for a
+	 *       valid BCT is distributed within the code.
+	 */
+	if (data == NULL)
+		return -ENODATA;
+
+	switch (id) {
+	/*
+	 * Simple BCT fields
+	 */
+	CASE_GET_NVU32(boot_data_version);
+	CASE_GET_NVU32(block_size_log2);
+	CASE_GET_NVU32(page_size_log2);
+	CASE_GET_NVU32(partition_size);
+	CASE_GET_NVU32(num_param_sets);
+	CASE_GET_NVU32(num_sdram_sets);
+	CASE_GET_NVU32(bootloader_used);
+	CASE_GET_NVU32(odm_data);
+
+	/*
+	 * Constants.
+	 */
+
+	CASE_GET_CONST(bootloaders_max,   NVBOOT_MAX_BOOTLOADERS);
+	CASE_GET_CONST(reserved_size,     NVBOOT_BCT_RESERVED_SIZE);
+
+	case token_crypto_hash:
+		memcpy(data,
+		&(bct_ptr->signature.crypto_hash),
+		sizeof(nvboot_hash));
+		break;
+
+	case token_reserved_offset:
+		*data = (u_int8_t *)&(samplebct.reserved)
+				- (u_int8_t *)&samplebct;
+		break;
+
+	case token_bct_size:
+		*data = sizeof(nvboot_config_table);
+		break;
+
+	CASE_GET_CONST(hash_size, sizeof(nvboot_hash));
+
+	case token_crypto_offset:
+		/* Offset to region in BCT to encrypt & sign */
+		*data = (u_int8_t *)&(samplebct.random_aes_blk)
+				- (u_int8_t *)&samplebct;
+		break;
+
+	case token_crypto_length:
+		/* size of region in BCT to encrypt & sign */
+		*data = (u_int8_t *)bct_ptr + sizeof(nvboot_config_table)
+				- (u_int8_t *)&(bct_ptr->random_aes_blk);
+		break;
+
+	CASE_GET_CONST(max_bct_search_blks, NVBOOT_MAX_BCT_SEARCH_BLOCKS);
+
+	CASE_GET_CONST_PREFIX(dev_type_sdmmc, nvboot);
+	CASE_GET_CONST_PREFIX(dev_type_spi, nvboot);
+	CASE_GET_CONST_PREFIX(sdmmc_data_width_4bit, nvboot);
+	CASE_GET_CONST_PREFIX(sdmmc_data_width_8bit, nvboot);
+	CASE_GET_CONST_PREFIX(spi_clock_source_pllp_out0, nvboot);
+	CASE_GET_CONST_PREFIX(spi_clock_source_clockm, nvboot);
+
+	CASE_GET_CONST_PREFIX(memory_type_none, nvboot);
+	CASE_GET_CONST_PREFIX(memory_type_ddr, nvboot);
+	CASE_GET_CONST_PREFIX(memory_type_lpddr, nvboot);
+	CASE_GET_CONST_PREFIX(memory_type_ddr2, nvboot);
+	CASE_GET_CONST_PREFIX(memory_type_lpddr2, nvboot);
+	CASE_GET_CONST_PREFIX(memory_type_ddr3, nvboot);
+
+	default:
+		return -ENODATA;
+	}
+	return 0;
+}
+
+int
+t124_bct_set_value(parse_token id, u_int32_t data, u_int8_t *bct)
+{
+	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
+
+	if (bct == NULL)
+		return -ENODATA;
+
+	switch (id) {
+	/*
+	 * Simple BCT fields
+	 */
+	CASE_SET_NVU32(boot_data_version);
+	CASE_SET_NVU32(block_size_log2);
+	CASE_SET_NVU32(page_size_log2);
+	CASE_SET_NVU32(partition_size);
+	CASE_SET_NVU32(num_param_sets);
+	CASE_SET_NVU32(num_sdram_sets);
+	CASE_SET_NVU32(bootloader_used);
+	CASE_SET_NVU32(odm_data);
+
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+int
+t124_bct_set_data(parse_token id,
+	u_int8_t *data,
+	u_int32_t length,
+	u_int8_t *bct)
+{
+	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
+
+	if (data == NULL || bct == NULL)
+		return -ENODATA;
+
+	switch (id) {
+
+	case token_crypto_hash:
+		if (length < sizeof(nvboot_hash))
+			return -ENODATA;
+		memcpy(&bct_ptr->signature.crypto_hash, data, sizeof(nvboot_hash));
+		break;
+
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+void t124_init_bad_block_table(build_image_context *context)
+{
+	u_int32_t bytes_per_entry;
+	nvboot_badblock_table *table;
+	nvboot_config_table *bct;
+
+	bct = (nvboot_config_table *)(context->bct);
+
+	assert(context != NULL);
+	assert(bct != NULL);
+
+	table = &bct->badblock_table;
+
+	bytes_per_entry = ICEIL(context->partition_size,
+				NVBOOT_BAD_BLOCK_TABLE_SIZE);
+	table->block_size_log2 = context->block_size_log2;
+	table->virtual_blk_size_log2 = NV_MAX(ceil_log2(bytes_per_entry),
+					table->block_size_log2);
+	table->entries_used = iceil_log2(context->partition_size,
+					table->virtual_blk_size_log2);
+}
+
+cbootimage_soc_config tegra124_config = {
+	.init_bad_block_table		= t124_init_bad_block_table,
+	.set_dev_param				= t124_set_dev_param,
+	.get_dev_param				= t124_get_dev_param,
+	.set_sdram_param			= t124_set_sdram_param,
+	.get_sdram_param			= t124_get_sdram_param,
+	.setbl_param				= t124_setbl_param,
+	.getbl_param				= t124_getbl_param,
+	.set_value					= t124_bct_set_value,
+	.get_value					= t124_bct_get_value,
+	.set_data					= t124_bct_set_data,
+
+	.devtype_table				= s_devtype_table_t124,
+	.sdmmc_data_width_table		= s_sdmmc_data_width_table_t124,
+	.spi_clock_source_table		= s_spi_clock_source_table_t124,
+	.nvboot_memory_type_table	= s_nvboot_memory_type_table_t124,
+	.sdram_field_table			= s_sdram_field_table_t124,
+	.nand_table					= 0,
+	.sdmmc_table				= s_sdmmc_table_t124,
+	.spiflash_table				= s_spiflash_table_t124,
+	.device_type_table			= s_device_type_table_t124,
+};
+
+void t124_get_soc_config(build_image_context *context,
+	cbootimage_soc_config **soc_config)
+{
+	context->boot_data_version = BOOTDATA_VERSION_T124;
+	*soc_config = &tegra124_config;
+}
+
+int if_bct_is_t124_get_soc_config(build_image_context *context,
+	cbootimage_soc_config **soc_config)
+{
+	nvboot_config_table *bct = (nvboot_config_table *) context->bct;
+
+	if (bct->boot_data_version == BOOTDATA_VERSION_T124) {
+		t124_get_soc_config(context, soc_config);
+		return 1;
+	}
+	return 0;
+}
diff --git a/src/t124/nvboot_bct_t124.h b/src/t124/nvboot_bct_t124.h
new file mode 100644
index 0000000..8f4b966
--- /dev/null
+++ b/src/t124/nvboot_bct_t124.h
@@ -0,0 +1,359 @@
+/*
+ * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ */
+
+#ifndef INCLUDED_NVBOOT_BCT_T124_H
+#define INCLUDED_NVBOOT_BCT_T124_H
+
+#include <sys/types.h>
+#include "nvboot_sdram_param_t124.h"
+
+/**
+ * Defines the number of 32-bit words in the customer_data area of the BCT.
+ */
+#define NVBOOT_BCT_CUSTOMER_DATA_WORDS		162
+
+/**
+ * Defines the number of bytes in the customer_data area of the BCT.
+ */
+#define NVBOOT_BCT_CUSTOMER_DATA_SIZE \
+		(NVBOOT_BCT_CUSTOMER_DATA_WORDS * 4)
+
+/**
+ * Defines the number of bytes in the reserved area of the BCT.
+ */
+#define NVBOOT_BCT_RESERVED_SIZE		2
+
+/**
+ * Defines the maximum number of bootloader descriptions in the BCT.
+ */
+#define NVBOOT_MAX_BOOTLOADERS			4
+
+/**
+ * Defines the maximum number of device parameter sets in the BCT.
+ * The value must be equal to (1 << # of device straps)
+ */
+#define NVBOOT_BCT_MAX_PARAM_SETS		4
+
+/**
+ * Defines the maximum number of SDRAM parameter sets in the BCT.
+ * The value must be equal to (1 << # of SDRAM straps)
+ */
+#define NVBOOT_BCT_MAX_SDRAM_SETS		4
+
+/**
+ * Defines the number of entries (bits) in the bad block table.
+ * The consequences of changing its value are as follows.  Using P as the
+ * # of physical blocks in the boot loader and B as the value of this
+ * constant:
+ *    B > P: There will be unused storage in the bad block table.
+ *    B < P: The virtual block size will be greater than the physical block
+ *           size, so the granularity of the bad block table will be less than
+ *           one bit per physical block.
+ *
+ * 4096 bits is enough to represent an 8MiB partition of 2KiB blocks with one
+ * bit per block (1 virtual block = 1 physical block).  This occupies 512 bytes
+ * of storage.
+ */
+#define NVBOOT_BAD_BLOCK_TABLE_SIZE		4096
+
+/**
+ * Defines the amount of padding needed to pad the bad block table to a
+ * multiple of AES block size.
+ */
+#define NVBOOT_BAD_BLOCK_TABLE_PADDING	10
+
+/**
+ * Defines the maximum number of blocks to search for BCTs.
+ *
+ * This value covers the initial block and a set of journal blocks.
+ *
+ * Ideally, this number will span several erase units for reliable updates
+ * and tolerance for blocks to become bad with use.  Safe updates require
+ * a minimum of 2 erase units in which BCTs can appear.
+ *
+ * To ensure that the BCT search spans a sufficient range of configurations,
+ * the search block count has been set to 64. This allows for redundancy with
+ * a wide range of parts and provides room for greater problems in this
+ * region of the device.
+ */
+#define NVBOOT_MAX_BCT_SEARCH_BLOCKS	64
+
+#define ARSE_RSA_MAX_MODULUS_SIZE		2048
+
+/**
+ * Defines the RSA modulus length in bits and bytes used for PKC secure boot.
+ */
+enum {NVBOOT_SE_RSA_MODULUS_LENGTH_BITS = ARSE_RSA_MAX_MODULUS_SIZE};
+
+/*
+ * Defines the CMAC-AES-128 hash length in 32 bit words. (128 bits = 4 words)
+ */
+enum {NVBOOT_CMAC_AES_HASH_LENGTH = 4};
+
+/**
+ * Defines the storage for a hash value (128 bits).
+ */
+typedef struct nvboot_hash_rec {
+	u_int32_t hash[NVBOOT_CMAC_AES_HASH_LENGTH];
+} nvboot_hash;
+
+/*
+ *  Defines the storage for the RSA public key's modulus
+ *  in the BCT
+ */
+typedef struct nvboot_rsa_key_modulus_rec {
+	/* The modulus size is 2048-bits. */
+	u_int32_t modulus[NVBOOT_SE_RSA_MODULUS_LENGTH_BITS / 8 / 4];
+} nvboot_rsa_key_modulus;
+
+typedef struct nvboot_rsa_pss_sig_rec {
+	/*
+	 * The RSA-PSS signature length is equal to the
+	 * length in octets of the RSA modulus.
+	 * In our case, it's 2048-bits.
+	 */
+	u_int32_t signature[NVBOOT_SE_RSA_MODULUS_LENGTH_BITS / 8 / 4];
+} nvboot_rsa_pss_sig;
+
+typedef struct nvboot_object_signature_rec {
+	/*
+	 * Specifies the AES-CMAC signature for the rest of the BCT structure if symmetric key
+	 * encryption secure boot scheme is used.
+	 */
+	nvboot_hash crypto_hash;
+
+	/*
+	 * Specifies the RSASSA-PSS signature for the rest of the BCT structure if public
+	 * key cryptography secure boot scheme is used.
+	 */
+	nvboot_rsa_pss_sig rsa_pss_sig;
+} nvboot_object_signature;
+
+typedef struct nvboot_ecid_rec {
+	u_int32_t	ecid_0;
+	u_int32_t	ecid_1;
+	u_int32_t	ecid_2;
+	u_int32_t	ecid_3;
+} nvboot_ecid;
+
+/* Defines various data widths supported. */
+typedef enum {
+	/**
+	 * Specifies a 1 bit interface to eMMC.
+	 * Note that 1-bit data width is only for the driver's internal use.
+	 * Fuses doesn't provide option to select 1-bit data width.
+	 * The driver selects 1-bit internally based on need.
+	 * It is used for reading Extended CSD and when the power class
+	 * requirements of a card for 4-bit or 8-bit transfers are not
+	 * supported by the target board.
+	 */
+	nvboot_sdmmc_data_width_1bit = 0,
+
+	/* Specifies a 4 bit interface to eMMC. */
+	nvboot_sdmmc_data_width_4bit = 1,
+
+	/* Specifies a 8 bit interface to eMMC. */
+	nvboot_sdmmc_data_width_8bit = 2,
+	/* Specifies a 4 bit Ddr interface to eMMC. */
+	nvboot_sdmmc_data_width_ddr_4bit = 5,
+	/* Specifies a 8 bit Ddr interface to eMMC. */
+	nvboot_sdmmc_data_width_ddr_8bit = 6,
+
+	nvboot_sdmmc_data_width_num,
+	nvboot_sdmmc_data_width_force32 = 0x7FFFFFFF
+} nvboot_sdmmc_data_width;
+
+/* Defines the parameters that can be changed after BCT is read. */
+typedef struct nvboot_sdmmc_params_rec {
+	/**
+	 * Specifies the clock divider for the SDMMC controller's clock source,
+	 * which is PLLP running at 216MHz.  If it is set to 9, then the SDMMC
+	 * controller runs at 216/9 = 24MHz.
+	 */
+	u_int8_t clock_divider;
+
+	/* Specifies the data bus width. Supported data widths are 4/8 bits. */
+	nvboot_sdmmc_data_width data_width;
+
+	/**
+	 * Max Power class supported by the target board.
+	 * The driver determines the best data width and clock frequency
+	 * supported within the power class range (0 to Max) if the selected
+	 * data width cannot be used at the chosen clock frequency.
+	 */
+	u_int8_t max_power_class_supported;
+
+	/* Specifies the max page size supported by driver */
+	u_int8_t multi_page_support;
+} nvboot_sdmmc_params;
+
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
+/**
+* Defines the union of the parameters required by each device.
+*/
+typedef union {
+	u_int8_t size[64];
+	/* Specifies optimized parameters for eMMC and eSD */
+	nvboot_sdmmc_params sdmmc_params;
+	/* Specifies optimized parameters for SPI NOR */
+	nvboot_spiflash_params spiflash_params;
+} nvboot_dev_params;
+
+/**
+ * Identifies the types of devices from which the system booted.
+ * Used to identify primary and secondary boot devices.
+ * @note These no longer match the fuse API device values (for
+ * backward compatibility with AP15).
+ */
+typedef enum {
+	/* Specifies a default (unset) value. */
+	nvboot_dev_type_none = 0,
+
+	/* Specifies SPI NOR. */
+	nvboot_dev_type_spi = 3,
+
+	/* Specifies SDMMC (either eMMC or eSD). */
+	nvboot_dev_type_sdmmc = 4,
+
+	nvboot_dev_type_max,
+
+	/* Ignore -- Forces compilers to make 32-bit enums. */
+	nvboot_dev_type_force32 = 0x7FFFFFFF
+} nvboot_dev_type;
+
+/**
+ * Stores information needed to locate and verify a boot loader.
+ *
+ * There is one \c nv_bootloader_info structure for each copy of a BL stored on
+ * the device.
+ */
+typedef struct nv_bootloader_info_rec {
+	u_int32_t version;
+	u_int32_t start_blk;
+	u_int32_t start_page;
+	u_int32_t length;
+	u_int32_t load_addr;
+	u_int32_t entry_point;
+	u_int32_t attribute;
+
+	/* Specifies the AES-CMAC MAC or RSASSA-PSS signature of the BL. */
+	nvboot_object_signature signature;
+} nv_bootloader_info;
+
+/**
+ * Defines the bad block table structure stored in the BCT.
+ */
+typedef struct nvboot_badblock_table_rec {
+	u_int32_t entries_used;
+	u_int8_t virtual_blk_size_log2;
+	u_int8_t block_size_log2;
+	u_int8_t bad_blks[NVBOOT_BAD_BLOCK_TABLE_SIZE / 8];
+	/*
+	 * Add a reserved field as padding to make the bad block table structure
+	 * a multiple of 16 bytes (AES block size).
+	 */
+	u_int8_t reserved[NVBOOT_BAD_BLOCK_TABLE_PADDING];
+} nvboot_badblock_table;
+
+/**
+ * Contains the information needed to load BLs from the secondary boot device.
+ *
+ * - Supplying NumParamSets = 0 indicates not to load any of them.
+ * - Supplying NumDramSets  = 0 indicates not to load any of them.
+ * - The \c random_aes_blk member exists to increase the difficulty of
+ *   key attacks based on knowledge of this structure.
+ */
+typedef struct nvboot_config_table_rec {
+	nvboot_badblock_table badblock_table;
+	nvboot_rsa_key_modulus key;
+	nvboot_object_signature signature;
+	u_int8_t customer_data[NVBOOT_BCT_CUSTOMER_DATA_SIZE];
+	u_int32_t odm_data;
+	u_int32_t reserved1;
+
+	/* START OF SIGNED SECTION OF THE BCT */
+	nvboot_hash random_aes_blk;
+	nvboot_ecid unique_chip_id;
+	u_int32_t boot_data_version;
+	u_int32_t block_size_log2;
+	u_int32_t page_size_log2;
+	u_int32_t partition_size;
+	u_int32_t num_param_sets;
+	nvboot_dev_type dev_type[NVBOOT_BCT_MAX_PARAM_SETS];
+	nvboot_dev_params dev_params[NVBOOT_BCT_MAX_PARAM_SETS];
+	u_int32_t num_sdram_sets;
+	nvboot_sdram_params sdram_params[NVBOOT_BCT_MAX_SDRAM_SETS];
+
+	u_int32_t bootloader_used;
+	nv_bootloader_info bootloader[NVBOOT_MAX_BOOTLOADERS];
+
+	u_int8_t enable_fail_back;
+
+	/*
+	 * Specify whether or not to enable JTAG access when the JTAG disable fuse
+	 * has not been burned.
+	 * SecureJtagControl = NV_FALSE (0) = Disable JTAG access.
+	 * SecureJtagControl = NV_TRUE (1) = Enable JTAG access.
+	 */
+	u_int8_t secure_jtag_control;
+	u_int8_t reserved[NVBOOT_BCT_RESERVED_SIZE];
+} nvboot_config_table;
+#endif /* #ifndef INCLUDED_NVBOOT_BCT_T124_H */
diff --git a/src/t124/nvboot_sdram_param_t124.h b/src/t124/nvboot_sdram_param_t124.h
new file mode 100644
index 0000000..34f537e
--- /dev/null
+++ b/src/t124/nvboot_sdram_param_t124.h
@@ -0,0 +1,803 @@
+/*
+ * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ */
+
+/**
+ * Defines the SDRAM parameter structure.
+ *
+ * Note that PLLM is used by EMC.
+ */
+
+#ifndef INCLUDED_NVBOOT_SDRAM_PARAM_T124_H
+#define INCLUDED_NVBOOT_SDRAM_PARAM_T124_H
+
+#define NVBOOT_BCT_SDRAM_ARB_CONFIG_WORDS 27
+
+typedef enum {
+	/* Specifies the memory type to be undefined */
+	nvboot_memory_type_none = 0,
+
+	/* Specifies the memory type to be DDR SDRAM */
+	nvboot_memory_type_ddr = 0,
+
+	/* Specifies the memory type to be LPDDR SDRAM */
+	nvboot_memory_type_lpddr = 0,
+
+	/* Specifies the memory type to be DDR2 SDRAM */
+	nvboot_memory_type_ddr2 = 0,
+
+	/* Specifies the memory type to be LPDDR2 SDRAM */
+	nvboot_memory_type_lpddr2,
+
+	/* Specifies the memory type to be DDR3 SDRAM */
+	nvboot_memory_type_ddr3,
+
+	nvboot_memory_type_num,
+	nvboot_memory_type_force32 = 0x7FFFFFF
+} nvboot_memory_type;
+
+/**
+ * Defines the SDRAM parameter structure
+ */
+typedef struct nvboot_sdram_params_rec {
+	/* sdram data structure generated by tool warmboot_code_gen */
+
+	/* Specifies the type of memory device */
+	nvboot_memory_type memory_type;
+
+	/* MC/EMC clock source configuration */
+
+	/* Specifies the M value for PllM */
+	u_int32_t pllm_input_divider;
+	/* Specifies the N value for PllM */
+	u_int32_t pllm_feedback_divider;
+	/* Specifies the time to wait for PLLM to lock (in microseconds) */
+	u_int32_t pllm_stable_time;
+	/* Specifies misc. control bits */
+	u_int32_t pllm_setup_control;
+	/* Enables the Div by 2 */
+	u_int32_t pllm_select_div2;
+	/* Powers down VCO output Level shifter */
+	u_int32_t pllm_pdlshift_ph45;
+	/* Powers down VCO output Level shifter */
+	u_int32_t pllm_pdlshift_ph90;
+	/* Powers down VCO output Level shifter */
+	u_int32_t pllm_pdlshift_ph135;
+	/* Specifies value for Charge Pump Gain Control */
+	u_int32_t pllm_kcp;
+	/* Specifies VCO gain */
+	u_int32_t pllm_kvco;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare0;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare1;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare2;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare3;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare4;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare5;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare6;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare7;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare8;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare9;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare10;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare11;
+	/* Defines EMC_2X_CLK_SRC, EMC_2X_CLK_DIVISOR, EMC_INVERT_DCD */
+	u_int32_t emc_clock_source;
+
+	/* Auto-calibration of EMC pads */
+
+	/* Specifies the value for EMC_AUTO_CAL_INTERVAL */
+	u_int32_t emc_auto_cal_interval;
+	/*
+	 * Specifies the value for EMC_AUTO_CAL_CONFIG
+	 * Note: Trigger bits are set by the SDRAM code.
+	 */
+	u_int32_t emc_auto_cal_config;
+
+	/* Specifies the value for EMC_AUTO_CAL_CONFIG2 */
+	u_int32_t emc_auto_cal_config2;
+
+	/* Specifies the value for EMC_AUTO_CAL_CONFIG3 */
+	u_int32_t emc_auto_cal_config3;
+
+	/*
+	 * Specifies the time for the calibration
+	 * to stabilize (in microseconds)
+	 */
+	u_int32_t emc_auto_cal_wait;
+
+	/*
+	 * DRAM size information
+	 * Specifies the value for EMC_ADR_CFG
+	 */
+	u_int32_t emc_adr_cfg;
+
+	/*
+	 * Specifies the time to wait after asserting pin
+	 * CKE (in microseconds)
+	 */
+	u_int32_t emc_pin_program_wait;
+	/* Specifies the extra delay before/after pin RESET/CKE command */
+	u_int32_t emc_pin_extra_wait;
+	/*
+	 * Specifies the extra delay after the first writing
+	 * of EMC_TIMING_CONTROL
+	 */
+	u_int32_t emc_timing_control_wait;
+
+	/* Timing parameters required for the SDRAM */
+
+	/* Specifies the value for EMC_RC */
+	u_int32_t emc_rc;
+	/* Specifies the value for EMC_RFC */
+	u_int32_t emc_rfc;
+	/* Specifies the value for EMC_RFC_SLR */
+	u_int32_t emc_rfc_slr;
+	/* Specifies the value for EMC_RAS */
+	u_int32_t emc_ras;
+	/* Specifies the value for EMC_RP */
+	u_int32_t emc_rp;
+	/* Specifies the value for EMC_R2R */
+	u_int32_t emc_r2r;
+	/* Specifies the value for EMC_W2W */
+	u_int32_t emc_w2w;
+	/* Specifies the value for EMC_R2W */
+	u_int32_t emc_r2w;
+	/* Specifies the value for EMC_W2R */
+	u_int32_t emc_w2r;
+	/* Specifies the value for EMC_R2P */
+	u_int32_t emc_r2p;
+	/* Specifies the value for EMC_W2P */
+	u_int32_t emc_w2p;
+	/* Specifies the value for EMC_RD_RCD */
+	u_int32_t emc_rd_rcd;
+	/* Specifies the value for EMC_WR_RCD */
+	u_int32_t emc_wr_rcd;
+	/* Specifies the value for EMC_RRD */
+	u_int32_t emc_rrd;
+	/* Specifies the value for EMC_REXT */
+	u_int32_t emc_rext;
+	/* Specifies the value for EMC_WEXT */
+	u_int32_t emc_wext;
+	/* Specifies the value for EMC_WDV */
+	u_int32_t emc_wdv;
+	/* Specifies the value for EMC_WDV_MASK */
+	u_int32_t emc_wdv_mask;
+	/* Specifies the value for EMC_QUSE */
+	u_int32_t emc_quse;
+	/* Specifies the value for EMC_QUSE_WIDTH */
+	u_int32_t emc_quse_width;
+	/* Specifies the value for EMC_IBDLY */
+	u_int32_t emc_ibdly;
+	/* Specifies the value for EMC_EINPUT */
+	u_int32_t emc_einput;
+	/* Specifies the value for EMC_EINPUT_DURATION */
+	u_int32_t emc_einput_duration;
+	/* Specifies the value for EMC_PUTERM_EXTRA */
+	u_int32_t emc_puterm_extra;
+	/* Specifies the value for EMC_PUTERM_WIDTH */
+	u_int32_t emc_puterm_width;
+	/* Specifies the value for EMC_PUTERM_ADJ */
+	u_int32_t emc_puterm_adj;
+	/* Specifies the value for EMC_CDB_CNTL_1 */
+	u_int32_t emc_cdb_cntl1;
+	/* Specifies the value for EMC_CDB_CNTL_2 */
+	u_int32_t emc_cdb_cntl2;
+	/* Specifies the value for EMC_CDB_CNTL_3 */
+	u_int32_t emc_cdb_cntl3;
+	/* Specifies the value for EMC_QRST */
+	u_int32_t emc_qrst;
+	/* Specifies the value for EMC_QSAFE */
+	u_int32_t emc_qsafe;
+	/* Specifies the value for EMC_RDV */
+	u_int32_t emc_rdv;
+	/* Specifies the value for EMC_RDV_MASK */
+	u_int32_t emc_rdv_mask;
+	/* Specifies the value for EMC_QPOP */
+	u_int32_t emc_qpop;
+	/* Specifies the value for EMC_CTT */
+	u_int32_t emc_ctt;
+	/* Specifies the value for EMC_CTT_DURATION */
+	u_int32_t emc_ctt_duration;
+	/* Specifies the value for EMC_REFRESH */
+	u_int32_t emc_refresh;
+	/* Specifies the value for EMC_BURST_REFRESH_NUM */
+	u_int32_t emc_burst_refresh_num;
+	/* Specifies the value for EMC_PRE_REFRESH_REQ_CNT */
+	u_int32_t emc_prerefresh_req_cnt;
+	/* Specifies the value for EMC_PDEX2WR */
+	u_int32_t emc_pdex2wr;
+	/* Specifies the value for EMC_PDEX2RD */
+	u_int32_t emc_pdex2rd;
+	/* Specifies the value for EMC_PCHG2PDEN */
+	u_int32_t emc_pchg2pden;
+	/* Specifies the value for EMC_ACT2PDEN */
+	u_int32_t emc_act2pden;
+	/* Specifies the value for EMC_AR2PDEN */
+	u_int32_t emc_ar2pden;
+	/* Specifies the value for EMC_RW2PDEN */
+	u_int32_t emc_rw2pden;
+	/* Specifies the value for EMC_TXSR */
+	u_int32_t emc_txsr;
+	/* Specifies the value for EMC_TXSRDLL */
+	u_int32_t emc_txsr_dll;
+	/* Specifies the value for EMC_TCKE */
+	u_int32_t emc_tcke;
+	/* Specifies the value for EMC_TCKESR */
+	u_int32_t emc_tckesr;
+	/* Specifies the value for EMC_TPD */
+	u_int32_t emc_tpd;
+	/* Specifies the value for EMC_TFAW */
+	u_int32_t emc_tfaw;
+	/* Specifies the value for EMC_TRPAB */
+	u_int32_t emc_trpab;
+	/* Specifies the value for EMC_TCLKSTABLE */
+	u_int32_t emc_tclkstable;
+	/* Specifies the value for EMC_TCLKSTOP */
+	u_int32_t emc_tclkstop;
+	/* Specifies the value for EMC_TREFBW */
+	u_int32_t emc_trefbw;
+
+	/* FBIO configuration values */
+
+	/* Specifies the value for EMC_FBIO_CFG5 */
+	u_int32_t emc_fbio_cfg5;
+	/* Specifies the value for EMC_FBIO_CFG6 */
+	u_int32_t emc_fbio_cfg6;
+	/* Specifies the value for EMC_FBIO_SPARE */
+	u_int32_t emc_fbio_spare;
+
+	/* Specifies the value for EMC_CFG_RSV */
+	u_int32_t emc_cfg_rsv;
+
+	/* MRS command values */
+
+	/* Specifies the value for EMC_MRS */
+	u_int32_t emc_mrs;
+	/* Specifies the MP0 command to initialize mode registers */
+	u_int32_t emc_emrs;
+	/* Specifies the MP2 command to initialize mode registers */
+	u_int32_t emc_emrs2;
+	/* Specifies the MP3 command to initialize mode registers */
+	u_int32_t emc_emrs3;
+	/* Specifies the programming to LPDDR2 Mode Register 1 at cold boot */
+	u_int32_t emc_mrw1;
+	/* Specifies the programming to LPDDR2 Mode Register 2 at cold boot */
+	u_int32_t emc_mrw2;
+	/* Specifies the programming to LPDDR2 Mode Register 3 at cold boot */
+	u_int32_t emc_mrw3;
+	/* Specifies the programming to LPDDR2 Mode Register 11 at cold boot */
+	u_int32_t emc_mrw4;
+	/*
+	 * Specifies the programming to extra LPDDR2 Mode Register
+	 * at cold boot
+	 */
+	u_int32_t emc_mrw_extra;
+	/*
+	 * Specifies the programming to extra LPDDR2 Mode Register
+	 * at warm boot
+	 */
+	u_int32_t emc_warm_boot_mrw_extra;
+	/*
+	 * Specify the enable of extra Mode Register programming at
+	 * warm boot
+	 */
+	u_int32_t emc_warm_boot_extramode_reg_write_enable;
+	/*
+	 * Specify the enable of extra Mode Register programming at
+	 * cold boot
+	 */
+	u_int32_t emc_extramode_reg_write_enable;
+
+	/* Specifies the EMC_MRW reset command value */
+	u_int32_t emc_mrw_reset_command;
+	/* Specifies the EMC Reset wait time (in microseconds) */
+	u_int32_t emc_mrw_reset_ninit_wait;
+	/* Specifies the value for EMC_MRS_WAIT_CNT */
+	u_int32_t emc_mrs_wait_cnt;
+	/* Specifies the value for EMC_MRS_WAIT_CNT2 */
+	u_int32_t emc_mrs_wait_cnt2;
+
+	/* EMC miscellaneous configurations */
+
+	/* Specifies the value for EMC_CFG */
+	u_int32_t emc_cfg;
+	/* Specifies the value for EMC_CFG_2 */
+	u_int32_t emc_cfg2;
+	/* Specifies the pipe bypass controls */
+	u_int32_t emc_cfg_pipe;
+	/* Specifies the value for EMC_DBG */
+	u_int32_t emc_dbg;
+	/* Specifies the value for EMC_CMDQ */
+	u_int32_t emc_cmd_q;
+	/* Specifies the value for EMC_MC2EMCQ */
+	u_int32_t emc_mc2emc_q;
+	/* Specifies the value for EMC_DYN_SELF_REF_CONTROL */
+	u_int32_t emc_dyn_self_ref_control;
+
+	/* Specifies the value for MEM_INIT_DONE */
+	u_int32_t ahb_arbitration_xbar_ctrl_meminit_done;
+
+	/* Specifies the value for EMC_CFG_DIG_DLL */
+	u_int32_t emc_cfg_dig_dll;
+	/* Specifies the value for EMC_CFG_DIG_DLL_PERIOD */
+	u_int32_t emc_cfg_dig_dll_period;
+	/* Specifies the value of *DEV_SELECTN of various EMC registers */
+	u_int32_t emc_dev_select;
+
+	/* Specifies the value for EMC_SEL_DPD_CTRL */
+	u_int32_t emc_sel_dpd_ctrl;
+
+	/* Pads trimmer delays */
+
+	/* Specifies the value for EMC_DLL_XFORM_DQS0 */
+	u_int32_t emc_dll_xform_dqs0;
+	/* Specifies the value for EMC_DLL_XFORM_DQS1 */
+	u_int32_t emc_dll_xform_dqs1;
+	/* Specifies the value for EMC_DLL_XFORM_DQS2 */
+	u_int32_t emc_dll_xform_dqs2;
+	/* Specifies the value for EMC_DLL_XFORM_DQS3 */
+	u_int32_t emc_dll_xform_dqs3;
+	/* Specifies the value for EMC_DLL_XFORM_DQS4 */
+	u_int32_t emc_dll_xform_dqs4;
+	/* Specifies the value for EMC_DLL_XFORM_DQS5 */
+	u_int32_t emc_dll_xform_dqs5;
+	/* Specifies the value for EMC_DLL_XFORM_DQS6 */
+	u_int32_t emc_dll_xform_dqs6;
+	/* Specifies the value for EMC_DLL_XFORM_DQS7 */
+	u_int32_t emc_dll_xform_dqs7;
+	/* Specifies the value for EMC_DLL_XFORM_DQS8 */
+	u_int32_t emc_dll_xform_dqs8;
+	/* Specifies the value for EMC_DLL_XFORM_DQS9 */
+	u_int32_t emc_dll_xform_dqs9;
+	/* Specifies the value for EMC_DLL_XFORM_DQS10 */
+	u_int32_t emc_dll_xform_dqs10;
+	/* Specifies the value for EMC_DLL_XFORM_DQS11 */
+	u_int32_t emc_dll_xform_dqs11;
+	/* Specifies the value for EMC_DLL_XFORM_DQS12 */
+	u_int32_t emc_dll_xform_dqs12;
+	/* Specifies the value for EMC_DLL_XFORM_DQS13 */
+	u_int32_t emc_dll_xform_dqs13;
+	/* Specifies the value for EMC_DLL_XFORM_DQS14 */
+	u_int32_t emc_dll_xform_dqs14;
+	/* Specifies the value for EMC_DLL_XFORM_DQS15 */
+	u_int32_t emc_dll_xform_dqs15;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE0 */
+	u_int32_t emc_dll_xform_quse0;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE1 */
+	u_int32_t emc_dll_xform_quse1;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE2 */
+	u_int32_t emc_dll_xform_quse2;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE3 */
+	u_int32_t emc_dll_xform_quse3;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE4 */
+	u_int32_t emc_dll_xform_quse4;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE5 */
+	u_int32_t emc_dll_xform_quse5;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE6 */
+	u_int32_t emc_dll_xform_quse6;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE7 */
+	u_int32_t emc_dll_xform_quse7;
+	/* Specifies the value for EMC_DLL_XFORM_ADDR0 */
+	u_int32_t emc_dll_xform_addr0;
+	/* Specifies the value for EMC_DLL_XFORM_ADDR1 */
+	u_int32_t emc_dll_xform_addr1;
+	/* Specifies the value for EMC_DLL_XFORM_ADDR2 */
+	u_int32_t emc_dll_xform_addr2;
+	/* Specifies the value for EMC_DLL_XFORM_ADDR3 */
+	u_int32_t emc_dll_xform_addr3;
+	/* Specifies the value for EMC_DLL_XFORM_ADDR4 */
+	u_int32_t emc_dll_xform_addr4;
+	/* Specifies the value for EMC_DLL_XFORM_ADDR5 */
+	u_int32_t emc_dll_xform_addr5;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE8 */
+	u_int32_t emc_dll_xform_quse8;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE9 */
+	u_int32_t emc_dll_xform_quse9;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE10 */
+	u_int32_t emc_dll_xform_quse10;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE11 */
+	u_int32_t emc_dll_xform_quse11;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE12 */
+	u_int32_t emc_dll_xform_quse12;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE13 */
+	u_int32_t emc_dll_xform_quse13;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE14 */
+	u_int32_t emc_dll_xform_quse14;
+	/* Specifies the value for EMC_DLL_XFORM_QUSE15 */
+	u_int32_t emc_dll_xform_quse15;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS0 */
+	u_int32_t emc_dli_trim_tx_dqs0;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS1 */
+	u_int32_t emc_dli_trim_tx_dqs1;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS2 */
+	u_int32_t emc_dli_trim_tx_dqs2;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS3 */
+	u_int32_t emc_dli_trim_tx_dqs3;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS4 */
+	u_int32_t emc_dli_trim_tx_dqs4;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS5 */
+	u_int32_t emc_dli_trim_tx_dqs5;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS6 */
+	u_int32_t emc_dli_trim_tx_dqs6;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS7 */
+	u_int32_t emc_dli_trim_tx_dqs7;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS8 */
+	u_int32_t emc_dli_trim_tx_dqs8;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS9 */
+	u_int32_t emc_dli_trim_tx_dqs9;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS10 */
+	u_int32_t emc_dli_trim_tx_dqs10;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS11 */
+	u_int32_t emc_dli_trim_tx_dqs11;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS12 */
+	u_int32_t emc_dli_trim_tx_dqs12;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS13 */
+	u_int32_t emc_dli_trim_tx_dqs13;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS14 */
+	u_int32_t emc_dli_trim_tx_dqs14;
+	/* Specifies the value for EMC_DLI_TRIM_TXDQS15 */
+	u_int32_t emc_dli_trim_tx_dqs15;
+	/* Specifies the value for EMC_DLL_XFORM_DQ0 */
+	u_int32_t emc_dll_xform_dq0;
+	/* Specifies the value for EMC_DLL_XFORM_DQ1 */
+	u_int32_t emc_dll_xform_dq1;
+	/* Specifies the value for EMC_DLL_XFORM_DQ2 */
+	u_int32_t emc_dll_xform_dq2;
+	/* Specifies the value for EMC_DLL_XFORM_DQ3 */
+	u_int32_t emc_dll_xform_dq3;
+	/* Specifies the value for EMC_DLL_XFORM_DQ4 */
+	u_int32_t emc_dll_xform_dq4;
+	/* Specifies the value for EMC_DLL_XFORM_DQ5 */
+	u_int32_t emc_dll_xform_dq5;
+	/* Specifies the value for EMC_DLL_XFORM_DQ6 */
+	u_int32_t emc_dll_xform_dq6;
+	/* Specifies the value for EMC_DLL_XFORM_DQ7 */
+	u_int32_t emc_dll_xform_dq7;
+
+	/*
+	 * Specifies the delay after asserting CKE pin during a WarmBoot0
+	 * sequence (in microseconds)
+	 */
+	u_int32_t warm_boot_wait;
+
+	/* Specifies the value for EMC_CTT_TERM_CTRL */
+	u_int32_t emc_ctt_term_ctrl;
+
+	/* Specifies the value for EMC_ODT_WRITE */
+	u_int32_t emc_odt_write;
+	/* Specifies the value for EMC_ODT_WRITE */
+	u_int32_t emc_odt_read;
+
+	/* Periodic ZQ calibration */
+
+	/*
+	 * Specifies the value for EMC_ZCAL_INTERVAL
+	 * Value 0 disables ZQ calibration
+	 */
+	u_int32_t emc_zcal_interval;
+	/* Specifies the value for EMC_ZCAL_WAIT_CNT */
+	u_int32_t emc_zcal_wait_cnt;
+	/* Specifies the value for EMC_ZCAL_MRW_CMD */
+	u_int32_t emc_zcal_mrw_cmd;
+
+	/* DRAM initialization sequence flow control */
+
+	/* Specifies the MRS command value for resetting DLL */
+	u_int32_t emc_mrs_reset_dll;
+	/* Specifies the command for ZQ initialization of device 0 */
+	u_int32_t emc_zcal_init_dev0;
+	/* Specifies the command for ZQ initialization of device 1 */
+	u_int32_t emc_zcal_init_dev1;
+	/*
+	 * Specifies the wait time after programming a ZQ initialization
+	 * command (in microseconds)
+	 */
+	u_int32_t emc_zcal_init_wait;
+	/*
+	 * Specifies the enable for ZQ calibration at cold boot [bit 0]
+	 * and warm boot [bit 1]
+	 */
+	u_int32_t emc_zcal_warm_cold_boot_enables;
+
+	/*
+	 * Specifies the MRW command to LPDDR2 for ZQ calibration
+	 * on warmboot
+	 */
+	/* Is issued to both devices separately */
+	u_int32_t emc_mrw_lpddr2zcal_warm_boot;
+	/*
+	 * Specifies the ZQ command to DDR3 for ZQ calibration on warmboot
+	 * Is issued to both devices separately
+	 */
+	u_int32_t emc_zqcal_ddr3_warm_boot;
+	/*
+	 * Specifies the wait time for ZQ calibration on warmboot
+	 * (in microseconds)
+	 */
+	u_int32_t emc_zcal_warm_boot_wait;
+	/*
+	 * Specifies the enable for DRAM Mode Register programming
+	 * at warm boot
+	 */
+	u_int32_t emc_mrs_warm_boot_enable;
+	/*
+	 * Specifies the wait time after sending an MRS DLL reset command
+	 * in microseconds)
+	 */
+	u_int32_t emc_mrs_reset_dll_wait;
+	/* Specifies the extra MRS command to initialize mode registers */
+	u_int32_t emc_mrs_extra;
+	/* Specifies the extra MRS command at warm boot */
+	u_int32_t emc_warm_boot_mrs_extra;
+	/* Specifies the EMRS command to enable the DDR2 DLL */
+	u_int32_t emc_emrs_ddr2_dll_enable;
+	/* Specifies the MRS command to reset the DDR2 DLL */
+	u_int32_t emc_mrs_ddr2_dll_reset;
+	/* Specifies the EMRS command to set OCD calibration */
+	u_int32_t emc_emrs_ddr2_ocd_calib;
+	/*
+	 * Specifies the wait between initializing DDR and setting OCD
+	 * calibration (in microseconds)
+	 */
+	u_int32_t emc_ddr2_wait;
+	/* Specifies the value for EMC_CLKEN_OVERRIDE */
+	u_int32_t emc_clken_override;
+	/* Specifies the value for MC_DIS_EXTRA_SNAP_LEVELS */
+	u_int32_t mc_dis_extra_snap_levels;
+	/*
+	 * Specifies LOG2 of the extra refresh numbers after booting
+	 * Program 0 to disable
+	 */
+	u_int32_t emc_extra_refresh_num;
+	/* Specifies the master override for all EMC clocks */
+	u_int32_t emc_clken_override_allwarm_boot;
+	/* Specifies the master override for all MC clocks */
+	u_int32_t mc_clken_override_allwarm_boot;
+	/* Specifies digital dll period, choosing between 4 to 64 ms */
+	u_int32_t emc_cfg_dig_dll_period_warm_boot;
+
+	/* Pad controls */
+
+	/* Specifies the value for PMC_VDDP_SEL */
+	u_int32_t pmc_vddp_sel;
+	/* Specifies the wait time after programming PMC_VDDP_SEL */
+	u_int32_t pmc_vddp_sel_wait;
+	/* Specifies the value for PMC_DDR_PWR */
+	u_int32_t pmc_ddr_pwr;
+	/* Specifies the value for PMC_DDR_CFG */
+	u_int32_t pmc_ddr_cfg;
+	/* Specifies the value for PMC_IO_DPD3_REQ */
+	u_int32_t pmc_io_dpd3_req;
+	/* Specifies the wait time after programming PMC_IO_DPD3_REQ */
+	u_int32_t pmc_io_dpd3_req_wait;
+	/* Specifies the value for PMC_REG_SHORT */
+	u_int32_t pmc_reg_short;
+	/* Specifies the value for PMC_NO_IOPOWER */
+	u_int32_t pmc_no_io_power;
+	/* Specifies the wait time after programming PMC_POR_DPD_CTRL */
+	u_int32_t pmc_por_dpd_ctrl_wait;
+	/* Specifies the value for EMC_XM2CMDPADCTRL */
+	u_int32_t emc_xm2cmd_pad_ctrl;
+	/* Specifies the value for EMC_XM2CMDPADCTRL2 */
+	u_int32_t emc_xm2cmd_pad_ctrl2;
+	/* Specifies the value for EMC_XM2CMDPADCTRL3 */
+	u_int32_t emc_xm2cmd_pad_ctrl3;
+	/* Specifies the value for EMC_XM2CMDPADCTRL4 */
+	u_int32_t emc_xm2cmd_pad_ctrl4;
+	/* Specifies the value for EMC_XM2CMDPADCTRL5 */
+	u_int32_t emc_xm2cmd_pad_ctrl5;
+	/* Specifies the value for EMC_XM2DQSPADCTRL */
+	u_int32_t emc_xm2dqs_pad_ctrl;
+	/* Specifies the value for EMC_XM2DQSPADCTRL2 */
+	u_int32_t emc_xm2dqs_pad_ctrl2;
+	/* Specifies the value for EMC_XM2DQSPADCTRL3 */
+	u_int32_t emc_xm2dqs_pad_ctrl3;
+	/* Specifies the value for EMC_XM2DQSPADCTRL4 */
+	u_int32_t emc_xm2dqs_pad_ctrl4;
+	/* Specifies the value for EMC_XM2DQSPADCTRL5 */
+	u_int32_t emc_xm2dqs_pad_ctrl5;
+	/* Specifies the value for EMC_XM2DQSPADCTRL6 */
+	u_int32_t emc_xm2dqs_pad_ctrl6;
+	/* Specifies the value for EMC_XM2DQPADCTRL */
+	u_int32_t emc_xm2dq_pad_ctrl;
+	/* Specifies the value for EMC_XM2DQPADCTRL2 */
+	u_int32_t emc_xm2dq_pad_ctrl2;
+	/* Specifies the value for EMC_XM2DQPADCTRL3 */
+	u_int32_t emc_xm2dq_pad_ctrl3;
+	/* Specifies the value for EMC_XM2CLKPADCTRL */
+	u_int32_t emc_xm2clk_pad_ctrl;
+	/* Specifies the value for EMC_XM2CLKPADCTRL2 */
+	u_int32_t emc_xm2clk_pad_ctrl2;
+	/* Specifies the value for EMC_XM2COMPPADCTRL */
+	u_int32_t emc_xm2comp_pad_ctrl;
+	/* Specifies the value for EMC_XM2VTTGENPADCTRL */
+	u_int32_t emc_xm2vttgen_pad_ctrl;
+	/* Specifies the value for EMC_XM2VTTGENPADCTRL2 */
+	u_int32_t emc_xm2vttgen_pad_ctrl2;
+	/* Specifies the value for EMC_XM2VTTGENPADCTRL3 */
+	u_int32_t emc_xm2vttgen_pad_ctrl3;
+	/* Specifies the value for EMC_ACPD_CONTROL */
+	u_int32_t emc_acpd_control;
+
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE_CFG */
+	u_int32_t emc_swizzle_rank0_byte_cfg;
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE0 */
+	u_int32_t emc_swizzle_rank0_byte0;
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE1 */
+	u_int32_t emc_swizzle_rank0_byte1;
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE2 */
+	u_int32_t emc_swizzle_rank0_byte2;
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE3 */
+	u_int32_t emc_swizzle_rank0_byte3;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE_CFG */
+	u_int32_t emc_swizzle_rank1_byte_cfg;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE0 */
+	u_int32_t emc_swizzle_rank1_byte0;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE1 */
+	u_int32_t emc_swizzle_rank1_byte1;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE2 */
+	u_int32_t emc_swizzle_rank1_byte2;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE3 */
+	u_int32_t emc_swizzle_rank1_byte3;
+
+	/* Specifies the value for EMC_DSR_VTTGEN_DRV */
+	u_int32_t emc_dsr_vttgen_drv;
+
+	/* Specifies the value for EMC_TXDSRVTTGEN */
+	u_int32_t emc_txdsrvttgen;
+	/* Specifies the value for EMC_BGBIAS_CTL */
+	u_int32_t emc_bgbias_ctl0;
+
+	/* DRAM size information */
+
+	/* Specifies the value for MC_EMEM_ADR_CFG */
+	u_int32_t mc_emem_adr_cfg;
+	/* Specifies the value for MC_EMEM_ADR_CFG_DEV0 */
+	u_int32_t mc_emem_adr_cfg_dev0;
+	/* Specifies the value for MC_EMEM_ADR_CFG_DEV1 */
+	u_int32_t mc_emem_adr_cfg_dev1;
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG0 */
+	u_int32_t mc_emem_adr_cfg_bank_mask0;
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG1 */
+	u_int32_t mc_emem_adr_cfg_bank_mask1;
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG2 */
+	u_int32_t mc_emem_adr_cfg_bank_mask2;
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG3 */
+	u_int32_t mc_emem_adr_cfg_bank_swizzle3;
+
+	/*
+	 * Specifies the value for MC_EMEM_CFG which holds the external memory
+	 * size (in KBytes)
+	 */
+	u_int32_t mc_emem_cfg;
+
+	/* MC arbitration configuration */
+
+	/* Specifies the value for MC_EMEM_ARB_CFG */
+	u_int32_t mc_emem_arb_cfg;
+	/* Specifies the value for MC_EMEM_ARB_OUTSTANDING_REQ */
+	u_int32_t mc_emem_arb_outstanding_req;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RCD */
+	u_int32_t mc_emem_arb_timing_rcd;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RP */
+	u_int32_t mc_emem_arb_timing_rp;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RC */
+	u_int32_t mc_emem_arb_timing_rc;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RAS */
+	u_int32_t mc_emem_arb_timing_ras;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_FAW */
+	u_int32_t mc_emem_arb_timing_faw;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RRD */
+	u_int32_t mc_emem_arb_timing_rrd;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RAP2PRE */
+	u_int32_t mc_emem_arb_timing_rap2pre;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_WAP2PRE */
+	u_int32_t mc_emem_arb_timing_wap2pre;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_R2R */
+	u_int32_t mc_emem_arb_timing_r2r;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_W2W */
+	u_int32_t mc_emem_arb_timing_w2w;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_R2W */
+	u_int32_t mc_emem_arb_timing_r2w;
+	/* Specifies the value for MC_EMEM_ARB_TIMING_W2R */
+	u_int32_t mc_emem_arb_timing_w2r;
+	/* Specifies the value for MC_EMEM_ARB_DA_TURNS */
+	u_int32_t mc_emem_arb_da_turns;
+	/* Specifies the value for MC_EMEM_ARB_DA_COVERS */
+	u_int32_t mc_emem_arb_da_covers;
+	/* Specifies the value for MC_EMEM_ARB_MISC0 */
+	u_int32_t mc_emem_arb_misc0;
+	/* Specifies the value for MC_EMEM_ARB_MISC1 */
+	u_int32_t mc_emem_arb_misc1;
+	/* Specifies the value for MC_EMEM_ARB_RING1_THROTTLE */
+	u_int32_t mc_emem_arb_ring1_throttle;
+	/* Specifies the value for MC_EMEM_ARB_OVERRIDE */
+	u_int32_t mc_emem_arb_override;
+	/* Specifies the value for MC_EMEM_ARB_OVERRIDE_1 */
+	u_int32_t mc_emem_arb_override1;
+	/* Specifies the value for MC_EMEM_ARB_RSV */
+	u_int32_t mc_emem_arb_rsv;
+
+	/* Specifies the value for MC_CLKEN_OVERRIDE */
+	u_int32_t mc_clken_override;
+
+	/* Specifies the value for MC_STAT_CONTROL */
+	u_int32_t mc_stat_control;
+	/* Specifies the value for MC_DISPLAY_SNAP_RING */
+	u_int32_t mc_display_snap_ring;
+	/* Specifies the value for MC_VIDEO_PROTECT_BOM */
+	u_int32_t mc_video_protect_bom;
+	/* Specifies the value for MC_VIDEO_PROTECT_BOM_ADR_HI */
+	u_int32_t mc_video_protect_bom_adr_hi;
+	/* Specifies the value for MC_VIDEO_PROTECT_SIZE_MB */
+	u_int32_t mc_video_protect_size_mb;
+	/* Specifies the value for MC_VIDEO_PROTECT_VPR_OVERRIDE */
+	u_int32_t mc_video_protect_vpr_override;
+	/* Specifies the value for MC_VIDEO_PROTECT_VPR_OVERRIDE1 */
+	u_int32_t mc_video_protect_vpr_override1;
+	/* Specifies the value for MC_VIDEO_PROTECT_GPU_OVERRIDE_0 */
+	u_int32_t mc_video_protect_gpu_override0;
+	/* Specifies the value for MC_VIDEO_PROTECT_GPU_OVERRIDE_1 */
+	u_int32_t mc_video_protect_gpu_override1;
+	/* Specifies the value for MC_SEC_CARVEOUT_BOM */
+	u_int32_t mc_sec_carveout_bom;
+	/* Specifies the value for MC_SEC_CARVEOUT_ADR_HI */
+	u_int32_t mc_sec_carveout_adr_hi;
+	/* Specifies the value for MC_SEC_CARVEOUT_SIZE_MB */
+	u_int32_t mc_sec_carveout_size_mb;
+	/* Specifies the value for MC_VIDEO_PROTECT_REG_CTRL.VIDEO_PROTECT_WRITE_ACCESS */
+	u_int32_t mc_video_protect_write_access;
+	/* Specifies the value for MC_SEC_CARVEOUT_REG_CTRL.SEC_CARVEOUT_WRITE_ACCESS */
+	u_int32_t mc_sec_carveout_protect_write_access;
+
+	/* Specifies enable for CA training */
+	u_int32_t emc_ca_training_enable;
+	/* Specifies the value for EMC_CA_TRAINING_TIMING_CNTRL1 */
+	u_int32_t emc_ca_training_timing_cntl1;
+	/* Specifies the value for EMC_CA_TRAINING_TIMING_CNTRL2 */
+	u_int32_t emc_ca_training_timing_cntl2;
+	/* Set if bit 6 select is greater than bit 7 select; uses aremc.spec packet SWIZZLE_BIT6_GT_BIT7 */
+	u_int32_t swizzle_rank_byte_encode;
+	/* Specifies enable and offset for patched boot rom write */
+	u_int32_t boot_rom_patch_control;
+	/* Specifies data for patched boot rom write */
+	u_int32_t boot_rom_patch_data;
+	/* Specifies the value for MC_MTS_CARVEOUT_BOM */
+	u_int32_t mc_mts_carveout_bom;
+	/* Specifies the value for MC_MTS_CARVEOUT_ADR_HI */
+	u_int32_t mc_mts_carveout_adr_hi;
+	/* Specifies the value for MC_MTS_CARVEOUT_SIZE_MB */
+	u_int32_t mc_mts_carveout_size_mb;
+	/* Specifies the value for MC_MTS_CARVEOUT_REG_CTRL */
+	u_int32_t mc_mts_carveout_reg_ctrl;
+
+	/* End of generated code by warmboot_code_gen */
+} nvboot_sdram_params;
+#endif /* #ifndef INCLUDED_NVBOOT_SDRAM_PARAM_T124_H */
+
diff --git a/src/t124/parse_t124.c b/src/t124/parse_t124.c
new file mode 100644
index 0000000..0d80867
--- /dev/null
+++ b/src/t124/parse_t124.c
@@ -0,0 +1,429 @@
+/*
+ * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ */
+
+/*
+ * parse_t124.c - The implementation for parsing dev/sdram parameters
+ */
+
+#include "../parse.h"
+#include "nvboot_bct_t124.h"
+
+enum_item s_devtype_table_t124[] = {
+	{ "NvBootDevType_Sdmmc", nvboot_dev_type_sdmmc },
+	{ "NvBootDevType_Spi", nvboot_dev_type_spi },
+	{ "Sdmmc", nvboot_dev_type_sdmmc },
+	{ "Spi", nvboot_dev_type_spi },
+	{ NULL, 0 }
+};
+
+enum_item s_sdmmc_data_width_table_t124[] = {
+	{
+	  "NvBootSdmmcDataWidth_4Bit",
+	  nvboot_sdmmc_data_width_4bit
+	},
+	{
+	  "NvBootSdmmcDataWidth_8Bit",
+	  nvboot_sdmmc_data_width_8bit
+	},
+	{ "4Bit", nvboot_sdmmc_data_width_4bit },
+	{ "8Bit", nvboot_sdmmc_data_width_8bit },
+	{ NULL, 0 }
+};
+
+enum_item s_spi_clock_source_table_t124[] = {
+	{ "NvBootSpiClockSource_PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "NvBootSpiClockSource_ClockM", nvboot_spi_clock_source_clockm },
+	{ "ClockSource_PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "ClockSource_ClockM", nvboot_spi_clock_source_clockm },
+	{ "PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "ClockM", nvboot_spi_clock_source_clockm },
+	{ NULL, 0 }
+};
+
+enum_item s_nvboot_memory_type_table_t124[] = {
+	{ "NvBootMemoryType_None", nvboot_memory_type_none },
+	{ "NvBootMemoryType_Ddr3", nvboot_memory_type_ddr3 },
+	{ "NvBootMemoryType_Ddr2", nvboot_memory_type_ddr2 },
+	{ "NvBootMemoryType_Ddr", nvboot_memory_type_ddr },
+	{ "NvBootMemoryType_LpDdr2", nvboot_memory_type_lpddr2 },
+	{ "NvBootMemoryType_LpDdr", nvboot_memory_type_lpddr },
+
+	{ "None", nvboot_memory_type_none },
+	{ "Ddr3", nvboot_memory_type_ddr3 },
+	{ "Ddr2", nvboot_memory_type_ddr2 },
+	{ "Ddr", nvboot_memory_type_ddr },
+	{ "LpDdr2", nvboot_memory_type_lpddr2 },
+	{ "LpDdr", nvboot_memory_type_lpddr },
+
+	{ NULL, 0 }
+};
+
+#define TOKEN(name)						\
+	token_##name, field_type_u32, NULL
+
+field_item s_sdram_field_table_t124[] = {
+	{ "MemoryType", token_memory_type,
+	  field_type_enum, s_nvboot_memory_type_table_t124 },
+
+	{ "PllMInputDivider",           TOKEN(pllm_input_divider) },
+	{ "PllMFeedbackDivider",        TOKEN(pllm_feedback_divider) },
+	{ "PllMStableTime",             TOKEN(pllm_stable_time) },
+	{ "PllMSetupControl",           TOKEN(pllm_setup_control) },
+	{ "PllMSelectDiv2",             TOKEN(pllm_select_div2) },
+	{ "PllMPDLshiftPh45",           TOKEN(pllm_pdlshift_ph45) },
+	{ "PllMPDLshiftPh90",           TOKEN(pllm_pdlshift_ph90) },
+	{ "PllMPDLshiftPh135",          TOKEN(pllm_pdlshift_ph135) },
+	{ "PllMKCP",                    TOKEN(pllm_kcp) },
+	{ "PllMKVCO",                   TOKEN(pllm_kvco) },
+	{ "EmcBctSpare0",               TOKEN(emc_bct_spare0) },
+	{ "EmcBctSpare1",               TOKEN(emc_bct_spare1) },
+	{ "EmcBctSpare2",               TOKEN(emc_bct_spare2) },
+	{ "EmcBctSpare3",               TOKEN(emc_bct_spare3) },
+	{ "EmcBctSpare4",               TOKEN(emc_bct_spare4) },
+	{ "EmcBctSpare5",               TOKEN(emc_bct_spare5) },
+	{ "EmcBctSpare6",               TOKEN(emc_bct_spare6) },
+	{ "EmcBctSpare7",               TOKEN(emc_bct_spare7) },
+	{ "EmcBctSpare8",               TOKEN(emc_bct_spare8) },
+	{ "EmcBctSpare9",               TOKEN(emc_bct_spare9) },
+	{ "EmcBctSpare10",              TOKEN(emc_bct_spare10) },
+	{ "EmcBctSpare11",              TOKEN(emc_bct_spare11) },
+	{ "EmcAutoCalInterval",         TOKEN(emc_auto_cal_interval) },
+	{ "EmcAutoCalConfig",           TOKEN(emc_auto_cal_config) },
+	{ "EmcAutoCalConfig2",          TOKEN(emc_auto_cal_config2) },
+	{ "EmcAutoCalConfig3",          TOKEN(emc_auto_cal_config3) },
+	{ "EmcAutoCalWait",             TOKEN(emc_auto_cal_wait) },
+	{ "EmcPinProgramWait",          TOKEN(emc_pin_program_wait) },
+	{ "EmcRc",                      TOKEN(emc_rc) },
+	{ "EmcRfc",                     TOKEN(emc_rfc) },
+	{ "EmcRfcSlr",                  TOKEN(emc_rfc_slr) },
+	{ "EmcRas",                     TOKEN(emc_ras) },
+	{ "EmcRp",                      TOKEN(emc_rp) },
+	{ "EmcR2r",                     TOKEN(emc_r2r) },
+	{ "EmcW2w",                     TOKEN(emc_w2w) },
+	{ "EmcR2w",                     TOKEN(emc_r2w) },
+	{ "EmcW2r",                     TOKEN(emc_w2r) },
+	{ "EmcR2p",                     TOKEN(emc_r2p) },
+	{ "EmcW2p",                     TOKEN(emc_w2p) },
+	{ "EmcRrd",                     TOKEN(emc_rrd) },
+	{ "EmcRdRcd",                   TOKEN(emc_rd_rcd) },
+	{ "EmcWrRcd",                   TOKEN(emc_wr_rcd) },
+	{ "EmcRext",                    TOKEN(emc_rext) },
+	{ "EmcWdv",                     TOKEN(emc_wdv) },
+	{ "EmcWdvMask",                 TOKEN(emc_wdv_mask) },
+	{ "EmcQUse",                    TOKEN(emc_quse) },
+	{ "EmcQuseWidth",               TOKEN(emc_quse_width) },
+	{ "EmcIbdly",                   TOKEN(emc_ibdly) },
+	{ "EmcEInput",                  TOKEN(emc_einput) },
+	{ "EmcEInputDuration",          TOKEN(emc_einput_duration) },
+	{ "EmcPutermExtra",             TOKEN(emc_puterm_extra) },
+	{ "EmcPutermWidth",             TOKEN(emc_puterm_width) },
+	{ "EmcPutermAdj",               TOKEN(emc_puterm_adj) },
+	{ "EmcCdbCntl1",                TOKEN(emc_cdb_cntl1) },
+	{ "EmcCdbCntl2",                TOKEN(emc_cdb_cntl2) },
+	{ "EmcCdbCntl3",                TOKEN(emc_cdb_cntl3) },
+	{ "EmcQRst",                    TOKEN(emc_qrst) },
+	{ "EmcQSafe",                   TOKEN(emc_qsafe) },
+	{ "EmcRdv",                     TOKEN(emc_rdv) },
+	{ "EmcRdvMask",                 TOKEN(emc_rdv_mask) },
+	{ "EmcQpop",                    TOKEN(emc_qpop) },
+	{ "EmcRefresh",                 TOKEN(emc_refresh) },
+	{ "EmcBurstRefreshNum",         TOKEN(emc_burst_refresh_num) },
+	{ "EmcPdEx2Wr",                 TOKEN(emc_pdex2wr) },
+	{ "EmcPdEx2Rd",                 TOKEN(emc_pdex2rd) },
+	{ "EmcPChg2Pden",               TOKEN(emc_pchg2pden) },
+	{ "EmcAct2Pden",                TOKEN(emc_act2pden) },
+	{ "EmcAr2Pden",                 TOKEN(emc_ar2pden) },
+	{ "EmcRw2Pden",                 TOKEN(emc_rw2pden) },
+	{ "EmcTxsr",                    TOKEN(emc_txsr) },
+	{ "EmcTcke",                    TOKEN(emc_tcke) },
+	{ "EmcTckesr",                  TOKEN(emc_tckesr) },
+	{ "EmcTpd",                     TOKEN(emc_tpd) },
+	{ "EmcTfaw",                    TOKEN(emc_tfaw) },
+	{ "EmcTrpab",                   TOKEN(emc_trpab) },
+	{ "EmcTClkStable",              TOKEN(emc_tclkstable) },
+	{ "EmcTClkStop",                TOKEN(emc_tclkstop) },
+	{ "EmcTRefBw",                  TOKEN(emc_trefbw) },
+	{ "EmcFbioCfg5",                TOKEN(emc_fbio_cfg5) },
+	{ "EmcFbioCfg6",                TOKEN(emc_fbio_cfg6) },
+	{ "EmcFbioSpare",               TOKEN(emc_fbio_spare) },
+	{ "EmcMrsResetDllWait",         TOKEN(emc_mrs_reset_dll_wait) },
+	{ "EmcMrsResetDll",             TOKEN(emc_mrs_reset_dll) },
+	{ "EmcMrsDdr2DllReset",         TOKEN(emc_mrs_ddr2_dll_reset) },
+	{ "EmcMrs",                     TOKEN(emc_mrs) },
+	{ "EmcEmrs2",                   TOKEN(emc_emrs2) },
+	{ "EmcEmrs3",                   TOKEN(emc_emrs3) },
+	{ "EmcEmrsDdr2DllEnable",       TOKEN(emc_emrs_ddr2_dll_enable) },
+	{ "EmcEmrsDdr2OcdCalib",        TOKEN(emc_emrs_ddr2_ocd_calib) },
+	{ "EmcEmrs",                    TOKEN(emc_emrs) },
+	{ "EmcMrw1",                    TOKEN(emc_mrw1) },
+	{ "EmcMrw2",                    TOKEN(emc_mrw2) },
+	{ "EmcMrw3",                    TOKEN(emc_mrw3) },
+	{ "EmcMrw4",                    TOKEN(emc_mrw4) },
+	{ "EmcMrwResetCommand",         TOKEN(emc_mrw_reset_command) },
+	{ "EmcMrwResetNInitWait",       TOKEN(emc_mrw_reset_ninit_wait) },
+	{ "EmcAdrCfg",                  TOKEN(emc_adr_cfg) },
+	{ "McEmemCfg",                  TOKEN(mc_emem_cfg) },
+	{ "EmcCfg2",                    TOKEN(emc_cfg2) },
+	{ "EmcCfgPipe",                 TOKEN(emc_cfg_pipe) },
+	{ "EmcCfgDigDll",               TOKEN(emc_cfg_dig_dll) },
+	{ "EmcCfgDigDllPeriod",         TOKEN(emc_cfg_dig_dll_period) },
+	{ "EmcCfg",                     TOKEN(emc_cfg) },
+	{ "EmcDbg",                     TOKEN(emc_dbg) },
+	{ "WarmBootWait",               TOKEN(warm_boot_wait) },
+	{ "EmcCttTermCtrl",             TOKEN(emc_ctt_term_ctrl) },
+	{ "EmcOdtWrite",                TOKEN(emc_odt_write) },
+	{ "EmcOdtRead",                 TOKEN(emc_odt_read) },
+	{ "EmcZcalWaitCnt",             TOKEN(emc_zcal_wait_cnt) },
+	{ "EmcZcalMrwCmd",              TOKEN(emc_zcal_mrw_cmd) },
+	{ "EmcDdr2Wait",                TOKEN(emc_ddr2_wait) },
+	{ "PmcDdrPwr",                  TOKEN(pmc_ddr_pwr) },
+	{ "EmcClockSource",             TOKEN(emc_clock_source) },
+	{ "EmcPinExtraWait",            TOKEN(emc_pin_extra_wait) },
+	{ "EmcTimingControlWait",       TOKEN(emc_timing_control_wait) },
+	{ "EmcWext",                    TOKEN(emc_wext) },
+	{ "EmcCtt",                     TOKEN(emc_ctt) },
+	{ "EmcCttDuration",             TOKEN(emc_ctt_duration) },
+	{ "EmcPreRefreshReqCnt",        TOKEN(emc_prerefresh_req_cnt) },
+	{ "EmcTxsrDll",                 TOKEN(emc_txsr_dll) },
+	{ "EmcCfgRsv",                  TOKEN(emc_cfg_rsv) },
+	{ "EmcMrwExtra",                TOKEN(emc_mrw_extra) },
+	{ "EmcWarmBootMrwExtra",        TOKEN(emc_warm_boot_mrw_extra) },
+	{ "EmcWarmBootExtraModeRegWriteEnable",
+			TOKEN(emc_warm_boot_extramode_reg_write_enable) },
+	{ "EmcExtraModeRegWriteEnable", TOKEN(emc_extramode_reg_write_enable) },
+	{ "EmcMrsWaitCnt",              TOKEN(emc_mrs_wait_cnt) },
+	{ "EmcMrsWaitCnt2",             TOKEN(emc_mrs_wait_cnt2) },
+	{ "EmcCmdQ",                    TOKEN(emc_cmd_q) },
+	{ "EmcMc2EmcQ",                 TOKEN(emc_mc2emc_q) },
+	{ "EmcDynSelfRefControl",       TOKEN(emc_dyn_self_ref_control) },
+	{ "AhbArbitrationXbarCtrlMemInitDone",
+			TOKEN(ahb_arbitration_xbar_ctrl_meminit_done) },
+	{ "EmcDevSelect",               TOKEN(emc_dev_select) },
+	{ "EmcSelDpdCtrl",              TOKEN(emc_sel_dpd_ctrl) },
+	{ "EmcDllXformDqs0",            TOKEN(emc_dll_xform_dqs0) },
+	{ "EmcDllXformDqs1",            TOKEN(emc_dll_xform_dqs1) },
+	{ "EmcDllXformDqs2",            TOKEN(emc_dll_xform_dqs2) },
+	{ "EmcDllXformDqs3",            TOKEN(emc_dll_xform_dqs3) },
+	{ "EmcDllXformDqs4",            TOKEN(emc_dll_xform_dqs4) },
+	{ "EmcDllXformDqs5",            TOKEN(emc_dll_xform_dqs5) },
+	{ "EmcDllXformDqs6",            TOKEN(emc_dll_xform_dqs6) },
+	{ "EmcDllXformDqs7",            TOKEN(emc_dll_xform_dqs7) },
+	{ "EmcDllXformDqs8",            TOKEN(emc_dll_xform_dqs8) },
+	{ "EmcDllXformDqs9",            TOKEN(emc_dll_xform_dqs9) },
+	{ "EmcDllXformDqs10",           TOKEN(emc_dll_xform_dqs10) },
+	{ "EmcDllXformDqs11",           TOKEN(emc_dll_xform_dqs11) },
+	{ "EmcDllXformDqs12",           TOKEN(emc_dll_xform_dqs12) },
+	{ "EmcDllXformDqs13",           TOKEN(emc_dll_xform_dqs13) },
+	{ "EmcDllXformDqs14",           TOKEN(emc_dll_xform_dqs14) },
+	{ "EmcDllXformDqs15",           TOKEN(emc_dll_xform_dqs15) },
+	{ "EmcDllXformQUse0",           TOKEN(emc_dll_xform_quse0) },
+	{ "EmcDllXformQUse1",           TOKEN(emc_dll_xform_quse1) },
+	{ "EmcDllXformQUse2",           TOKEN(emc_dll_xform_quse2) },
+	{ "EmcDllXformQUse3",           TOKEN(emc_dll_xform_quse3) },
+	{ "EmcDllXformQUse4",           TOKEN(emc_dll_xform_quse4) },
+	{ "EmcDllXformQUse5",           TOKEN(emc_dll_xform_quse5) },
+	{ "EmcDllXformQUse6",           TOKEN(emc_dll_xform_quse6) },
+	{ "EmcDllXformQUse7",           TOKEN(emc_dll_xform_quse7) },
+	{ "EmcDllXformAddr0",           TOKEN(emc_dll_xform_addr0) },
+	{ "EmcDllXformAddr1",           TOKEN(emc_dll_xform_addr1) },
+	{ "EmcDllXformAddr2",           TOKEN(emc_dll_xform_addr2) },
+	{ "EmcDllXformAddr3",           TOKEN(emc_dll_xform_addr3) },
+	{ "EmcDllXformAddr4",           TOKEN(emc_dll_xform_addr4) },
+	{ "EmcDllXformAddr5",           TOKEN(emc_dll_xform_addr5) },
+	{ "EmcDllXformQUse8",           TOKEN(emc_dll_xform_quse8) },
+	{ "EmcDllXformQUse9",           TOKEN(emc_dll_xform_quse9) },
+	{ "EmcDllXformQUse10",          TOKEN(emc_dll_xform_quse10) },
+	{ "EmcDllXformQUse11",          TOKEN(emc_dll_xform_quse11) },
+	{ "EmcDllXformQUse12",          TOKEN(emc_dll_xform_quse12) },
+	{ "EmcDllXformQUse13",          TOKEN(emc_dll_xform_quse13) },
+	{ "EmcDllXformQUse14",          TOKEN(emc_dll_xform_quse14) },
+	{ "EmcDllXformQUse15",          TOKEN(emc_dll_xform_quse15) },
+	{ "EmcDliTrimTxDqs0",           TOKEN(emc_dli_trim_tx_dqs0) },
+	{ "EmcDliTrimTxDqs1",           TOKEN(emc_dli_trim_tx_dqs1) },
+	{ "EmcDliTrimTxDqs2",           TOKEN(emc_dli_trim_tx_dqs2) },
+	{ "EmcDliTrimTxDqs3",           TOKEN(emc_dli_trim_tx_dqs3) },
+	{ "EmcDliTrimTxDqs4",           TOKEN(emc_dli_trim_tx_dqs4) },
+	{ "EmcDliTrimTxDqs5",           TOKEN(emc_dli_trim_tx_dqs5) },
+	{ "EmcDliTrimTxDqs6",           TOKEN(emc_dli_trim_tx_dqs6) },
+	{ "EmcDliTrimTxDqs7",           TOKEN(emc_dli_trim_tx_dqs7) },
+	{ "EmcDliTrimTxDqs8",           TOKEN(emc_dli_trim_tx_dqs8) },
+	{ "EmcDliTrimTxDqs9",           TOKEN(emc_dli_trim_tx_dqs9) },
+	{ "EmcDliTrimTxDqs10",          TOKEN(emc_dli_trim_tx_dqs10) },
+	{ "EmcDliTrimTxDqs11",          TOKEN(emc_dli_trim_tx_dqs11) },
+	{ "EmcDliTrimTxDqs12",          TOKEN(emc_dli_trim_tx_dqs12) },
+	{ "EmcDliTrimTxDqs13",          TOKEN(emc_dli_trim_tx_dqs13) },
+	{ "EmcDliTrimTxDqs14",          TOKEN(emc_dli_trim_tx_dqs14) },
+	{ "EmcDliTrimTxDqs15",          TOKEN(emc_dli_trim_tx_dqs15) },
+	{ "EmcDllXformDq0",             TOKEN(emc_dll_xform_dq0) },
+	{ "EmcDllXformDq1",             TOKEN(emc_dll_xform_dq1) },
+	{ "EmcDllXformDq2",             TOKEN(emc_dll_xform_dq2) },
+	{ "EmcDllXformDq3",             TOKEN(emc_dll_xform_dq3) },
+	{ "EmcDllXformDq4",             TOKEN(emc_dll_xform_dq4) },
+	{ "EmcDllXformDq5",             TOKEN(emc_dll_xform_dq5) },
+	{ "EmcDllXformDq6",             TOKEN(emc_dll_xform_dq6) },
+	{ "EmcDllXformDq7",             TOKEN(emc_dll_xform_dq7) },
+	{ "EmcZcalInterval",            TOKEN(emc_zcal_interval) },
+	{ "EmcZcalInitDev0",            TOKEN(emc_zcal_init_dev0) },
+	{ "EmcZcalInitDev1",            TOKEN(emc_zcal_init_dev1) },
+	{ "EmcZcalInitWait",            TOKEN(emc_zcal_init_wait) },
+	{ "EmcZcalWarmColdBootEnables", TOKEN(emc_zcal_warm_cold_boot_enables) },
+	{ "EmcMrwLpddr2ZcalWarmBoot",   TOKEN(emc_mrw_lpddr2zcal_warm_boot) },
+	{ "EmcZqCalDdr3WarmBoot",       TOKEN(emc_zqcal_ddr3_warm_boot) },
+	{ "EmcZcalWarmBootWait",        TOKEN(emc_zcal_warm_boot_wait) },
+	{ "EmcMrsWarmBootEnable",       TOKEN(emc_mrs_warm_boot_enable) },
+	{ "EmcMrsExtra",                TOKEN(emc_mrs_extra) },
+	{ "EmcWarmBootMrsExtra",        TOKEN(emc_warm_boot_mrs_extra) },
+	{ "EmcClkenOverride",           TOKEN(emc_clken_override) },
+	{ "McDisExtraSnapLevels",       TOKEN(mc_dis_extra_snap_levels) },
+	{ "EmcExtraRefreshNum",         TOKEN(emc_extra_refresh_num) },
+	{ "EmcClkenOverrideAllWarmBoot",
+			TOKEN(emc_clken_override_allwarm_boot) },
+	{ "McClkenOverrideAllWarmBoot", TOKEN(mc_clken_override_allwarm_boot) },
+	{ "EmcCfgDigDllPeriodWarmBoot",
+			TOKEN(emc_cfg_dig_dll_period_warm_boot) },
+	{ "PmcVddpSel",                 TOKEN(pmc_vddp_sel) },
+	{ "PmcVddpSelWait",             TOKEN(pmc_vddp_sel_wait) },
+	{ "PmcDdrCfg",                  TOKEN(pmc_ddr_cfg) },
+	{ "PmcIoDpd3Req",               TOKEN(pmc_io_dpd3_req) },
+	{ "PmcIoDpd3ReqWait",           TOKEN(pmc_io_dpd3_req_wait) },
+	{ "PmcRegShort",                TOKEN(pmc_reg_short) },
+	{ "PmcNoIoPower",               TOKEN(pmc_no_io_power) },
+	{ "PmcPorDpdCtrlWait",          TOKEN(pmc_por_dpd_ctrl_wait) },
+	{ "EmcXm2CmdPadCtrl",           TOKEN(emc_xm2cmd_pad_ctrl) },
+	{ "EmcXm2CmdPadCtrl2",          TOKEN(emc_xm2cmd_pad_ctrl2) },
+	{ "EmcXm2CmdPadCtrl3",          TOKEN(emc_xm2cmd_pad_ctrl3) },
+	{ "EmcXm2CmdPadCtrl4",          TOKEN(emc_xm2cmd_pad_ctrl4) },
+	{ "EmcXm2CmdPadCtrl5",          TOKEN(emc_xm2cmd_pad_ctrl5) },
+	{ "EmcXm2DqsPadCtrl",           TOKEN(emc_xm2dqs_pad_ctrl) },
+	{ "EmcXm2DqsPadCtrl2",          TOKEN(emc_xm2dqs_pad_ctrl2) },
+	{ "EmcXm2DqsPadCtrl3",          TOKEN(emc_xm2dqs_pad_ctrl3) },
+	{ "EmcXm2DqsPadCtrl4",          TOKEN(emc_xm2dqs_pad_ctrl4) },
+	{ "EmcXm2DqsPadCtrl5",          TOKEN(emc_xm2dqs_pad_ctrl5) },
+	{ "EmcXm2DqsPadCtrl6",          TOKEN(emc_xm2dqs_pad_ctrl6) },
+	{ "EmcXm2DqPadCtrl",            TOKEN(emc_xm2dq_pad_ctrl) },
+	{ "EmcXm2DqPadCtrl2",           TOKEN(emc_xm2dq_pad_ctrl2) },
+	{ "EmcXm2DqPadCtrl3",           TOKEN(emc_xm2dq_pad_ctrl3) },
+	{ "EmcXm2ClkPadCtrl",           TOKEN(emc_xm2clk_pad_ctrl) },
+	{ "EmcXm2ClkPadCtrl2",          TOKEN(emc_xm2clk_pad_ctrl2) },
+	{ "EmcXm2CompPadCtrl",          TOKEN(emc_xm2comp_pad_ctrl) },
+	{ "EmcXm2VttGenPadCtrl",        TOKEN(emc_xm2vttgen_pad_ctrl) },
+	{ "EmcXm2VttGenPadCtrl2",       TOKEN(emc_xm2vttgen_pad_ctrl2) },
+	{ "EmcXm2VttGenPadCtrl3",       TOKEN(emc_xm2vttgen_pad_ctrl3) },
+	{ "EmcAcpdControl",             TOKEN(emc_acpd_control) },
+	{ "EmcSwizzleRank0ByteCfg",     TOKEN(emc_swizzle_rank0_byte_cfg) },
+	{ "EmcSwizzleRank0Byte0",       TOKEN(emc_swizzle_rank0_byte0) },
+	{ "EmcSwizzleRank0Byte1",       TOKEN(emc_swizzle_rank0_byte1) },
+	{ "EmcSwizzleRank0Byte2",       TOKEN(emc_swizzle_rank0_byte2) },
+	{ "EmcSwizzleRank0Byte3",       TOKEN(emc_swizzle_rank0_byte3) },
+	{ "EmcSwizzleRank1ByteCfg",     TOKEN(emc_swizzle_rank1_byte_cfg) },
+	{ "EmcSwizzleRank1Byte0",       TOKEN(emc_swizzle_rank1_byte0) },
+	{ "EmcSwizzleRank1Byte1",       TOKEN(emc_swizzle_rank1_byte1) },
+	{ "EmcSwizzleRank1Byte2",       TOKEN(emc_swizzle_rank1_byte2) },
+	{ "EmcSwizzleRank1Byte3",       TOKEN(emc_swizzle_rank1_byte3) },
+	{ "EmcDsrVttgenDrv",            TOKEN(emc_dsr_vttgen_drv) },
+	{ "EmcTxdsrvttgen",             TOKEN(emc_txdsrvttgen) },
+	{ "EmcBgbiasCtl0",              TOKEN(emc_bgbias_ctl0) },
+	{ "McEmemAdrCfg",               TOKEN(mc_emem_adr_cfg) },
+	{ "McEmemAdrCfgDev0",           TOKEN(mc_emem_adr_cfg_dev0) },
+	{ "McEmemAdrCfgDev1",           TOKEN(mc_emem_adr_cfg_dev1) },
+	{ "McEmemAdrCfgBankMask0",      TOKEN(mc_emem_adr_cfg_bank_mask0) },
+	{ "McEmemAdrCfgBankMask1",      TOKEN(mc_emem_adr_cfg_bank_mask1) },
+	{ "McEmemAdrCfgBankMask2",      TOKEN(mc_emem_adr_cfg_bank_mask2) },
+	{ "McEmemAdrCfgBankSwizzle3",   TOKEN(mc_emem_adr_cfg_bank_swizzle3) },
+	{ "McEmemArbCfg",               TOKEN(mc_emem_arb_cfg) },
+	{ "McEmemArbOutstandingReq",    TOKEN(mc_emem_arb_outstanding_req) },
+	{ "McEmemArbTimingRcd",         TOKEN(mc_emem_arb_timing_rcd) },
+	{ "McEmemArbTimingRp",          TOKEN(mc_emem_arb_timing_rp) },
+	{ "McEmemArbTimingRc",          TOKEN(mc_emem_arb_timing_rc) },
+	{ "McEmemArbTimingRas",         TOKEN(mc_emem_arb_timing_ras) },
+	{ "McEmemArbTimingFaw",         TOKEN(mc_emem_arb_timing_faw) },
+	{ "McEmemArbTimingRrd",         TOKEN(mc_emem_arb_timing_rrd) },
+	{ "McEmemArbTimingRap2Pre",     TOKEN(mc_emem_arb_timing_rap2pre) },
+	{ "McEmemArbTimingWap2Pre",     TOKEN(mc_emem_arb_timing_wap2pre) },
+	{ "McEmemArbTimingR2R",         TOKEN(mc_emem_arb_timing_r2r) },
+	{ "McEmemArbTimingW2W",         TOKEN(mc_emem_arb_timing_w2w) },
+	{ "McEmemArbTimingR2W",         TOKEN(mc_emem_arb_timing_r2w) },
+	{ "McEmemArbTimingW2R",         TOKEN(mc_emem_arb_timing_w2r) },
+	{ "McEmemArbDaTurns",           TOKEN(mc_emem_arb_da_turns) },
+	{ "McEmemArbDaCovers",          TOKEN(mc_emem_arb_da_covers) },
+	{ "McEmemArbMisc0",             TOKEN(mc_emem_arb_misc0) },
+	{ "McEmemArbMisc1",             TOKEN(mc_emem_arb_misc1) },
+	{ "McEmemArbRing1Throttle",     TOKEN(mc_emem_arb_ring1_throttle) },
+	{ "McEmemArbOverride",          TOKEN(mc_emem_arb_override) },
+	{ "McEmemArbOverride1",         TOKEN(mc_emem_arb_override1) },
+	{ "McEmemArbRsv",               TOKEN(mc_emem_arb_rsv) },
+	{ "McClkenOverride",            TOKEN(mc_clken_override) },
+	{ "McStatControl",              TOKEN(mc_stat_control) },
+	{ "McDisplaySnapRing",          TOKEN(mc_display_snap_ring) },
+	{ "McVideoProtectBom",          TOKEN(mc_video_protect_bom) },
+	{ "McVideoProtectBomAdrHi",
+			TOKEN(mc_video_protect_bom_adr_hi) },
+	{ "McVideoProtectSizeMb",       TOKEN(mc_video_protect_size_mb) },
+	{ "McVideoProtectVprOverride",  TOKEN(mc_video_protect_vpr_override) },
+	{ "McVideoProtectVprOverride1", TOKEN(mc_video_protect_vpr_override1) },
+	{ "McVideoProtectGpuOverride0", TOKEN(mc_video_protect_gpu_override0) },
+	{ "McVideoProtectGpuOverride1", TOKEN(mc_video_protect_gpu_override1) },
+	{ "McSecCarveoutBom",           TOKEN(mc_sec_carveout_bom) },
+	{ "McSecCarveoutAdrHi",         TOKEN(mc_sec_carveout_adr_hi) },
+	{ "McSecCarveoutSizeMb",        TOKEN(mc_sec_carveout_size_mb) },
+	{ "McVideoProtectWriteAccess",  TOKEN(mc_video_protect_write_access) },
+	{ "McSecCarveoutProtectWriteAccess",
+			TOKEN(mc_sec_carveout_protect_write_access) },
+	{ "EmcCaTrainingEnable",        TOKEN(emc_ca_training_enable) },
+	{ "EmcCaTrainingTimingCntl1",   TOKEN(emc_ca_training_timing_cntl1) },
+	{ "EmcCaTrainingTimingCntl2",   TOKEN(emc_ca_training_timing_cntl2) },
+	{ "SwizzleRankByteEncode",      TOKEN(swizzle_rank_byte_encode) },
+	{ "BootRomPatchControl",        TOKEN(boot_rom_patch_control) },
+	{ "BootRomPatchData",           TOKEN(boot_rom_patch_data) },
+	{ "McMtsCarveoutBom",           TOKEN(mc_mts_carveout_bom) },
+	{ "McMtsCarveoutAdrHi",         TOKEN(mc_mts_carveout_adr_hi) },
+	{ "McMtsCarveoutSizeMb",        TOKEN(mc_mts_carveout_size_mb) },
+	{ "McMtsCarveoutRegCtrl",       TOKEN(mc_mts_carveout_reg_ctrl) },
+	{ NULL, 0, 0, NULL }
+};
+
+field_item s_sdmmc_table_t124[] = {
+	{ "ClockDivider",               TOKEN(sdmmc_clock_divider) },
+	{ "DataWidth",
+	  token_sdmmc_data_width,
+	  field_type_enum,
+	  s_sdmmc_data_width_table_t124 },
+	{ "MaxPowerClassSupported",     TOKEN(sdmmc_max_power_class_supported) },
+	{ "MultiPageSupport",           TOKEN(sdmmc_multi_page_support) },
+	{ NULL, 0, 0, NULL }
+};
+
+field_item s_spiflash_table_t124[] = {
+	{ "ReadCommandTypeFast",        TOKEN(spiflash_read_command_type_fast) },
+	{ "PageSize2kor16k",            TOKEN(spiflash_page_size_2k_or_16k) },
+	{ "ClockDivider",               TOKEN(spiflash_clock_divider) },
+	{ "ClockSource",
+	  token_spiflash_clock_source,
+	  field_type_enum,
+	  s_spi_clock_source_table_t124 },
+	{ NULL, 0, 0, NULL }
+};
+
+parse_subfield_item s_device_type_table_t124[] = {
+	{ "SdmmcParams.", token_sdmmc_params,
+		s_sdmmc_table_t124, t124_set_dev_param },
+	{ "SpiFlashParams.", token_spiflash_params,
+		s_spiflash_table_t124, t124_set_dev_param },
+	{ NULL, 0, NULL }
+};
-- 
1.8.1.5
