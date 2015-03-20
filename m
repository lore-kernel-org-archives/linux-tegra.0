From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v2 1/2] Add support for Tegra210
Date: Fri, 20 Mar 2015 16:45:30 -0700
Message-ID: <1426895131-16433-2-git-send-email-jimmzhang@nvidia.com>
References: <1426895131-16433-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426895131-16433-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds support for Tegra210. The command option is

--soc tegra210 or -s tegra210

T210 specific files are added under src/t210 directory.

Main changes from earlier soc are many new fileds are added to
structure nvboot_sdram_params and the number of boot devices
that can be defined within bct is reduced from 4 to 1.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/Makefile.am                    |   12 +-
 src/bct_dump.c                     |    1 +
 src/cbootimage.c                   |   10 +-
 src/cbootimage.h                   |    6 +-
 src/data_layout.c                  |    2 +
 src/parse.c                        |    1 +
 src/parse.h                        |  390 ++++++
 src/set.c                          |    6 +
 src/t210/nvbctlib_t210.c           | 2314 ++++++++++++++++++++++++++++++++++++
 src/t210/nvboot_bct_t210.h         |  406 +++++++
 src/t210/nvboot_sdram_param_t210.h |  953 +++++++++++++++
 src/t210/parse_t210.c              |  741 ++++++++++++
 12 files changed, 4834 insertions(+), 8 deletions(-)
 create mode 100644 src/t210/nvbctlib_t210.c
 create mode 100644 src/t210/nvboot_bct_t210.h
 create mode 100644 src/t210/nvboot_sdram_param_t210.h
 create mode 100644 src/t210/parse_t210.c

diff --git a/src/Makefile.am b/src/Makefile.am
index 90f0bdfaf93c..64c4ea52b8e2 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -11,11 +11,13 @@ cbootimage_SOURCES = \
 	aes_ref.c \
 	context.c \
 	parse.c \
+	t210/parse_t210.c \
 	t132/parse_t132.c \
 	t124/parse_t124.c \
 	t114/parse_t114.c \
 	t30/parse_t30.c \
 	t20/parse_t20.c \
+	t210/nvbctlib_t210.c \
 	t132/nvbctlib_t132.c \
 	t124/nvbctlib_t124.c \
 	t114/nvbctlib_t114.c \
@@ -37,7 +39,9 @@ cbootimage_SOURCES = \
 	t124/nvboot_bct_t124.h \
 	t124/nvboot_sdram_param_t124.h \
 	t132/nvboot_bct_t132.h \
-	t132/nvboot_sdram_param_t132.h
+	t132/nvboot_sdram_param_t132.h \
+	t210/nvboot_bct_t210.h \
+	t210/nvboot_sdram_param_t210.h
 
 cbootimage_LDADD = -lm
 
@@ -49,11 +53,13 @@ bct_dump_SOURCES = \
 	aes_ref.c \
 	context.c \
 	parse.c \
+	t210/parse_t210.c \
 	t132/parse_t132.c \
 	t124/parse_t124.c \
 	t114/parse_t114.c \
 	t30/parse_t30.c \
 	t20/parse_t20.c \
+	t210/nvbctlib_t210.c \
 	t132/nvbctlib_t132.c \
 	t124/nvbctlib_t124.c \
 	t114/nvbctlib_t114.c \
@@ -75,4 +81,6 @@ bct_dump_SOURCES = \
 	t124/nvboot_bct_t124.h \
 	t124/nvboot_sdram_param_t124.h \
 	t132/nvboot_bct_t132.h \
-	t132/nvboot_sdram_param_t132.h
+	t132/nvboot_sdram_param_t132.h \
+	t210/nvboot_bct_t210.h \
+	t210/nvboot_sdram_param_t210.h
diff --git a/src/bct_dump.c b/src/bct_dump.c
index e2181b251ff9..be7b85dc72d6 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -53,6 +53,7 @@ static value_data const values[] = {
 	{ token_partition_size,      "PartitionSize = ", format_u32_hex8 },
 	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
 	{ token_secure_jtag_control, "JtagCtrl      = ", format_u32_hex8 },
+	{ token_secure_debug_control, "DebugCtrl     = ", format_u32_hex8 },
 	{ token_unique_chip_id,      "ChipUid       = ", format_chipuid },
 	{ token_bootloader_used,     "# Bootloader used       = ", format_u32 },
 	{ token_bootloaders_max,     "# Bootloaders max       = ", format_u32 },
diff --git a/src/cbootimage.c b/src/cbootimage.c
index 5f746e343634..f0516dd256ee 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2012-2014, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2012-2015, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -71,11 +71,11 @@ usage(void)
 	printf("    -gbct                 Generate the new bct file.\n");
 	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
 	printf("    -t|--tegra NN         Select target device. Must be one of:\n");
-	printf("                          20, 30, 114, 124, 132.\n");
-	printf("                          Default: 20. This option is deprecated\n");
+	printf("                          20, 30, 114, 124, 132, 210.\n");
+	printf("                          Default: 20.\n");
 	printf("    -s|--soc tegraNN      Select target device. Must be one of:\n");
 	printf("                          tegra20, tegra30, tegra114, tegra124,\n");
-	printf("                          tegra132.\n");
+	printf("                          tegra132, tegra210.\n");
 	printf("                          Default: tegra20.\n");
 	printf("    -u|--update           Copy input image data and update bct\n");
 	printf("                          configs into new image file.\n");
@@ -131,6 +131,8 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 				t124_get_soc_config(context, &g_soc_config);
 			} else if (!strcasecmp("132", optarg)) {
 				t132_get_soc_config(context, &g_soc_config);
+			} else if (!strcasecmp("210", optarg)) {
+				t210_get_soc_config(context, &g_soc_config);
 			} else {
 				printf("Unsupported chipname!\n");
 				usage();
diff --git a/src/cbootimage.h b/src/cbootimage.h
index c33e32344df8..9706b2c1edb8 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2012-2014, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2012-2015, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -45,10 +45,11 @@
 #define BOOTDATA_VERSION_T114		NVBOOT_BOOTDATA_VERSION(0x35, 0x1)
 #define BOOTDATA_VERSION_T124		NVBOOT_BOOTDATA_VERSION(0x40, 0x1)
 #define BOOTDATA_VERSION_T132		NVBOOT_BOOTDATA_VERSION(0x13, 0x1)
+#define BOOTDATA_VERSION_T210		NVBOOT_BOOTDATA_VERSION(0x21, 0x1)
 
 #define MAX_MTS_SIZE (4 * 1024 * 1024)
 
-#define NVBOOT_CONFIG_TABLE_SIZE_MAX 8704
+#define NVBOOT_CONFIG_TABLE_SIZE_MAX (10 * 1024)
 
 /*
  * Enumerations
@@ -111,6 +112,7 @@ typedef struct build_image_context_rec
 	u_int32_t odm_data; /* The odm data value */
 	u_int8_t unique_chip_id[16]; /* The unique chip uid */
 	u_int8_t secure_jtag_control; /* The flag for enabling jtag control */
+	u_int32_t secure_debug_control; /* The flag for enabling jtag control */
 	u_int8_t update_image; /* The flag for updating image */
 } build_image_context;
 
diff --git a/src/data_layout.c b/src/data_layout.c
index 01f00ab29f8a..1e1c82b79c01 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -1034,6 +1034,8 @@ int data_is_valid_bct(build_image_context *context)
 		return 1;
 	if (if_bct_is_t132_get_soc_config(context, &g_soc_config))
 		return 1;
+	if (if_bct_is_t210_get_soc_config(context, &g_soc_config))
+		return 1;
 
 	return 0;
 }
diff --git a/src/parse.c b/src/parse.c
index f866ad5aa538..8c9824437393 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -115,6 +115,7 @@ static parse_item s_top_level_items[] = {
 	{ "OdmData=",       token_odm_data,		parse_value_u32 },
 	{ "ChipUid=",       token_unique_chip_id,	parse_value_chipuid },
 	{ "JtagCtrl=",	    token_secure_jtag_control,	parse_value_u32 },
+	{ "DebugCtrl=",	    token_secure_debug_control,	parse_value_u32 },
 	{ NULL, 0, NULL } /* Must be last */
 };
 
diff --git a/src/parse.h b/src/parse.h
index 0e2f859c924a..ce3f21fb8a31 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -112,6 +112,7 @@ typedef enum
 	token_pre_bct_pad_blocks,
 	token_unique_chip_id,
 	token_secure_jtag_control,
+	token_secure_debug_control,
 
 	token_nand_clock_divider,
 	token_nand_nand_timing,
@@ -139,6 +140,7 @@ typedef enum
 	token_memory_type_ddr2,
 	token_memory_type_lpddr2,
 	token_memory_type_ddr3,
+	token_memory_type_lpddr4,
 
 	token_bl_version,
 	token_bl_start_blk,
@@ -175,15 +177,26 @@ typedef enum
 	token_emc_bct_spare9,
 	token_emc_bct_spare10,
 	token_emc_bct_spare11,
+	token_emc_bct_spare12,
+	token_emc_bct_spare13,
 	token_emc_clock_divider,
 	token_emc_auto_cal_interval,
 	token_emc_auto_cal_config,
 	token_emc_auto_cal_config2,
 	token_emc_auto_cal_config3,
 	token_emc_auto_cal_wait,
+
+	token_emc_xm2_comp_pad_ctrl,
+	token_emc_xm2_comp_pad_ctrl2,
+	token_emc_xm2_comp_pad_ctrl3,
+
 	token_emc_pin_program_wait,
 	token_emc_rc,
 	token_emc_rfc,
+
+	token_emc_rfc_pb,
+	token_emc_ref_ctrl2,
+
 	token_emc_rfc_slr,
 	token_emc_ras,
 	token_emc_rp,
@@ -193,15 +206,31 @@ typedef enum
 	token_emc_w2r,
 	token_emc_r2p,
 	token_emc_w2p,
+
+	token_emc_tppd,
+	token_emc_ccdmw,
+
 	token_emc_rd_rcd,
 	token_emc_wr_rcd,
 	token_emc_rrd,
 	token_emc_rext,
 	token_emc_wdv,
+
+	token_emc_wdv_chk,
+	token_emc_wsv,
+	token_emc_wev,
+
 	token_emc_wdv_mask,
+
+	token_emc_ws_duration,
+	token_emc_we_duration,
+
 	token_emc_quse,
 	token_emc_quse_width,
 	token_emc_ibdly,
+
+	token_emc_obdly,
+
 	token_emc_einput,
 	token_emc_einput_duration,
 	token_emc_puterm_extra,
@@ -214,6 +243,10 @@ typedef enum
 	token_emc_qsafe,
 	token_emc_rdv,
 	token_emc_rdv_mask,
+
+	token_emc_rdv_early,
+	token_emc_rdv_early_mask,
+
 	token_emc_qpop,
 	token_emc_refresh,
 	token_emc_burst_refresh_num,
@@ -223,6 +256,11 @@ typedef enum
 	token_emc_act2pden,
 	token_emc_ar2pden,
 	token_emc_rw2pden,
+
+	token_emc_cke2pden,
+	token_emc_pdex2che,
+	token_emc_pdex2mrr,
+
 	token_emc_txsr,
 	token_emc_tcke,
 	token_emc_tckesr,
@@ -235,6 +273,25 @@ typedef enum
 	token_emc_quse_extra,
 	token_emc_fbio_cfg5,
 	token_emc_fbio_cfg6,
+
+	token_emc_fbio_cfg7,
+	token_emc_fbio_cfg8,
+
+	/* Command mapping for CMD brick 0 */
+	token_emc_cmd_mapping_cmd0_0,
+	token_emc_cmd_mapping_cmd0_1,
+	token_emc_cmd_mapping_cmd0_2,
+	token_emc_cmd_mapping_cmd1_0,
+	token_emc_cmd_mapping_cmd1_1,
+	token_emc_cmd_mapping_cmd1_2,
+	token_emc_cmd_mapping_cmd2_0,
+	token_emc_cmd_mapping_cmd2_1,
+	token_emc_cmd_mapping_cmd2_2,
+	token_emc_cmd_mapping_cmd3_0,
+	token_emc_cmd_mapping_cmd3_1,
+	token_emc_cmd_mapping_cmd3_2,
+	token_emc_cmd_mapping_byte,
+
 	token_emc_fbio_spare,
 	token_emc_mrs,
 	token_emc_emrs,
@@ -244,6 +301,22 @@ typedef enum
 	token_emc_mrw2,
 	token_emc_mrw3,
 	token_emc_mrw4,
+
+	/* Specifies the programming to LPDDR4 Mode Register 3 at cold boot */
+	token_emc_mrw6,
+	/* Specifies the programming to LPDDR4 Mode Register 11 at cold boot */
+	token_emc_mrw8,
+	/* Specifies the programming to LPDDR4 Mode Register 11 at cold boot */
+	token_emc_mrw9,
+	/* Specifies the programming to LPDDR4 Mode Register 12 at cold boot */
+	token_emc_mrw10,
+	/* Specifies the programming to LPDDR4 Mode Register 14 at cold boot */
+	token_emc_mrw12,
+	/* Specifies the programming to LPDDR4 Mode Register 14 at cold boot */
+	token_emc_mrw13,
+	/* Specifies the programming to LPDDR4 Mode Register 22 at cold boot */
+	token_emc_mrw14,
+
 	token_emc_mrw_reset_command,
 	token_emc_mrw_reset_ninit_wait,
 	token_emc_adr_cfg,
@@ -251,8 +324,17 @@ typedef enum
 	token_emc_cfg,
 	token_emc_cfg2,
 	token_emc_cfg_pipe,
+
+	token_emc_cfg_pipe_clk,
+	token_emc_fdpd_ctrl_cmd_no_ramp,
+	token_emc_cfg_update,
+
 	token_emc_dbg,
+
+	token_emc_dbg_write_mux,
+
 	token_emc_cfg_dig_dll,
+	token_emc_cfg_dig_dll_1,
 	token_emc_cfg_dig_dll_period,
 	token_warm_boot_wait,
 	token_emc_ctt_term_ctrl,
@@ -297,8 +379,18 @@ typedef enum
 	token_apb_misc_gp_xm2vttgen_pad_ctrl,
 
 	token_emc_clock_source,
+
+	token_emc_clock_source_dll,
+	token_clk_rst_pllm_misc20_override,
+	token_clk_rst_pllm_misc20_override_enable,
+	token_clear_clock2_mc1,
+
 	token_emc_clock_use_pll_mud,
 	token_emc_pin_extra_wait,
+
+	token_emc_pin_gpio_enable,
+	token_emc_pin_gpio,
+
 	token_emc_timing_control_wait,
 	token_emc_wext,
 	token_emc_ctt,
@@ -321,6 +413,76 @@ typedef enum
 	token_ahb_arbitration_xbar_ctrl_meminit_done,
 	token_emc_dev_select,
 	token_emc_sel_dpd_ctrl,
+
+	/* Pads trimmer delays */
+	token_emc_fdpd_ctrl_dq,
+	token_emc_fdpd_ctrl_cmd,
+	token_emc_pmacro_ib_vref_dq_0,
+	token_emc_pmacro_ib_vref_dq_1,
+	token_emc_pmacro_ib_vref_dqs_0,
+	token_emc_pmacro_ib_vref_dqs_1,
+	token_emc_pmacro_ib_rxrt,
+	token_emc_cfg_pipe1,
+	token_emc_cfg_pipe2,
+
+	/* Specifies the value for EMC_PMACRO_QUSE_DDLL_RANK0_0 */
+	token_emc_pmacro_quse_ddll_rank0_0,
+	token_emc_pmacro_quse_ddll_rank0_1,
+	token_emc_pmacro_quse_ddll_rank0_2,
+	token_emc_pmacro_quse_ddll_rank0_3,
+	token_emc_pmacro_quse_ddll_rank0_4,
+	token_emc_pmacro_quse_ddll_rank0_5,
+	token_emc_pmacro_quse_ddll_rank1_0,
+	token_emc_pmacro_quse_ddll_rank1_1,
+	token_emc_pmacro_quse_ddll_rank1_2,
+	token_emc_pmacro_quse_ddll_rank1_3,
+	token_emc_pmacro_quse_ddll_rank1_4,
+	token_emc_pmacro_quse_ddll_rank1_5,
+
+	token_emc_pmacro_ob_ddll_long_dq_rank0_0,
+	token_emc_pmacro_ob_ddll_long_dq_rank0_1,
+	token_emc_pmacro_ob_ddll_long_dq_rank0_2,
+	token_emc_pmacro_ob_ddll_long_dq_rank0_3,
+	token_emc_pmacro_ob_ddll_long_dq_rank0_4,
+	token_emc_pmacro_ob_ddll_long_dq_rank0_5,
+	token_emc_pmacro_ob_ddll_long_dq_rank1_0,
+	token_emc_pmacro_ob_ddll_long_dq_rank1_1,
+	token_emc_pmacro_ob_ddll_long_dq_rank1_2,
+	token_emc_pmacro_ob_ddll_long_dq_rank1_3,
+	token_emc_pmacro_ob_ddll_long_dq_rank1_4,
+	token_emc_pmacro_ob_ddll_long_dq_rank1_5,
+
+	token_emc_pmacro_ob_ddll_long_dqs_rank0_0,
+	token_emc_pmacro_ob_ddll_long_dqs_rank0_1,
+	token_emc_pmacro_ob_ddll_long_dqs_rank0_2,
+	token_emc_pmacro_ob_ddll_long_dqs_rank0_3,
+	token_emc_pmacro_ob_ddll_long_dqs_rank0_4,
+	token_emc_pmacro_ob_ddll_long_dqs_rank0_5,
+	token_emc_pmacro_ob_ddll_long_dqs_rank1_0,
+	token_emc_pmacro_ob_ddll_long_dqs_rank1_1,
+	token_emc_pmacro_ob_ddll_long_dqs_rank1_2,
+	token_emc_pmacro_ob_ddll_long_dqs_rank1_3,
+	token_emc_pmacro_ob_ddll_long_dqs_rank1_4,
+	token_emc_pmacro_ob_ddll_long_dqs_rank1_5,
+
+	token_emc_pmacro_ib_ddll_long_dqs_rank0_0,
+	token_emc_pmacro_ib_ddll_long_dqs_rank0_1,
+	token_emc_pmacro_ib_ddll_long_dqs_rank0_2,
+	token_emc_pmacro_ib_ddll_long_dqs_rank0_3,
+	token_emc_pmacro_ib_ddll_long_dqs_rank1_0,
+	token_emc_pmacro_ib_ddll_long_dqs_rank1_1,
+	token_emc_pmacro_ib_ddll_long_dqs_rank1_2,
+	token_emc_pmacro_ib_ddll_long_dqs_rank1_3,
+
+	token_emc_pmacro_ddll_long_cmd_0,
+	token_emc_pmacro_ddll_long_cmd_1,
+	token_emc_pmacro_ddll_long_cmd_2,
+	token_emc_pmacro_ddll_long_cmd_3,
+	token_emc_pmacro_ddll_long_cmd_4,
+	token_emc_pmacro_ddll_short_cmd_0,
+	token_emc_pmacro_ddll_short_cmd_1,
+	token_emc_pmacro_ddll_short_cmd_2,
+
 	token_emc_dll_xform_dqs0,
 	token_emc_dll_xform_dqs1,
 	token_emc_dll_xform_dqs2,
@@ -392,6 +554,7 @@ typedef enum
 	token_emc_zcal_warm_cold_boot_enables,
 	token_emc_mrw_lpddr2zcal_warm_boot,
 	token_emc_zqcal_ddr3_warm_boot,
+	token_emc_zqcal_lpddr4_warm_boot,
 	token_emc_zcal_warm_boot_wait,
 	token_emc_mrs_warm_boot_enable,
 	token_emc_mrs_extra,
@@ -413,9 +576,14 @@ typedef enum
 	token_pmc_io_dpd2_req,
 	token_pmc_io_dpd3_req,
 	token_pmc_io_dpd3_req_wait,
+	token_pmc_io_dpd4_req_wait,
 	token_pmc_reg_short,
 	token_pmc_eno_vtt_gen,
 	token_pmc_no_io_power,
+
+	token_pmc_ddr_ctrl_wait,
+	token_pmc_ddr_ctrl,
+
 	token_pmc_por_dpd_ctrl_wait,
 	token_emc_xm2cmd_pad_ctrl,
 	token_emc_xm2cmd_pad_ctrl2,
@@ -456,6 +624,81 @@ typedef enum
 	token_emc_addr_swizzle_stack3,
 	token_emc_dsr_vttgen_drv,
 	token_emc_txdsrvttgen,
+
+	/* Specifies the value for EMC_DATA_BRLSHFT_0 */
+	token_emc_data_brlshft0,
+	token_emc_data_brlshft1,
+
+	token_emc_dqs_brlshft0,
+	token_emc_dqs_brlshft1,
+
+	token_emc_cmd_brlshft0,
+	token_emc_cmd_brlshft1,
+	token_emc_cmd_brlshft2,
+	token_emc_cmd_brlshft3,
+
+	token_emc_quse_brlshft0,
+	token_emc_quse_brlshft1,
+	token_emc_quse_brlshft2,
+	token_emc_quse_brlshft3,
+
+	token_emc_dll_cfg0,
+	token_emc_dll_cfg1,
+
+	token_emc_pmc_scratch1,
+	token_emc_pmc_scratch2,
+	token_emc_pmc_scratch3,
+
+	token_emc_pmacro_pad_cfg_ctrl,
+
+	token_emc_pmacro_vttgen_ctrl0,
+	token_emc_pmacro_vttgen_ctrl1,
+	token_emc_pmacro_vttgen_ctrl2,
+
+	token_emc_pmacro_brick_ctrl_rfu1,
+	token_emc_pmacro_cmd_brick_ctrl_fdpd,
+	token_emc_pmacro_brick_ctrl_rfu2,
+	token_emc_pmacro_data_brick_ctrl_fdpd,
+	token_emc_pmacro_bg_bias_ctrl0,
+	token_emc_pmacro_data_pad_rx_ctrl,
+	token_emc_pmacro_cmd_pad_rx_ctrl,
+	token_emc_pmacro_data_rx_term_mode,
+	token_emc_pmacro_cmd_rx_term_mode,
+	token_emc_pmacro_data_pad_tx_ctrl,
+	token_emc_pmacro_common_pad_tx_ctrl,
+	token_emc_pmacro_cmd_pad_tx_ctrl,
+	token_emc_cfg3,
+
+	token_emc_pmacro_tx_pwrd0,
+	token_emc_pmacro_tx_pwrd1,
+	token_emc_pmacro_tx_pwrd2,
+	token_emc_pmacro_tx_pwrd3,
+	token_emc_pmacro_tx_pwrd4,
+	token_emc_pmacro_tx_pwrd5,
+
+	token_emc_config_sample_delay,
+
+	token_emc_pmacro_brick_mapping0,
+	token_emc_pmacro_brick_mapping1,
+	token_emc_pmacro_brick_mapping2,
+
+	token_emc_pmacro_tx_sel_clk_src0,
+	token_emc_pmacro_tx_sel_clk_src1,
+	token_emc_pmacro_tx_sel_clk_src2,
+	token_emc_pmacro_tx_sel_clk_src3,
+	token_emc_pmacro_tx_sel_clk_src4,
+	token_emc_pmacro_tx_sel_clk_src5,
+
+	token_emc_pmacro_ddll_bypass,
+
+	token_emc_pmacro_ddll_pwrd0,
+	token_emc_pmacro_ddll_pwrd1,
+	token_emc_pmacro_ddll_pwrd2,
+
+	token_emc_pmacro_cmd_ctrl0,
+	token_emc_pmacro_cmd_ctrl1,
+	token_emc_pmacro_cmd_ctrl2,
+
 	token_emc_bgbias_ctl0,
 	token_mc_emem_adr_cfg,
 	token_mc_emem_adr_cfg_dev0,
@@ -468,6 +711,10 @@ typedef enum
 	token_mc_emem_adr_cfg_bank_swizzle3,
 	token_mc_emem_arb_cfg,
 	token_mc_emem_arb_outstanding_req,
+
+	token_emc_emem_arb_refpb_hp_ctrl,
+	token_emc_emem_arb_refpb_bank_ctrl,
+
 	token_mc_emem_arb_timing_rcd,
 	token_mc_emem_arb_timing_rp,
 	token_mc_emem_arb_timing_rc,
@@ -480,14 +727,23 @@ typedef enum
 	token_mc_emem_arb_timing_w2w,
 	token_mc_emem_arb_timing_r2w,
 	token_mc_emem_arb_timing_w2r,
+
+	token_mc_emem_arb_timing_rfcpb,
+
 	token_mc_emem_arb_da_turns,
 	token_mc_emem_arb_da_covers,
 	token_mc_emem_arb_misc0,
 	token_mc_emem_arb_misc1,
+	token_mc_emem_arb_misc2,
+
 	token_mc_emem_arb_ring1_throttle,
 	token_mc_emem_arb_override,
 	token_mc_emem_arb_override1,
 	token_mc_emem_arb_rsv,
+
+	token_mc_da_cfg0,
+	token_mc_emem_arb_timing_ccdmw,
+
 	token_mc_clken_override,
 	token_mc_emc_reg_mode,
 	token_mc_stat_control,
@@ -504,6 +760,82 @@ typedef enum
 	token_mc_sec_carveout_size_mb,
 	token_mc_video_protect_write_access,
 	token_mc_sec_carveout_protect_write_access,
+
+	token_mc_generalized_carveout1_bom,
+	token_mc_generalized_carveout1_bom_hi,
+	token_mc_generalized_carveout1_size_128kb,
+	token_mc_generalized_carveout1_access0,
+	token_mc_generalized_carveout1_access1,
+	token_mc_generalized_carveout1_access2,
+	token_mc_generalized_carveout1_access3,
+	token_mc_generalized_carveout1_access4,
+	token_mc_generalized_carveout1_force_internal_access0,
+	token_mc_generalized_carveout1_force_internal_access1,
+	token_mc_generalized_carveout1_force_internal_access2,
+	token_mc_generalized_carveout1_force_internal_access3,
+	token_mc_generalized_carveout1_force_internal_access4,
+	token_mc_generalized_carveout1_cfg0,
+
+	token_mc_generalized_carveout2_bom,
+	token_mc_generalized_carveout2_bom_hi,
+	token_mc_generalized_carveout2_size_128kb,
+	token_mc_generalized_carveout2_access0,
+	token_mc_generalized_carveout2_access1,
+	token_mc_generalized_carveout2_access2,
+	token_mc_generalized_carveout2_access3,
+	token_mc_generalized_carveout2_access4,
+	token_mc_generalized_carveout2_force_internal_access0,
+	token_mc_generalized_carveout2_force_internal_access1,
+	token_mc_generalized_carveout2_force_internal_access2,
+	token_mc_generalized_carveout2_force_internal_access3,
+	token_mc_generalized_carveout2_force_internal_access4,
+	token_mc_generalized_carveout2_cfg0,
+
+	token_mc_generalized_carveout3_bom,
+	token_mc_generalized_carveout3_bom_hi,
+	token_mc_generalized_carveout3_size_128kb,
+	token_mc_generalized_carveout3_access0,
+	token_mc_generalized_carveout3_access1,
+	token_mc_generalized_carveout3_access2,
+	token_mc_generalized_carveout3_access3,
+	token_mc_generalized_carveout3_access4,
+	token_mc_generalized_carveout3_force_internal_access0,
+	token_mc_generalized_carveout3_force_internal_access1,
+	token_mc_generalized_carveout3_force_internal_access2,
+	token_mc_generalized_carveout3_force_internal_access3,
+	token_mc_generalized_carveout3_force_internal_access4,
+	token_mc_generalized_carveout3_cfg0,
+
+	token_mc_generalized_carveout4_bom,
+	token_mc_generalized_carveout4_bom_hi,
+	token_mc_generalized_carveout4_size_128kb,
+	token_mc_generalized_carveout4_access0,
+	token_mc_generalized_carveout4_access1,
+	token_mc_generalized_carveout4_access2,
+	token_mc_generalized_carveout4_access3,
+	token_mc_generalized_carveout4_access4,
+	token_mc_generalized_carveout4_force_internal_access0,
+	token_mc_generalized_carveout4_force_internal_access1,
+	token_mc_generalized_carveout4_force_internal_access2,
+	token_mc_generalized_carveout4_force_internal_access3,
+	token_mc_generalized_carveout4_force_internal_access4,
+	token_mc_generalized_carveout4_cfg0,
+
+	token_mc_generalized_carveout5_bom,
+	token_mc_generalized_carveout5_bom_hi,
+	token_mc_generalized_carveout5_size_128kb,
+	token_mc_generalized_carveout5_access0,
+	token_mc_generalized_carveout5_access1,
+	token_mc_generalized_carveout5_access2,
+	token_mc_generalized_carveout5_access3,
+	token_mc_generalized_carveout5_access4,
+	token_mc_generalized_carveout5_force_internal_access0,
+	token_mc_generalized_carveout5_force_internal_access1,
+	token_mc_generalized_carveout5_force_internal_access2,
+	token_mc_generalized_carveout5_force_internal_access3,
+	token_mc_generalized_carveout5_force_internal_access4,
+	token_mc_generalized_carveout5_cfg0,
+
 	token_emc_ca_training_enable,
 	token_emc_ca_training_timing_cntl1,
 	token_emc_ca_training_timing_cntl2,
@@ -556,6 +888,31 @@ typedef enum
 	token_ch1_emc_auto_cal_config,
 	token_ch1_emc_auto_cal_config2,
 	token_ch1_emc_auto_cal_config3,
+
+	token_emc_auto_cal_config4,
+	token_emc_auto_cal_config5,
+	token_emc_auto_cal_config6,
+	token_emc_auto_cal_config7,
+	token_emc_auto_cal_config8,
+	/* Specifies the value for EMC_AUTO_CAL_VREF_SEL_0 */
+	token_emc_auto_cal_vref_sel0,
+	token_emc_auto_cal_vref_sel1,
+
+	/* Specifies the value for EMC_AUTO_CAL_CHANNEL */
+	token_emc_auto_cal_channel,
+
+	/* Specifies the value for EMC_PMACRO_AUTOCAL_CFG_0 */
+	token_emc_pmacro_auto_cal_cfg0,
+	token_emc_pmacro_auto_cal_cfg1,
+	token_emc_pmacro_auto_cal_cfg2,
+
+	token_emc_pmacro_rx_term,
+	token_emc_pmacro_dq_tx_drive,
+	token_emc_pmacro_ca_tx_drive,
+	token_emc_pmacro_cmd_tx_drive,
+	token_emc_pmacro_auto_cal_common,
+	token_emc_pmacro_zcrtl,
+
 	token_ch1_emc_cdb_cntl1,
 	token_ch1_emc_dll_xform_addr0,
 	token_ch1_emc_dll_xform_addr1,
@@ -824,6 +1181,8 @@ typedef struct cbootimage_soc_config_rec {
 
 void process_config_file(build_image_context *context, u_int8_t simple_parse);
 
+void t210_get_soc_config(build_image_context *context,
+	cbootimage_soc_config **soc_config);
 void t132_get_soc_config(build_image_context *context,
 	cbootimage_soc_config **soc_config);
 void t124_get_soc_config(build_image_context *context,
@@ -835,6 +1194,8 @@ void t30_get_soc_config(build_image_context *context,
 void t20_get_soc_config(build_image_context *context,
 	cbootimage_soc_config **soc_config);
 
+int if_bct_is_t210_get_soc_config(build_image_context *context,
+	cbootimage_soc_config **soc_config);
 int if_bct_is_t132_get_soc_config(build_image_context *context,
 	cbootimage_soc_config **soc_config);
 int if_bct_is_t124_get_soc_config(build_image_context *context,
@@ -868,6 +1229,27 @@ t132_set_sdram_param(build_image_context *context,
 	u_int32_t value);
 
 int
+t210_get_dev_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t *value);
+int
+t210_set_dev_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t value);
+int
+t210_get_sdram_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t *value);
+int
+t210_set_sdram_param(build_image_context *context,
+	u_int32_t index,
+	parse_token token,
+	u_int32_t value);
+
+int
 t124_get_dev_param(build_image_context *context,
 	u_int32_t index,
 	parse_token token,
@@ -966,30 +1348,35 @@ extern enum_item s_devtype_table_t30[];
 extern enum_item s_devtype_table_t114[];
 extern enum_item s_devtype_table_t124[];
 extern enum_item s_devtype_table_t132[];
+extern enum_item s_devtype_table_t210[];
 
 extern enum_item s_sdmmc_data_width_table_t20[];
 extern enum_item s_sdmmc_data_width_table_t30[];
 extern enum_item s_sdmmc_data_width_table_t114[];
 extern enum_item s_sdmmc_data_width_table_t124[];
 extern enum_item s_sdmmc_data_width_table_t132[];
+extern enum_item s_sdmmc_data_width_table_t210[];
 
 extern enum_item s_spi_clock_source_table_t20[];
 extern enum_item s_spi_clock_source_table_t30[];
 extern enum_item s_spi_clock_source_table_t114[];
 extern enum_item s_spi_clock_source_table_t124[];
 extern enum_item s_spi_clock_source_table_t132[];
+extern enum_item s_spi_clock_source_table_t210[];
 
 extern enum_item s_nvboot_memory_type_table_t20[];
 extern enum_item s_nvboot_memory_type_table_t30[];
 extern enum_item s_nvboot_memory_type_table_t114[];
 extern enum_item s_nvboot_memory_type_table_t124[];
 extern enum_item s_nvboot_memory_type_table_t132[];
+extern enum_item s_nvboot_memory_type_table_t210[];
 
 extern field_item s_sdram_field_table_t20[];
 extern field_item s_sdram_field_table_t30[];
 extern field_item s_sdram_field_table_t114[];
 extern field_item s_sdram_field_table_t124[];
 extern field_item s_sdram_field_table_t132[];
+extern field_item s_sdram_field_table_t210[];
 
 extern field_item s_nand_table_t20[];
 extern field_item s_nand_table_t30[];
@@ -999,17 +1386,20 @@ extern field_item s_sdmmc_table_t30[];
 extern field_item s_sdmmc_table_t114[];
 extern field_item s_sdmmc_table_t124[];
 extern field_item s_sdmmc_table_t132[];
+extern field_item s_sdmmc_table_t210[];
 
 extern field_item s_spiflash_table_t20[];
 extern field_item s_spiflash_table_t30[];
 extern field_item s_spiflash_table_t114[];
 extern field_item s_spiflash_table_t124[];
 extern field_item s_spiflash_table_t132[];
+extern field_item s_spiflash_table_t210[];
 
 extern parse_subfield_item s_device_type_table_t20[];
 extern parse_subfield_item s_device_type_table_t30[];
 extern parse_subfield_item s_device_type_table_t114[];
 extern parse_subfield_item s_device_type_table_t124[];
 extern parse_subfield_item s_device_type_table_t132[];
+extern parse_subfield_item s_device_type_table_t210[];
 
 #endif /* #ifndef INCLUDED_PARSE_H */
diff --git a/src/set.c b/src/set.c
index ff32b53ce5f7..e1498c44f48f 100644
--- a/src/set.c
+++ b/src/set.c
@@ -242,6 +242,12 @@ int context_set_value(build_image_context *context,
 			value, context->bct);
 		break;
 
+	case token_secure_debug_control:
+		context->secure_debug_control = *((u_int32_t *)value);
+		g_soc_config->set_value(token_secure_debug_control,
+			value, context->bct);
+		break;
+
 	case token_unique_chip_id:
 		memcpy(context->unique_chip_id, value, 16);
 		g_soc_config->set_value(token_unique_chip_id,
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
new file mode 100644
index 000000000000..9921bbbe0d2d
--- /dev/null
+++ b/src/t210/nvbctlib_t210.c
@@ -0,0 +1,2314 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
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
+#include "nvboot_bct_t210.h"
+#include "string.h"
+
+/* nvbctlib_t210.c: The implementation of the nvbctlib API for t210. */
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
+	*((u_int32_t *)data) = bct_ptr->id; \
+	break
+
+#define CASE_GET_CONST(id, val) \
+case token_##id:\
+	*((u_int32_t *)data) = val; \
+	break
+
+#define CASE_GET_CONST_PREFIX(id, val_prefix) \
+case token_##id:\
+	*((u_int32_t *)data) = val_prefix##_##id; \
+	break
+
+#define CASE_SET_NVU32(id) \
+case token_##id:\
+	bct_ptr->id = *((u_int32_t *)data); \
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
+parse_token t210_root_token_list[] = {
+	token_boot_data_version,
+	token_block_size,
+	token_page_size,
+	token_partition_size,
+	token_odm_data,
+	token_bootloader_used,
+	token_bootloaders_max,
+	token_bct_size,
+	token_hash_size,
+	token_crypto_offset,
+	token_crypto_length,
+	token_max_bct_search_blks,
+	token_unique_chip_id,
+	token_secure_debug_control
+};
+
+int
+t210_set_dev_param(build_image_context *context,
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
+t210_get_dev_param(build_image_context *context,
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
+t210_get_sdram_param(build_image_context *context,
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
+	/* Specifies the type of memory device */
+	CASE_GET_SDRAM_PARAM(memory_type);
+
+	/* MC/EMC clock source configuration */
+
+	/* Specifies the M value for PllM */
+	CASE_GET_SDRAM_PARAM(pllm_input_divider);
+	/* Specifies the N value for PllM */
+	CASE_GET_SDRAM_PARAM(pllm_feedback_divider);
+	/* Specifies the time to wait for PLLM to lock (in microseconds) */
+	CASE_GET_SDRAM_PARAM(pllm_stable_time);
+	/* Specifies misc. control bits */
+	CASE_GET_SDRAM_PARAM(pllm_setup_control);
+	/* Specifies the P value for PLLM */
+	CASE_GET_SDRAM_PARAM(pllm_post_divider);
+	/* Specifies value for Charge Pump Gain Control */
+	CASE_GET_SDRAM_PARAM(pllm_kcp);
+	/* Specifies VCO gain */
+	CASE_GET_SDRAM_PARAM(pllm_kvco);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare0);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare1);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare2);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare3);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare4);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare5);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare6);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare7);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare8);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare9);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare10);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare11);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare12);
+	/* Spare BCT param */
+	CASE_GET_SDRAM_PARAM(emc_bct_spare13);
+
+	/* Defines EMC_2X_CLK_SRC, EMC_2X_CLK_DIVISOR, EMC_INVERT_DCD */
+	CASE_GET_SDRAM_PARAM(emc_clock_source);
+	CASE_GET_SDRAM_PARAM(emc_clock_source_dll);
+
+	/* Defines possible override for PLLLM_MISC2 */
+	CASE_GET_SDRAM_PARAM(clk_rst_pllm_misc20_override);
+	/* enables override for PLLLM_MISC2 */
+	CASE_GET_SDRAM_PARAM(clk_rst_pllm_misc20_override_enable);
+	/* defines CLK_ENB_MC1 in register clk_rst_controller_clk_enb_w_clr */
+	CASE_GET_SDRAM_PARAM(clear_clock2_mc1);
+
+	/* Auto-calibration of EMC pads */
+
+	/* Specifies the value for EMC_AUTO_CAL_INTERVAL */
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_interval);
+	/*
+	 * Specifies the value for EMC_AUTO_CAL_CONFIG
+	 * Note: Trigger bits are set by the SDRAM code.
+	 */
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config);
+
+	/* Specifies the value for EMC_AUTO_CAL_CONFIG2 */
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config2);
+
+	/* Specifies the value for EMC_AUTO_CAL_CONFIG3 */
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config3);
+
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config4);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config5);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config6);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config7);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_config8);
+	/* Specifies the value for EMC_AUTO_CAL_VREF_SEL_0 */
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_vref_sel0);
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_vref_sel1);
+
+	/* Specifies the value for EMC_AUTO_CAL_CHANNEL */
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_channel);
+
+	/* Specifies the value for EMC_PMACRO_AUTOCAL_CFG_0 */
+	CASE_GET_SDRAM_PARAM(emc_pmacro_auto_cal_cfg0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_auto_cal_cfg1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_auto_cal_cfg2);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_rx_term);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_dq_tx_drive);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ca_tx_drive);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_cmd_tx_drive);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_auto_cal_common);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_zcrtl);
+
+	/*
+	 * Specifies the time for the calibration
+	 * to stabilize (in microseconds)
+	 */
+	CASE_GET_SDRAM_PARAM(emc_auto_cal_wait);
+
+	CASE_GET_SDRAM_PARAM(emc_xm2_comp_pad_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_xm2_comp_pad_ctrl2);
+	CASE_GET_SDRAM_PARAM(emc_xm2_comp_pad_ctrl3);
+
+	/*
+	 * DRAM size information
+	 * Specifies the value for EMC_ADR_CFG
+	 */
+	CASE_GET_SDRAM_PARAM(emc_adr_cfg);
+
+	/*
+	 * Specifies the time to wait after asserting pin
+	 * CKE (in microseconds)
+	 */
+	CASE_GET_SDRAM_PARAM(emc_pin_program_wait);
+	/* Specifies the extra delay before/after pin RESET/CKE command */
+	CASE_GET_SDRAM_PARAM(emc_pin_extra_wait);
+
+	CASE_GET_SDRAM_PARAM(emc_pin_gpio_enable);
+	CASE_GET_SDRAM_PARAM(emc_pin_gpio);
+
+	/*
+	 * Specifies the extra delay after the first writing
+	 * of EMC_TIMING_CONTROL
+	 */
+	CASE_GET_SDRAM_PARAM(emc_timing_control_wait);
+
+	/* Timing parameters required for the SDRAM */
+
+	/* Specifies the value for EMC_RC */
+	CASE_GET_SDRAM_PARAM(emc_rc);
+	/* Specifies the value for EMC_RFC */
+	CASE_GET_SDRAM_PARAM(emc_rfc);
+
+	CASE_GET_SDRAM_PARAM(emc_rfc_pb);
+	CASE_GET_SDRAM_PARAM(emc_ref_ctrl2);
+
+	/* Specifies the value for EMC_RFC_SLR */
+	CASE_GET_SDRAM_PARAM(emc_rfc_slr);
+	/* Specifies the value for EMC_RAS */
+	CASE_GET_SDRAM_PARAM(emc_ras);
+	/* Specifies the value for EMC_RP */
+	CASE_GET_SDRAM_PARAM(emc_rp);
+	/* Specifies the value for EMC_R2R */
+	CASE_GET_SDRAM_PARAM(emc_r2r);
+	/* Specifies the value for EMC_W2W */
+	CASE_GET_SDRAM_PARAM(emc_w2w);
+	/* Specifies the value for EMC_R2W */
+	CASE_GET_SDRAM_PARAM(emc_r2w);
+	/* Specifies the value for EMC_W2R */
+	CASE_GET_SDRAM_PARAM(emc_w2r);
+	/* Specifies the value for EMC_R2P */
+	CASE_GET_SDRAM_PARAM(emc_r2p);
+	/* Specifies the value for EMC_W2P */
+	CASE_GET_SDRAM_PARAM(emc_w2p);
+	/* Specifies the value for EMC_RD_RCD */
+
+	CASE_GET_SDRAM_PARAM(emc_tppd);
+	CASE_GET_SDRAM_PARAM(emc_ccdmw);
+
+	CASE_GET_SDRAM_PARAM(emc_rd_rcd);
+	/* Specifies the value for EMC_WR_RCD */
+	CASE_GET_SDRAM_PARAM(emc_wr_rcd);
+	/* Specifies the value for EMC_RRD */
+	CASE_GET_SDRAM_PARAM(emc_rrd);
+	/* Specifies the value for EMC_REXT */
+	CASE_GET_SDRAM_PARAM(emc_rext);
+	/* Specifies the value for EMC_WEXT */
+	CASE_GET_SDRAM_PARAM(emc_wext);
+	/* Specifies the value for EMC_WDV */
+	CASE_GET_SDRAM_PARAM(emc_wdv);
+
+	CASE_GET_SDRAM_PARAM(emc_wdv_chk);
+	CASE_GET_SDRAM_PARAM(emc_wsv);
+	CASE_GET_SDRAM_PARAM(emc_wev);
+
+	/* Specifies the value for EMC_WDV_MASK */
+	CASE_GET_SDRAM_PARAM(emc_wdv_mask);
+
+	CASE_GET_SDRAM_PARAM(emc_ws_duration);
+	CASE_GET_SDRAM_PARAM(emc_we_duration);
+
+	/* Specifies the value for EMC_QUSE */
+	CASE_GET_SDRAM_PARAM(emc_quse);
+	/* Specifies the value for EMC_QUSE_WIDTH */
+	CASE_GET_SDRAM_PARAM(emc_quse_width);
+	/* Specifies the value for EMC_IBDLY */
+	CASE_GET_SDRAM_PARAM(emc_ibdly);
+
+	CASE_GET_SDRAM_PARAM(emc_obdly);
+
+	/* Specifies the value for EMC_EINPUT */
+	CASE_GET_SDRAM_PARAM(emc_einput);
+	/* Specifies the value for EMC_EINPUT_DURATION */
+	CASE_GET_SDRAM_PARAM(emc_einput_duration);
+	/* Specifies the value for EMC_PUTERM_EXTRA */
+	CASE_GET_SDRAM_PARAM(emc_puterm_extra);
+	/* Specifies the value for EMC_PUTERM_WIDTH */
+	CASE_GET_SDRAM_PARAM(emc_puterm_width);
+
+	CASE_GET_SDRAM_PARAM(emc_qrst);
+	CASE_GET_SDRAM_PARAM(emc_qsafe);
+	CASE_GET_SDRAM_PARAM(emc_rdv);
+	CASE_GET_SDRAM_PARAM(emc_rdv_mask);
+
+	CASE_GET_SDRAM_PARAM(emc_rdv_early);
+	CASE_GET_SDRAM_PARAM(emc_rdv_early_mask);
+
+	/* Specifies the value for EMC_QPOP */
+	CASE_GET_SDRAM_PARAM(emc_qpop);
+
+	/* Specifies the value for EMC_REFRESH */
+	CASE_GET_SDRAM_PARAM(emc_refresh);
+	/* Specifies the value for EMC_BURST_REFRESH_NUM */
+	CASE_GET_SDRAM_PARAM(emc_burst_refresh_num);
+	/* Specifies the value for EMC_PRE_REFRESH_REQ_CNT */
+	CASE_GET_SDRAM_PARAM(emc_prerefresh_req_cnt);
+	/* Specifies the value for EMC_PDEX2WR */
+	CASE_GET_SDRAM_PARAM(emc_pdex2wr);
+	/* Specifies the value for EMC_PDEX2RD */
+	CASE_GET_SDRAM_PARAM(emc_pdex2rd);
+	/* Specifies the value for EMC_PCHG2PDEN */
+	CASE_GET_SDRAM_PARAM(emc_pchg2pden);
+	/* Specifies the value for EMC_ACT2PDEN */
+	CASE_GET_SDRAM_PARAM(emc_act2pden);
+	/* Specifies the value for EMC_AR2PDEN */
+	CASE_GET_SDRAM_PARAM(emc_ar2pden);
+	/* Specifies the value for EMC_RW2PDEN */
+	CASE_GET_SDRAM_PARAM(emc_rw2pden);
+
+	CASE_GET_SDRAM_PARAM(emc_cke2pden);
+	CASE_GET_SDRAM_PARAM(emc_pdex2che);
+	CASE_GET_SDRAM_PARAM(emc_pdex2mrr);
+
+	/* Specifies the value for EMC_TXSR */
+	CASE_GET_SDRAM_PARAM(emc_txsr);
+	/* Specifies the value for EMC_TXSRDLL */
+	CASE_GET_SDRAM_PARAM(emc_txsr_dll);
+	/* Specifies the value for EMC_TCKE */
+	CASE_GET_SDRAM_PARAM(emc_tcke);
+	/* Specifies the value for EMC_TCKESR */
+	CASE_GET_SDRAM_PARAM(emc_tckesr);
+	/* Specifies the value for EMC_TPD */
+	CASE_GET_SDRAM_PARAM(emc_tpd);
+	/* Specifies the value for EMC_TFAW */
+	CASE_GET_SDRAM_PARAM(emc_tfaw);
+	/* Specifies the value for EMC_TRPAB */
+	CASE_GET_SDRAM_PARAM(emc_trpab);
+	/* Specifies the value for EMC_TCLKSTABLE */
+	CASE_GET_SDRAM_PARAM(emc_tclkstable);
+	/* Specifies the value for EMC_TCLKSTOP */
+	CASE_GET_SDRAM_PARAM(emc_tclkstop);
+	/* Specifies the value for EMC_TREFBW */
+	CASE_GET_SDRAM_PARAM(emc_trefbw);
+
+	/* FBIO configuration values */
+
+	/* Specifies the value for EMC_FBIO_CFG5 */
+	CASE_GET_SDRAM_PARAM(emc_fbio_cfg5);
+	/* Specifies the value for EMC_FBIO_CFG7 */
+	CASE_GET_SDRAM_PARAM(emc_fbio_cfg7);
+	CASE_GET_SDRAM_PARAM(emc_fbio_cfg8);
+
+	/* Command mapping for CMD brick 0 */
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd0_0);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd0_1);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd0_2);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd1_0);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd1_1);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd1_2);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd2_0);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd2_1);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd2_2);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd3_0);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd3_1);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_cmd3_2);
+	CASE_GET_SDRAM_PARAM(emc_cmd_mapping_byte);
+
+	/* Specifies the value for EMC_FBIO_SPARE */
+	CASE_GET_SDRAM_PARAM(emc_fbio_spare);
+
+	/* Specifies the value for EMC_CFG_RSV */
+	CASE_GET_SDRAM_PARAM(emc_cfg_rsv);
+
+	/* MRS command values */
+
+	/* Specifies the value for EMC_MRS */
+	CASE_GET_SDRAM_PARAM(emc_mrs);
+	/* Specifies the MP0 command to initialize mode registers */
+	CASE_GET_SDRAM_PARAM(emc_emrs);
+	/* Specifies the MP2 command to initialize mode registers */
+	CASE_GET_SDRAM_PARAM(emc_emrs2);
+	/* Specifies the MP3 command to initialize mode registers */
+	CASE_GET_SDRAM_PARAM(emc_emrs3);
+	/* Specifies the programming to LPDDR2 Mode Register 1 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw1);
+	/* Specifies the programming to LPDDR2 Mode Register 2 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw2);
+	/* Specifies the programming to LPDDR2 Mode Register 3 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw3);
+	/* Specifies the programming to LPDDR2 Mode Register 11 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw4);
+
+	/* Specifies the programming to LPDDR4 Mode Register 3 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw6);
+	/* Specifies the programming to LPDDR4 Mode Register 11 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw8);
+	/* Specifies the programming to LPDDR4 Mode Register 11 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw9);
+	/* Specifies the programming to LPDDR4 Mode Register 12 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw10);
+	/* Specifies the programming to LPDDR4 Mode Register 14 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw12);
+	/* Specifies the programming to LPDDR4 Mode Register 14 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw13);
+	/* Specifies the programming to LPDDR4 Mode Register 22 at cold boot */
+	CASE_GET_SDRAM_PARAM(emc_mrw14);
+
+	/*
+	 * Specifies the programming to extra LPDDR2 Mode Register
+	 * at cold boot
+	 */
+	CASE_GET_SDRAM_PARAM(emc_mrw_extra);
+	/*
+	 * Specifies the programming to extra LPDDR2 Mode Register
+	 * at warm boot
+	 */
+	CASE_GET_SDRAM_PARAM(emc_warm_boot_mrw_extra);
+	/*
+	 * Specify the enable of extra Mode Register programming at
+	 * warm boot
+	 */
+	CASE_GET_SDRAM_PARAM(emc_warm_boot_extramode_reg_write_enable);
+	/*
+	 * Specify the enable of extra Mode Register programming at
+	 * cold boot
+	 */
+	CASE_GET_SDRAM_PARAM(emc_extramode_reg_write_enable);
+
+	/* Specifies the EMC_MRW reset command value */
+	CASE_GET_SDRAM_PARAM(emc_mrw_reset_command);
+	/* Specifies the EMC Reset wait time (in microseconds) */
+	CASE_GET_SDRAM_PARAM(emc_mrw_reset_ninit_wait);
+	/* Specifies the value for EMC_MRS_WAIT_CNT */
+	CASE_GET_SDRAM_PARAM(emc_mrs_wait_cnt);
+	/* Specifies the value for EMC_MRS_WAIT_CNT2 */
+	CASE_GET_SDRAM_PARAM(emc_mrs_wait_cnt2);
+
+	/* EMC miscellaneous configurations */
+
+	/* Specifies the value for EMC_CFG */
+	CASE_GET_SDRAM_PARAM(emc_cfg);
+	/* Specifies the value for EMC_CFG_2 */
+	CASE_GET_SDRAM_PARAM(emc_cfg2);
+	/* Specifies the pipe bypass controls */
+	CASE_GET_SDRAM_PARAM(emc_cfg_pipe);
+
+	CASE_GET_SDRAM_PARAM(emc_cfg_pipe_clk);
+	CASE_GET_SDRAM_PARAM(emc_fdpd_ctrl_cmd_no_ramp);
+	CASE_GET_SDRAM_PARAM(emc_cfg_update);
+
+	/* Specifies the value for EMC_DBG */
+	CASE_GET_SDRAM_PARAM(emc_dbg);
+
+	CASE_GET_SDRAM_PARAM(emc_dbg_write_mux);
+
+	/* Specifies the value for EMC_CMDQ */
+	CASE_GET_SDRAM_PARAM(emc_cmd_q);
+	/* Specifies the value for EMC_MC2EMCQ */
+	CASE_GET_SDRAM_PARAM(emc_mc2emc_q);
+	/* Specifies the value for EMC_DYN_SELF_REF_CONTROL */
+	CASE_GET_SDRAM_PARAM(emc_dyn_self_ref_control);
+
+	/* Specifies the value for MEM_INIT_DONE */
+	CASE_GET_SDRAM_PARAM(ahb_arbitration_xbar_ctrl_meminit_done);
+
+	/* Specifies the value for EMC_CFG_DIG_DLL */
+	CASE_GET_SDRAM_PARAM(emc_cfg_dig_dll);
+	CASE_GET_SDRAM_PARAM(emc_cfg_dig_dll_1);
+
+	/* Specifies the value for EMC_CFG_DIG_DLL_PERIOD */
+	CASE_GET_SDRAM_PARAM(emc_cfg_dig_dll_period);
+	/* Specifies the value of *DEV_SELECTN of various EMC registers */
+	CASE_GET_SDRAM_PARAM(emc_dev_select);
+
+	/* Specifies the value for EMC_SEL_DPD_CTRL */
+	CASE_GET_SDRAM_PARAM(emc_sel_dpd_ctrl);
+
+	/* Pads trimmer delays */
+	CASE_GET_SDRAM_PARAM(emc_fdpd_ctrl_dq);
+	CASE_GET_SDRAM_PARAM(emc_fdpd_ctrl_cmd);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_vref_dq_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_vref_dq_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_vref_dqs_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_vref_dqs_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_rxrt);
+	CASE_GET_SDRAM_PARAM(emc_cfg_pipe1);
+	CASE_GET_SDRAM_PARAM(emc_cfg_pipe2);
+
+	/* Specifies the value for EMC_PMACRO_QUSE_DDLL_RANK0_0 */
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_5);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_5);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_5);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_5);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_5);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_5);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank0_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank0_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank0_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank0_3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank1_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank1_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank1_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank1_3);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_short_cmd_0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_short_cmd_1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_short_cmd_2);
+
+	/*
+	 * Specifies the delay after asserting CKE pin during a WarmBoot0
+	 * sequence (in microseconds)
+	 */
+	CASE_GET_SDRAM_PARAM(warm_boot_wait);
+
+	/* Specifies the value for EMC_ODT_WRITE */
+	CASE_GET_SDRAM_PARAM(emc_odt_write);
+
+	/* Periodic ZQ calibration */
+
+	/*
+	 * Specifies the value for EMC_ZCAL_INTERVAL
+	 * Value 0 disables ZQ calibration
+	 */
+	CASE_GET_SDRAM_PARAM(emc_zcal_interval);
+	/* Specifies the value for EMC_ZCAL_WAIT_CNT */
+	CASE_GET_SDRAM_PARAM(emc_zcal_wait_cnt);
+	/* Specifies the value for EMC_ZCAL_MRW_CMD */
+	CASE_GET_SDRAM_PARAM(emc_zcal_mrw_cmd);
+
+	/* DRAM initialization sequence flow control */
+
+	/* Specifies the MRS command value for resetting DLL */
+	CASE_GET_SDRAM_PARAM(emc_mrs_reset_dll);
+	/* Specifies the command for ZQ initialization of device 0 */
+	CASE_GET_SDRAM_PARAM(emc_zcal_init_dev0);
+	/* Specifies the command for ZQ initialization of device 1 */
+	CASE_GET_SDRAM_PARAM(emc_zcal_init_dev1);
+	/*
+	 * Specifies the wait time after programming a ZQ initialization
+	 * command (in microseconds)
+	 */
+	CASE_GET_SDRAM_PARAM(emc_zcal_init_wait);
+	/*
+	 * Specifies the enable for ZQ calibration at cold boot [bit 0]
+	 * and warm boot [bit 1]
+	 */
+	CASE_GET_SDRAM_PARAM(emc_zcal_warm_cold_boot_enables);
+
+	/*
+	 * Specifies the MRW command to LPDDR2 for ZQ calibration
+	 * on warmboot
+	 */
+	/* Is issued to both devices separately */
+	CASE_GET_SDRAM_PARAM(emc_mrw_lpddr2zcal_warm_boot);
+	/*
+	 * Specifies the ZQ command to DDR3 for ZQ calibration on warmboot
+	 * Is issued to both devices separately
+	 */
+	CASE_GET_SDRAM_PARAM(emc_zqcal_ddr3_warm_boot);
+
+	CASE_GET_SDRAM_PARAM(emc_zqcal_lpddr4_warm_boot);
+
+	/*
+	 * Specifies the wait time for ZQ calibration on warmboot
+	 * (in microseconds)
+	 */
+	CASE_GET_SDRAM_PARAM(emc_zcal_warm_boot_wait);
+	/*
+	 * Specifies the enable for DRAM Mode Register programming
+	 * at warm boot
+	 */
+	CASE_GET_SDRAM_PARAM(emc_mrs_warm_boot_enable);
+	/*
+	 * Specifies the wait time after sending an MRS DLL reset command
+	 * in microseconds)
+	 */
+	CASE_GET_SDRAM_PARAM(emc_mrs_reset_dll_wait);
+	/* Specifies the extra MRS command to initialize mode registers */
+	CASE_GET_SDRAM_PARAM(emc_mrs_extra);
+	/* Specifies the extra MRS command at warm boot */
+	CASE_GET_SDRAM_PARAM(emc_warm_boot_mrs_extra);
+	/* Specifies the EMRS command to enable the DDR2 DLL */
+	CASE_GET_SDRAM_PARAM(emc_emrs_ddr2_dll_enable);
+	/* Specifies the MRS command to reset the DDR2 DLL */
+	CASE_GET_SDRAM_PARAM(emc_mrs_ddr2_dll_reset);
+	/* Specifies the EMRS command to set OCD calibration */
+	CASE_GET_SDRAM_PARAM(emc_emrs_ddr2_ocd_calib);
+	/*
+	 * Specifies the wait between initializing DDR and setting OCD
+	 * calibration (in microseconds)
+	 */
+	CASE_GET_SDRAM_PARAM(emc_ddr2_wait);
+	/* Specifies the value for EMC_CLKEN_OVERRIDE */
+	CASE_GET_SDRAM_PARAM(emc_clken_override);
+	/*
+	 * Specifies LOG2 of the extra refresh numbers after booting
+	 * Program 0 to disable
+	 */
+	CASE_GET_SDRAM_PARAM(emc_extra_refresh_num);
+	/* Specifies the master override for all EMC clocks */
+	CASE_GET_SDRAM_PARAM(emc_clken_override_allwarm_boot);
+	/* Specifies the master override for all MC clocks */
+	CASE_GET_SDRAM_PARAM(mc_clken_override_allwarm_boot);
+	/* Specifies digital dll period, choosing between 4 to 64 ms */
+	CASE_GET_SDRAM_PARAM(emc_cfg_dig_dll_period_warm_boot);
+
+	/* Pad controls */
+
+	/* Specifies the value for PMC_VDDP_SEL */
+	CASE_GET_SDRAM_PARAM(pmc_vddp_sel);
+	/* Specifies the wait time after programming PMC_VDDP_SEL */
+	CASE_GET_SDRAM_PARAM(pmc_vddp_sel_wait);
+	/* Specifies the value for PMC_DDR_PWR */
+	CASE_GET_SDRAM_PARAM(pmc_ddr_pwr);
+	/* Specifies the value for PMC_DDR_CFG */
+	CASE_GET_SDRAM_PARAM(pmc_ddr_cfg);
+	/* Specifies the value for PMC_IO_DPD3_REQ */
+	CASE_GET_SDRAM_PARAM(pmc_io_dpd3_req);
+	/* Specifies the wait time after programming PMC_IO_DPD3_REQ */
+	CASE_GET_SDRAM_PARAM(pmc_io_dpd3_req_wait);
+
+	CASE_GET_SDRAM_PARAM(pmc_io_dpd4_req_wait);
+
+	/* Specifies the value for PMC_REG_SHORT */
+	CASE_GET_SDRAM_PARAM(pmc_reg_short);
+	/* Specifies the value for PMC_NO_IOPOWER */
+	CASE_GET_SDRAM_PARAM(pmc_no_io_power);
+
+	CASE_GET_SDRAM_PARAM(pmc_ddr_ctrl_wait);
+	CASE_GET_SDRAM_PARAM(pmc_ddr_ctrl);
+
+	/* Specifies the value for EMC_ACPD_CONTROL */
+	CASE_GET_SDRAM_PARAM(emc_acpd_control);
+
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE0 */
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte0);
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE1 */
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte1);
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE2 */
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte2);
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE3 */
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank0_byte3);
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE0 */
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte0);
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE1 */
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte1);
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE2 */
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte2);
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE3 */
+	CASE_GET_SDRAM_PARAM(emc_swizzle_rank1_byte3);
+
+	/* Specifies the value for EMC_TXDSRVTTGEN */
+	CASE_GET_SDRAM_PARAM(emc_txdsrvttgen);
+
+	/* Specifies the value for EMC_DATA_BRLSHFT_0 */
+	CASE_GET_SDRAM_PARAM(emc_data_brlshft0);
+	CASE_GET_SDRAM_PARAM(emc_data_brlshft1);
+
+	CASE_GET_SDRAM_PARAM(emc_dqs_brlshft0);
+	CASE_GET_SDRAM_PARAM(emc_dqs_brlshft1);
+
+	CASE_GET_SDRAM_PARAM(emc_cmd_brlshft0);
+	CASE_GET_SDRAM_PARAM(emc_cmd_brlshft1);
+	CASE_GET_SDRAM_PARAM(emc_cmd_brlshft2);
+	CASE_GET_SDRAM_PARAM(emc_cmd_brlshft3);
+
+	CASE_GET_SDRAM_PARAM(emc_quse_brlshft0);
+	CASE_GET_SDRAM_PARAM(emc_quse_brlshft1);
+	CASE_GET_SDRAM_PARAM(emc_quse_brlshft2);
+	CASE_GET_SDRAM_PARAM(emc_quse_brlshft3);
+
+	CASE_GET_SDRAM_PARAM(emc_dll_cfg0);
+	CASE_GET_SDRAM_PARAM(emc_dll_cfg1);
+
+	CASE_GET_SDRAM_PARAM(emc_pmc_scratch1);
+	CASE_GET_SDRAM_PARAM(emc_pmc_scratch2);
+	CASE_GET_SDRAM_PARAM(emc_pmc_scratch3);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_pad_cfg_ctrl);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_vttgen_ctrl0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_vttgen_ctrl1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_vttgen_ctrl2);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_brick_ctrl_rfu1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_cmd_brick_ctrl_fdpd);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_brick_ctrl_rfu2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_data_brick_ctrl_fdpd);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_bg_bias_ctrl0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_data_pad_rx_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_cmd_pad_rx_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_data_rx_term_mode);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_cmd_rx_term_mode);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_data_pad_tx_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_common_pad_tx_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_cmd_pad_tx_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_cfg3);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_pwrd0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_pwrd1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_pwrd2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_pwrd3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_pwrd4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_pwrd5);
+
+	CASE_GET_SDRAM_PARAM(emc_config_sample_delay);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_brick_mapping0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_brick_mapping1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_brick_mapping2);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src2);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src3);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src4);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src5);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_bypass);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_pwrd0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_pwrd1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_ddll_pwrd2);
+
+	CASE_GET_SDRAM_PARAM(emc_pmacro_cmd_ctrl0);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_cmd_ctrl1);
+	CASE_GET_SDRAM_PARAM(emc_pmacro_cmd_ctrl2);
+
+	/* DRAM size information */
+
+	/* Specifies the value for MC_EMEM_ADR_CFG */
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg);
+	/* Specifies the value for MC_EMEM_ADR_CFG_DEV0 */
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_dev0);
+	/* Specifies the value for MC_EMEM_ADR_CFG_DEV1 */
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_dev1);
+
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_channel_mask);
+
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG0 */
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask0);
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG1 */
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask1);
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG2 */
+	CASE_GET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask2);
+
+	/*
+	 * Specifies the value for MC_EMEM_CFG which holds the external memory
+	 * size (in KBytes)
+	 */
+	CASE_GET_SDRAM_PARAM(mc_emem_cfg);
+
+	/* MC arbitration configuration */
+
+	/* Specifies the value for MC_EMEM_ARB_CFG */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_cfg);
+	/* Specifies the value for MC_EMEM_ARB_OUTSTANDING_REQ */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_outstanding_req);
+
+	CASE_GET_SDRAM_PARAM(emc_emem_arb_refpb_hp_ctrl);
+	CASE_GET_SDRAM_PARAM(emc_emem_arb_refpb_bank_ctrl);
+
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RCD */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rcd);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RP */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rp);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RC */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rc);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RAS */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_ras);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_FAW */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_faw);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RRD */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rrd);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RAP2PRE */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rap2pre);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_WAP2PRE */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_wap2pre);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_R2R */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_r2r);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_W2W */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_w2w);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_R2W */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_r2w);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_W2R */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_w2r);
+
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_rfcpb);
+
+	/* Specifies the value for MC_EMEM_ARB_DA_TURNS */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_da_turns);
+	/* Specifies the value for MC_EMEM_ARB_DA_COVERS */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_da_covers);
+	/* Specifies the value for MC_EMEM_ARB_MISC0 */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_misc0);
+	/* Specifies the value for MC_EMEM_ARB_MISC1 */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_misc1);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_misc2);
+
+	/* Specifies the value for MC_EMEM_ARB_RING1_THROTTLE */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_ring1_throttle);
+	/* Specifies the value for MC_EMEM_ARB_OVERRIDE */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_override);
+	/* Specifies the value for MC_EMEM_ARB_OVERRIDE_1 */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_override1);
+	/* Specifies the value for MC_EMEM_ARB_RSV */
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_rsv);
+
+	CASE_GET_SDRAM_PARAM(mc_da_cfg0);
+	CASE_GET_SDRAM_PARAM(mc_emem_arb_timing_ccdmw);
+
+	/* Specifies the value for MC_CLKEN_OVERRIDE */
+	CASE_GET_SDRAM_PARAM(mc_clken_override);
+
+	/* Specifies the value for MC_STAT_CONTROL */
+	CASE_GET_SDRAM_PARAM(mc_stat_control);
+	/* Specifies the value for MC_VIDEO_PROTECT_BOM */
+	CASE_GET_SDRAM_PARAM(mc_video_protect_bom);
+	/* Specifies the value for MC_VIDEO_PROTECT_BOM_ADR_HI */
+	CASE_GET_SDRAM_PARAM(mc_video_protect_bom_adr_hi);
+	/* Specifies the value for MC_VIDEO_PROTECT_SIZE_MB */
+	CASE_GET_SDRAM_PARAM(mc_video_protect_size_mb);
+	/* Specifies the value for MC_VIDEO_PROTECT_VPR_OVERRIDE */
+	CASE_GET_SDRAM_PARAM(mc_video_protect_vpr_override);
+	/* Specifies the value for MC_VIDEO_PROTECT_VPR_OVERRIDE1 */
+	CASE_GET_SDRAM_PARAM(mc_video_protect_vpr_override1);
+	/* Specifies the value for MC_VIDEO_PROTECT_GPU_OVERRIDE_0 */
+	CASE_GET_SDRAM_PARAM(mc_video_protect_gpu_override0);
+	/* Specifies the value for MC_VIDEO_PROTECT_GPU_OVERRIDE_1 */
+	CASE_GET_SDRAM_PARAM(mc_video_protect_gpu_override1);
+	/* Specifies the value for MC_SEC_CARVEOUT_BOM */
+	CASE_GET_SDRAM_PARAM(mc_sec_carveout_bom);
+	/* Specifies the value for MC_SEC_CARVEOUT_ADR_HI */
+	CASE_GET_SDRAM_PARAM(mc_sec_carveout_adr_hi);
+	/* Specifies the value for MC_SEC_CARVEOUT_SIZE_MB */
+	CASE_GET_SDRAM_PARAM(mc_sec_carveout_size_mb);
+	/* Specifies the value for MC_VIDEO_PROTECT_REG_CTRL.VIDEO_PROTECT_WRITE_ACCESS */
+	CASE_GET_SDRAM_PARAM(mc_video_protect_write_access);
+	/* Specifies the value for MC_SEC_CARVEOUT_REG_CTRL.SEC_CARVEOUT_WRITE_ACCESS */
+	CASE_GET_SDRAM_PARAM(mc_sec_carveout_protect_write_access);
+
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_bom);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_bom_hi);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_size_128kb);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout1_cfg0);
+
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_bom);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_bom_hi);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_size_128kb);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout2_cfg0);
+
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_bom);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_bom_hi);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_size_128kb);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout3_cfg0);
+
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_bom);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_bom_hi);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_size_128kb);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout4_cfg0);
+
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_bom);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_bom_hi);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_size_128kb);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access0);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access1);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access2);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access3);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access4);
+	CASE_GET_SDRAM_PARAM(mc_generalized_carveout5_cfg0);
+
+	/* Specifies enable for CA training */
+	CASE_GET_SDRAM_PARAM(emc_ca_training_enable);
+	/* Set if bit 6 select is greater than bit 7 select); uses aremc.spec packet SWIZZLE_BIT6_GT_BIT7 */
+	CASE_GET_SDRAM_PARAM(swizzle_rank_byte_encode);
+	/* Specifies enable and offset for patched boot rom write */
+	CASE_GET_SDRAM_PARAM(boot_rom_patch_control);
+	/* Specifies data for patched boot rom write */
+	CASE_GET_SDRAM_PARAM(boot_rom_patch_data);
+
+	/* Specifies the value for MC_MTS_CARVEOUT_BOM */
+	CASE_GET_SDRAM_PARAM(mc_mts_carveout_bom);
+	/* Specifies the value for MC_MTS_CARVEOUT_ADR_HI */
+	CASE_GET_SDRAM_PARAM(mc_mts_carveout_adr_hi);
+	/* Specifies the value for MC_MTS_CARVEOUT_SIZE_MB */
+	CASE_GET_SDRAM_PARAM(mc_mts_carveout_size_mb);
+	/* Specifies the value for MC_MTS_CARVEOUT_REG_CTRL */
+	CASE_GET_SDRAM_PARAM(mc_mts_carveout_reg_ctrl);
+	DEFAULT();
+	}
+	return 0;
+}
+
+int
+t210_set_sdram_param(build_image_context *context,
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
+	/* Specifies the type of memory device */
+	CASE_SET_SDRAM_PARAM(memory_type);
+
+	/* MC/EMC clock source configuration */
+
+	/* Specifies the M value for PllM */
+	CASE_SET_SDRAM_PARAM(pllm_input_divider);
+	/* Specifies the N value for PllM */
+	CASE_SET_SDRAM_PARAM(pllm_feedback_divider);
+	/* Specifies the time to wait for PLLM to lock (in microseconds) */
+	CASE_SET_SDRAM_PARAM(pllm_stable_time);
+	/* Specifies misc. control bits */
+	CASE_SET_SDRAM_PARAM(pllm_setup_control);
+	/* Specifies the P value for PLLM */
+	CASE_SET_SDRAM_PARAM(pllm_post_divider);
+	/* Specifies value for Charge Pump Gain Control */
+	CASE_SET_SDRAM_PARAM(pllm_kcp);
+	/* Specifies VCO gain */
+	CASE_SET_SDRAM_PARAM(pllm_kvco);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare0);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare1);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare2);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare3);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare4);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare5);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare6);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare7);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare8);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare9);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare10);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare11);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare12);
+	/* Spare BCT param */
+	CASE_SET_SDRAM_PARAM(emc_bct_spare13);
+
+	/* Defines EMC_2X_CLK_SRC, EMC_2X_CLK_DIVISOR, EMC_INVERT_DCD */
+	CASE_SET_SDRAM_PARAM(emc_clock_source);
+	CASE_SET_SDRAM_PARAM(emc_clock_source_dll);
+
+	/* Defines possible override for PLLLM_MISC2 */
+	CASE_SET_SDRAM_PARAM(clk_rst_pllm_misc20_override);
+	/* enables override for PLLLM_MISC2 */
+	CASE_SET_SDRAM_PARAM(clk_rst_pllm_misc20_override_enable);
+	/* defines CLK_ENB_MC1 in register clk_rst_controller_clk_enb_w_clr */
+	CASE_SET_SDRAM_PARAM(clear_clock2_mc1);
+
+	/* Auto-calibration of EMC pads */
+
+	/* Specifies the value for EMC_AUTO_CAL_INTERVAL */
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_interval);
+	/*
+	 * Specifies the value for EMC_AUTO_CAL_CONFIG
+	 * Note: Trigger bits are set by the SDRAM code.
+	 */
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config);
+
+	/* Specifies the value for EMC_AUTO_CAL_CONFIG2 */
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config2);
+
+	/* Specifies the value for EMC_AUTO_CAL_CONFIG3 */
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config3);
+
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config4);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config5);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config6);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config7);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_config8);
+	/* Specifies the value for EMC_AUTO_CAL_VREF_SEL_0 */
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_vref_sel0);
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_vref_sel1);
+
+	/* Specifies the value for EMC_AUTO_CAL_CHANNEL */
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_channel);
+
+	/* Specifies the value for EMC_PMACRO_AUTOCAL_CFG_0 */
+	CASE_SET_SDRAM_PARAM(emc_pmacro_auto_cal_cfg0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_auto_cal_cfg1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_auto_cal_cfg2);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_rx_term);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_dq_tx_drive);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ca_tx_drive);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_cmd_tx_drive);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_auto_cal_common);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_zcrtl);
+
+	/*
+	 * Specifies the time for the calibration
+	 * to stabilize (in microseconds)
+	 */
+	CASE_SET_SDRAM_PARAM(emc_auto_cal_wait);
+
+	CASE_SET_SDRAM_PARAM(emc_xm2_comp_pad_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_xm2_comp_pad_ctrl2);
+	CASE_SET_SDRAM_PARAM(emc_xm2_comp_pad_ctrl3);
+
+	/*
+	 * DRAM size information
+	 * Specifies the value for EMC_ADR_CFG
+	 */
+	CASE_SET_SDRAM_PARAM(emc_adr_cfg);
+
+	/*
+	 * Specifies the time to wait after asserting pin
+	 * CKE (in microseconds)
+	 */
+	CASE_SET_SDRAM_PARAM(emc_pin_program_wait);
+	/* Specifies the extra delay before/after pin RESET/CKE command */
+	CASE_SET_SDRAM_PARAM(emc_pin_extra_wait);
+
+	CASE_SET_SDRAM_PARAM(emc_pin_gpio_enable);
+	CASE_SET_SDRAM_PARAM(emc_pin_gpio);
+
+	/*
+	 * Specifies the extra delay after the first writing
+	 * of EMC_TIMING_CONTROL
+	 */
+	CASE_SET_SDRAM_PARAM(emc_timing_control_wait);
+
+	/* Timing parameters required for the SDRAM */
+
+	/* Specifies the value for EMC_RC */
+	CASE_SET_SDRAM_PARAM(emc_rc);
+	/* Specifies the value for EMC_RFC */
+	CASE_SET_SDRAM_PARAM(emc_rfc);
+
+	CASE_SET_SDRAM_PARAM(emc_rfc_pb);
+	CASE_SET_SDRAM_PARAM(emc_ref_ctrl2);
+
+	/* Specifies the value for EMC_RFC_SLR */
+	CASE_SET_SDRAM_PARAM(emc_rfc_slr);
+	/* Specifies the value for EMC_RAS */
+	CASE_SET_SDRAM_PARAM(emc_ras);
+	/* Specifies the value for EMC_RP */
+	CASE_SET_SDRAM_PARAM(emc_rp);
+	/* Specifies the value for EMC_R2R */
+	CASE_SET_SDRAM_PARAM(emc_r2r);
+	/* Specifies the value for EMC_W2W */
+	CASE_SET_SDRAM_PARAM(emc_w2w);
+	/* Specifies the value for EMC_R2W */
+	CASE_SET_SDRAM_PARAM(emc_r2w);
+	/* Specifies the value for EMC_W2R */
+	CASE_SET_SDRAM_PARAM(emc_w2r);
+	/* Specifies the value for EMC_R2P */
+	CASE_SET_SDRAM_PARAM(emc_r2p);
+	/* Specifies the value for EMC_W2P */
+	CASE_SET_SDRAM_PARAM(emc_w2p);
+	/* Specifies the value for EMC_RD_RCD */
+
+	CASE_SET_SDRAM_PARAM(emc_tppd);
+	CASE_SET_SDRAM_PARAM(emc_ccdmw);
+
+	CASE_SET_SDRAM_PARAM(emc_rd_rcd);
+	/* Specifies the value for EMC_WR_RCD */
+	CASE_SET_SDRAM_PARAM(emc_wr_rcd);
+	/* Specifies the value for EMC_RRD */
+	CASE_SET_SDRAM_PARAM(emc_rrd);
+	/* Specifies the value for EMC_REXT */
+	CASE_SET_SDRAM_PARAM(emc_rext);
+	/* Specifies the value for EMC_WEXT */
+	CASE_SET_SDRAM_PARAM(emc_wext);
+	/* Specifies the value for EMC_WDV */
+	CASE_SET_SDRAM_PARAM(emc_wdv);
+
+	CASE_SET_SDRAM_PARAM(emc_wdv_chk);
+	CASE_SET_SDRAM_PARAM(emc_wsv);
+	CASE_SET_SDRAM_PARAM(emc_wev);
+
+	/* Specifies the value for EMC_WDV_MASK */
+	CASE_SET_SDRAM_PARAM(emc_wdv_mask);
+
+	CASE_SET_SDRAM_PARAM(emc_ws_duration);
+	CASE_SET_SDRAM_PARAM(emc_we_duration);
+
+	/* Specifies the value for EMC_QUSE */
+	CASE_SET_SDRAM_PARAM(emc_quse);
+	/* Specifies the value for EMC_QUSE_WIDTH */
+	CASE_SET_SDRAM_PARAM(emc_quse_width);
+	/* Specifies the value for EMC_IBDLY */
+	CASE_SET_SDRAM_PARAM(emc_ibdly);
+
+	CASE_SET_SDRAM_PARAM(emc_obdly);
+
+	/* Specifies the value for EMC_EINPUT */
+	CASE_SET_SDRAM_PARAM(emc_einput);
+	/* Specifies the value for EMC_EINPUT_DURATION */
+	CASE_SET_SDRAM_PARAM(emc_einput_duration);
+	/* Specifies the value for EMC_PUTERM_EXTRA */
+	CASE_SET_SDRAM_PARAM(emc_puterm_extra);
+	/* Specifies the value for EMC_PUTERM_WIDTH */
+	CASE_SET_SDRAM_PARAM(emc_puterm_width);
+
+	CASE_SET_SDRAM_PARAM(emc_qrst);
+	CASE_SET_SDRAM_PARAM(emc_qsafe);
+	CASE_SET_SDRAM_PARAM(emc_rdv);
+	CASE_SET_SDRAM_PARAM(emc_rdv_mask);
+
+	CASE_SET_SDRAM_PARAM(emc_rdv_early);
+	CASE_SET_SDRAM_PARAM(emc_rdv_early_mask);
+
+	/* Specifies the value for EMC_QPOP */
+	CASE_SET_SDRAM_PARAM(emc_qpop);
+
+	/* Specifies the value for EMC_REFRESH */
+	CASE_SET_SDRAM_PARAM(emc_refresh);
+	/* Specifies the value for EMC_BURST_REFRESH_NUM */
+	CASE_SET_SDRAM_PARAM(emc_burst_refresh_num);
+	/* Specifies the value for EMC_PRE_REFRESH_REQ_CNT */
+	CASE_SET_SDRAM_PARAM(emc_prerefresh_req_cnt);
+	/* Specifies the value for EMC_PDEX2WR */
+	CASE_SET_SDRAM_PARAM(emc_pdex2wr);
+	/* Specifies the value for EMC_PDEX2RD */
+	CASE_SET_SDRAM_PARAM(emc_pdex2rd);
+	/* Specifies the value for EMC_PCHG2PDEN */
+	CASE_SET_SDRAM_PARAM(emc_pchg2pden);
+	/* Specifies the value for EMC_ACT2PDEN */
+	CASE_SET_SDRAM_PARAM(emc_act2pden);
+	/* Specifies the value for EMC_AR2PDEN */
+	CASE_SET_SDRAM_PARAM(emc_ar2pden);
+	/* Specifies the value for EMC_RW2PDEN */
+	CASE_SET_SDRAM_PARAM(emc_rw2pden);
+
+	CASE_SET_SDRAM_PARAM(emc_cke2pden);
+	CASE_SET_SDRAM_PARAM(emc_pdex2che);
+	CASE_SET_SDRAM_PARAM(emc_pdex2mrr);
+
+	/* Specifies the value for EMC_TXSR */
+	CASE_SET_SDRAM_PARAM(emc_txsr);
+	/* Specifies the value for EMC_TXSRDLL */
+	CASE_SET_SDRAM_PARAM(emc_txsr_dll);
+	/* Specifies the value for EMC_TCKE */
+	CASE_SET_SDRAM_PARAM(emc_tcke);
+	/* Specifies the value for EMC_TCKESR */
+	CASE_SET_SDRAM_PARAM(emc_tckesr);
+	/* Specifies the value for EMC_TPD */
+	CASE_SET_SDRAM_PARAM(emc_tpd);
+	/* Specifies the value for EMC_TFAW */
+	CASE_SET_SDRAM_PARAM(emc_tfaw);
+	/* Specifies the value for EMC_TRPAB */
+	CASE_SET_SDRAM_PARAM(emc_trpab);
+	/* Specifies the value for EMC_TCLKSTABLE */
+	CASE_SET_SDRAM_PARAM(emc_tclkstable);
+	/* Specifies the value for EMC_TCLKSTOP */
+	CASE_SET_SDRAM_PARAM(emc_tclkstop);
+	/* Specifies the value for EMC_TREFBW */
+	CASE_SET_SDRAM_PARAM(emc_trefbw);
+
+	/* FBIO configuration values */
+
+	/* Specifies the value for EMC_FBIO_CFG5 */
+	CASE_SET_SDRAM_PARAM(emc_fbio_cfg5);
+	/* Specifies the value for EMC_FBIO_CFG7 */
+	CASE_SET_SDRAM_PARAM(emc_fbio_cfg7);
+	CASE_SET_SDRAM_PARAM(emc_fbio_cfg8);
+
+	/* Command mapping for CMD brick 0 */
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd0_0);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd0_1);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd0_2);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd1_0);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd1_1);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd1_2);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd2_0);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd2_1);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd2_2);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd3_0);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd3_1);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_cmd3_2);
+	CASE_SET_SDRAM_PARAM(emc_cmd_mapping_byte);
+
+	/* Specifies the value for EMC_FBIO_SPARE */
+	CASE_SET_SDRAM_PARAM(emc_fbio_spare);
+
+	/* Specifies the value for EMC_CFG_RSV */
+	CASE_SET_SDRAM_PARAM(emc_cfg_rsv);
+
+	/* MRS command values */
+
+	/* Specifies the value for EMC_MRS */
+	CASE_SET_SDRAM_PARAM(emc_mrs);
+	/* Specifies the MP0 command to initialize mode registers */
+	CASE_SET_SDRAM_PARAM(emc_emrs);
+	/* Specifies the MP2 command to initialize mode registers */
+	CASE_SET_SDRAM_PARAM(emc_emrs2);
+	/* Specifies the MP3 command to initialize mode registers */
+	CASE_SET_SDRAM_PARAM(emc_emrs3);
+	/* Specifies the programming to LPDDR2 Mode Register 1 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw1);
+	/* Specifies the programming to LPDDR2 Mode Register 2 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw2);
+	/* Specifies the programming to LPDDR2 Mode Register 3 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw3);
+	/* Specifies the programming to LPDDR2 Mode Register 11 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw4);
+
+	/* Specifies the programming to LPDDR4 Mode Register 3 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw6);
+	/* Specifies the programming to LPDDR4 Mode Register 11 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw8);
+	/* Specifies the programming to LPDDR4 Mode Register 11 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw9);
+	/* Specifies the programming to LPDDR4 Mode Register 12 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw10);
+	/* Specifies the programming to LPDDR4 Mode Register 14 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw12);
+	/* Specifies the programming to LPDDR4 Mode Register 14 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw13);
+	/* Specifies the programming to LPDDR4 Mode Register 22 at cold boot */
+	CASE_SET_SDRAM_PARAM(emc_mrw14);
+
+	/*
+	 * Specifies the programming to extra LPDDR2 Mode Register
+	 * at cold boot
+	 */
+	CASE_SET_SDRAM_PARAM(emc_mrw_extra);
+	/*
+	 * Specifies the programming to extra LPDDR2 Mode Register
+	 * at warm boot
+	 */
+	CASE_SET_SDRAM_PARAM(emc_warm_boot_mrw_extra);
+	/*
+	 * Specify the enable of extra Mode Register programming at
+	 * warm boot
+	 */
+	CASE_SET_SDRAM_PARAM(emc_warm_boot_extramode_reg_write_enable);
+	/*
+	 * Specify the enable of extra Mode Register programming at
+	 * cold boot
+	 */
+	CASE_SET_SDRAM_PARAM(emc_extramode_reg_write_enable);
+
+	/* Specifies the EMC_MRW reset command value */
+	CASE_SET_SDRAM_PARAM(emc_mrw_reset_command);
+	/* Specifies the EMC Reset wait time (in microseconds) */
+	CASE_SET_SDRAM_PARAM(emc_mrw_reset_ninit_wait);
+	/* Specifies the value for EMC_MRS_WAIT_CNT */
+	CASE_SET_SDRAM_PARAM(emc_mrs_wait_cnt);
+	/* Specifies the value for EMC_MRS_WAIT_CNT2 */
+	CASE_SET_SDRAM_PARAM(emc_mrs_wait_cnt2);
+
+	/* EMC miscellaneous configurations */
+
+	/* Specifies the value for EMC_CFG */
+	CASE_SET_SDRAM_PARAM(emc_cfg);
+	/* Specifies the value for EMC_CFG_2 */
+	CASE_SET_SDRAM_PARAM(emc_cfg2);
+	/* Specifies the pipe bypass controls */
+	CASE_SET_SDRAM_PARAM(emc_cfg_pipe);
+
+	CASE_SET_SDRAM_PARAM(emc_cfg_pipe_clk);
+	CASE_SET_SDRAM_PARAM(emc_fdpd_ctrl_cmd_no_ramp);
+	CASE_SET_SDRAM_PARAM(emc_cfg_update);
+
+	/* Specifies the value for EMC_DBG */
+	CASE_SET_SDRAM_PARAM(emc_dbg);
+
+	CASE_SET_SDRAM_PARAM(emc_dbg_write_mux);
+
+	/* Specifies the value for EMC_CMDQ */
+	CASE_SET_SDRAM_PARAM(emc_cmd_q);
+	/* Specifies the value for EMC_MC2EMCQ */
+	CASE_SET_SDRAM_PARAM(emc_mc2emc_q);
+	/* Specifies the value for EMC_DYN_SELF_REF_CONTROL */
+	CASE_SET_SDRAM_PARAM(emc_dyn_self_ref_control);
+
+	/* Specifies the value for MEM_INIT_DONE */
+	CASE_SET_SDRAM_PARAM(ahb_arbitration_xbar_ctrl_meminit_done);
+
+	/* Specifies the value for EMC_CFG_DIG_DLL */
+	CASE_SET_SDRAM_PARAM(emc_cfg_dig_dll);
+	CASE_SET_SDRAM_PARAM(emc_cfg_dig_dll_1);
+
+	/* Specifies the value for EMC_CFG_DIG_DLL_PERIOD */
+	CASE_SET_SDRAM_PARAM(emc_cfg_dig_dll_period);
+	/* Specifies the value of *DEV_SELECTN of various EMC registers */
+	CASE_SET_SDRAM_PARAM(emc_dev_select);
+
+	/* Specifies the value for EMC_SEL_DPD_CTRL */
+	CASE_SET_SDRAM_PARAM(emc_sel_dpd_ctrl);
+
+	/* Pads trimmer delays */
+	CASE_SET_SDRAM_PARAM(emc_fdpd_ctrl_dq);
+	CASE_SET_SDRAM_PARAM(emc_fdpd_ctrl_cmd);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_vref_dq_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_vref_dq_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_vref_dqs_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_vref_dqs_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_rxrt);
+	CASE_SET_SDRAM_PARAM(emc_cfg_pipe1);
+	CASE_SET_SDRAM_PARAM(emc_cfg_pipe2);
+
+	/* Specifies the value for EMC_PMACRO_QUSE_DDLL_RANK0_0 */
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank0_5);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_quse_ddll_rank1_5);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank0_5);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dq_rank1_5);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank0_5);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ob_ddll_long_dqs_rank1_5);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank0_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank0_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank0_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank0_3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank1_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank1_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank1_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ib_ddll_long_dqs_rank1_3);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_long_cmd_4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_short_cmd_0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_short_cmd_1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_short_cmd_2);
+
+	/*
+	 * Specifies the delay after asserting CKE pin during a WarmBoot0
+	 * sequence (in microseconds)
+	 */
+	CASE_SET_SDRAM_PARAM(warm_boot_wait);
+
+	/* Specifies the value for EMC_ODT_WRITE */
+	CASE_SET_SDRAM_PARAM(emc_odt_write);
+
+	/* Periodic ZQ calibration */
+
+	/*
+	 * Specifies the value for EMC_ZCAL_INTERVAL
+	 * Value 0 disables ZQ calibration
+	 */
+	CASE_SET_SDRAM_PARAM(emc_zcal_interval);
+	/* Specifies the value for EMC_ZCAL_WAIT_CNT */
+	CASE_SET_SDRAM_PARAM(emc_zcal_wait_cnt);
+	/* Specifies the value for EMC_ZCAL_MRW_CMD */
+	CASE_SET_SDRAM_PARAM(emc_zcal_mrw_cmd);
+
+	/* DRAM initialization sequence flow control */
+
+	/* Specifies the MRS command value for resetting DLL */
+	CASE_SET_SDRAM_PARAM(emc_mrs_reset_dll);
+	/* Specifies the command for ZQ initialization of device 0 */
+	CASE_SET_SDRAM_PARAM(emc_zcal_init_dev0);
+	/* Specifies the command for ZQ initialization of device 1 */
+	CASE_SET_SDRAM_PARAM(emc_zcal_init_dev1);
+	/*
+	 * Specifies the wait time after programming a ZQ initialization
+	 * command (in microseconds)
+	 */
+	CASE_SET_SDRAM_PARAM(emc_zcal_init_wait);
+	/*
+	 * Specifies the enable for ZQ calibration at cold boot [bit 0]
+	 * and warm boot [bit 1]
+	 */
+	CASE_SET_SDRAM_PARAM(emc_zcal_warm_cold_boot_enables);
+
+	/*
+	 * Specifies the MRW command to LPDDR2 for ZQ calibration
+	 * on warmboot
+	 */
+	/* Is issued to both devices separately */
+	CASE_SET_SDRAM_PARAM(emc_mrw_lpddr2zcal_warm_boot);
+	/*
+	 * Specifies the ZQ command to DDR3 for ZQ calibration on warmboot
+	 * Is issued to both devices separately
+	 */
+	CASE_SET_SDRAM_PARAM(emc_zqcal_ddr3_warm_boot);
+
+	CASE_SET_SDRAM_PARAM(emc_zqcal_lpddr4_warm_boot);
+
+	/*
+	 * Specifies the wait time for ZQ calibration on warmboot
+	 * (in microseconds)
+	 */
+	CASE_SET_SDRAM_PARAM(emc_zcal_warm_boot_wait);
+	/*
+	 * Specifies the enable for DRAM Mode Register programming
+	 * at warm boot
+	 */
+	CASE_SET_SDRAM_PARAM(emc_mrs_warm_boot_enable);
+	/*
+	 * Specifies the wait time after sending an MRS DLL reset command
+	 * in microseconds)
+	 */
+	CASE_SET_SDRAM_PARAM(emc_mrs_reset_dll_wait);
+	/* Specifies the extra MRS command to initialize mode registers */
+	CASE_SET_SDRAM_PARAM(emc_mrs_extra);
+	/* Specifies the extra MRS command at warm boot */
+	CASE_SET_SDRAM_PARAM(emc_warm_boot_mrs_extra);
+	/* Specifies the EMRS command to enable the DDR2 DLL */
+	CASE_SET_SDRAM_PARAM(emc_emrs_ddr2_dll_enable);
+	/* Specifies the MRS command to reset the DDR2 DLL */
+	CASE_SET_SDRAM_PARAM(emc_mrs_ddr2_dll_reset);
+	/* Specifies the EMRS command to set OCD calibration */
+	CASE_SET_SDRAM_PARAM(emc_emrs_ddr2_ocd_calib);
+	/*
+	 * Specifies the wait between initializing DDR and setting OCD
+	 * calibration (in microseconds)
+	 */
+	CASE_SET_SDRAM_PARAM(emc_ddr2_wait);
+	/* Specifies the value for EMC_CLKEN_OVERRIDE */
+	CASE_SET_SDRAM_PARAM(emc_clken_override);
+	/*
+	 * Specifies LOG2 of the extra refresh numbers after booting
+	 * Program 0 to disable
+	 */
+	CASE_SET_SDRAM_PARAM(emc_extra_refresh_num);
+	/* Specifies the master override for all EMC clocks */
+	CASE_SET_SDRAM_PARAM(emc_clken_override_allwarm_boot);
+	/* Specifies the master override for all MC clocks */
+	CASE_SET_SDRAM_PARAM(mc_clken_override_allwarm_boot);
+	/* Specifies digital dll period, choosing between 4 to 64 ms */
+	CASE_SET_SDRAM_PARAM(emc_cfg_dig_dll_period_warm_boot);
+
+	/* Pad controls */
+
+	/* Specifies the value for PMC_VDDP_SEL */
+	CASE_SET_SDRAM_PARAM(pmc_vddp_sel);
+	/* Specifies the wait time after programming PMC_VDDP_SEL */
+	CASE_SET_SDRAM_PARAM(pmc_vddp_sel_wait);
+	/* Specifies the value for PMC_DDR_PWR */
+	CASE_SET_SDRAM_PARAM(pmc_ddr_pwr);
+	/* Specifies the value for PMC_DDR_CFG */
+	CASE_SET_SDRAM_PARAM(pmc_ddr_cfg);
+	/* Specifies the value for PMC_IO_DPD3_REQ */
+	CASE_SET_SDRAM_PARAM(pmc_io_dpd3_req);
+	/* Specifies the wait time after programming PMC_IO_DPD3_REQ */
+	CASE_SET_SDRAM_PARAM(pmc_io_dpd3_req_wait);
+
+	CASE_SET_SDRAM_PARAM(pmc_io_dpd4_req_wait);
+
+	/* Specifies the value for PMC_REG_SHORT */
+	CASE_SET_SDRAM_PARAM(pmc_reg_short);
+	/* Specifies the value for PMC_NO_IOPOWER */
+	CASE_SET_SDRAM_PARAM(pmc_no_io_power);
+
+	CASE_SET_SDRAM_PARAM(pmc_ddr_ctrl_wait);
+	CASE_SET_SDRAM_PARAM(pmc_ddr_ctrl);
+
+	/* Specifies the value for EMC_ACPD_CONTROL */
+	CASE_SET_SDRAM_PARAM(emc_acpd_control);
+
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE0 */
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte0);
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE1 */
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte1);
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE2 */
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte2);
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE3 */
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank0_byte3);
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE0 */
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte0);
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE1 */
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte1);
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE2 */
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte2);
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE3 */
+	CASE_SET_SDRAM_PARAM(emc_swizzle_rank1_byte3);
+
+	/* Specifies the value for EMC_TXDSRVTTGEN */
+	CASE_SET_SDRAM_PARAM(emc_txdsrvttgen);
+
+	/* Specifies the value for EMC_DATA_BRLSHFT_0 */
+	CASE_SET_SDRAM_PARAM(emc_data_brlshft0);
+	CASE_SET_SDRAM_PARAM(emc_data_brlshft1);
+
+	CASE_SET_SDRAM_PARAM(emc_dqs_brlshft0);
+	CASE_SET_SDRAM_PARAM(emc_dqs_brlshft1);
+
+	CASE_SET_SDRAM_PARAM(emc_cmd_brlshft0);
+	CASE_SET_SDRAM_PARAM(emc_cmd_brlshft1);
+	CASE_SET_SDRAM_PARAM(emc_cmd_brlshft2);
+	CASE_SET_SDRAM_PARAM(emc_cmd_brlshft3);
+
+	CASE_SET_SDRAM_PARAM(emc_quse_brlshft0);
+	CASE_SET_SDRAM_PARAM(emc_quse_brlshft1);
+	CASE_SET_SDRAM_PARAM(emc_quse_brlshft2);
+	CASE_SET_SDRAM_PARAM(emc_quse_brlshft3);
+
+	CASE_SET_SDRAM_PARAM(emc_dll_cfg0);
+	CASE_SET_SDRAM_PARAM(emc_dll_cfg1);
+
+	CASE_SET_SDRAM_PARAM(emc_pmc_scratch1);
+	CASE_SET_SDRAM_PARAM(emc_pmc_scratch2);
+	CASE_SET_SDRAM_PARAM(emc_pmc_scratch3);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_pad_cfg_ctrl);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_vttgen_ctrl0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_vttgen_ctrl1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_vttgen_ctrl2);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_brick_ctrl_rfu1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_cmd_brick_ctrl_fdpd);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_brick_ctrl_rfu2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_data_brick_ctrl_fdpd);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_bg_bias_ctrl0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_data_pad_rx_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_cmd_pad_rx_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_data_rx_term_mode);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_cmd_rx_term_mode);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_data_pad_tx_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_common_pad_tx_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_cmd_pad_tx_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_cfg3);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_pwrd0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_pwrd1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_pwrd2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_pwrd3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_pwrd4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_pwrd5);
+
+	CASE_SET_SDRAM_PARAM(emc_config_sample_delay);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_brick_mapping0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_brick_mapping1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_brick_mapping2);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src2);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src3);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src4);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_tx_sel_clk_src5);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_bypass);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_pwrd0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_pwrd1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_ddll_pwrd2);
+
+	CASE_SET_SDRAM_PARAM(emc_pmacro_cmd_ctrl0);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_cmd_ctrl1);
+	CASE_SET_SDRAM_PARAM(emc_pmacro_cmd_ctrl2);
+
+	/* DRAM size information */
+
+	/* Specifies the value for MC_EMEM_ADR_CFG */
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg);
+	/* Specifies the value for MC_EMEM_ADR_CFG_DEV0 */
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_dev0);
+	/* Specifies the value for MC_EMEM_ADR_CFG_DEV1 */
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_dev1);
+
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_channel_mask);
+
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG0 */
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask0);
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG1 */
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask1);
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG2 */
+	CASE_SET_SDRAM_PARAM(mc_emem_adr_cfg_bank_mask2);
+
+	/*
+	 * Specifies the value for MC_EMEM_CFG which holds the external memory
+	 * size (in KBytes)
+	 */
+	CASE_SET_SDRAM_PARAM(mc_emem_cfg);
+
+	/* MC arbitration configuration */
+
+	/* Specifies the value for MC_EMEM_ARB_CFG */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_cfg);
+	/* Specifies the value for MC_EMEM_ARB_OUTSTANDING_REQ */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_outstanding_req);
+
+	CASE_SET_SDRAM_PARAM(emc_emem_arb_refpb_hp_ctrl);
+	CASE_SET_SDRAM_PARAM(emc_emem_arb_refpb_bank_ctrl);
+
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RCD */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rcd);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RP */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rp);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RC */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rc);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RAS */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_ras);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_FAW */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_faw);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RRD */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rrd);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_RAP2PRE */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rap2pre);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_WAP2PRE */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_wap2pre);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_R2R */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_r2r);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_W2W */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_w2w);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_R2W */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_r2w);
+	/* Specifies the value for MC_EMEM_ARB_TIMING_W2R */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_w2r);
+
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_rfcpb);
+
+	/* Specifies the value for MC_EMEM_ARB_DA_TURNS */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_da_turns);
+	/* Specifies the value for MC_EMEM_ARB_DA_COVERS */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_da_covers);
+	/* Specifies the value for MC_EMEM_ARB_MISC0 */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_misc0);
+	/* Specifies the value for MC_EMEM_ARB_MISC1 */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_misc1);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_misc2);
+
+	/* Specifies the value for MC_EMEM_ARB_RING1_THROTTLE */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_ring1_throttle);
+	/* Specifies the value for MC_EMEM_ARB_OVERRIDE */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_override);
+	/* Specifies the value for MC_EMEM_ARB_OVERRIDE_1 */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_override1);
+	/* Specifies the value for MC_EMEM_ARB_RSV */
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_rsv);
+
+	CASE_SET_SDRAM_PARAM(mc_da_cfg0);
+	CASE_SET_SDRAM_PARAM(mc_emem_arb_timing_ccdmw);
+
+	/* Specifies the value for MC_CLKEN_OVERRIDE */
+	CASE_SET_SDRAM_PARAM(mc_clken_override);
+
+	/* Specifies the value for MC_STAT_CONTROL */
+	CASE_SET_SDRAM_PARAM(mc_stat_control);
+	/* Specifies the value for MC_VIDEO_PROTECT_BOM */
+	CASE_SET_SDRAM_PARAM(mc_video_protect_bom);
+	/* Specifies the value for MC_VIDEO_PROTECT_BOM_ADR_HI */
+	CASE_SET_SDRAM_PARAM(mc_video_protect_bom_adr_hi);
+	/* Specifies the value for MC_VIDEO_PROTECT_SIZE_MB */
+	CASE_SET_SDRAM_PARAM(mc_video_protect_size_mb);
+	/* Specifies the value for MC_VIDEO_PROTECT_VPR_OVERRIDE */
+	CASE_SET_SDRAM_PARAM(mc_video_protect_vpr_override);
+	/* Specifies the value for MC_VIDEO_PROTECT_VPR_OVERRIDE1 */
+	CASE_SET_SDRAM_PARAM(mc_video_protect_vpr_override1);
+	/* Specifies the value for MC_VIDEO_PROTECT_GPU_OVERRIDE_0 */
+	CASE_SET_SDRAM_PARAM(mc_video_protect_gpu_override0);
+	/* Specifies the value for MC_VIDEO_PROTECT_GPU_OVERRIDE_1 */
+	CASE_SET_SDRAM_PARAM(mc_video_protect_gpu_override1);
+	/* Specifies the value for MC_SEC_CARVEOUT_BOM */
+	CASE_SET_SDRAM_PARAM(mc_sec_carveout_bom);
+	/* Specifies the value for MC_SEC_CARVEOUT_ADR_HI */
+	CASE_SET_SDRAM_PARAM(mc_sec_carveout_adr_hi);
+	/* Specifies the value for MC_SEC_CARVEOUT_SIZE_MB */
+	CASE_SET_SDRAM_PARAM(mc_sec_carveout_size_mb);
+	/* Specifies the value for MC_VIDEO_PROTECT_REG_CTRL.VIDEO_PROTECT_WRITE_ACCESS */
+	CASE_SET_SDRAM_PARAM(mc_video_protect_write_access);
+	/* Specifies the value for MC_SEC_CARVEOUT_REG_CTRL.SEC_CARVEOUT_WRITE_ACCESS */
+	CASE_SET_SDRAM_PARAM(mc_sec_carveout_protect_write_access);
+
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_bom);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_bom_hi);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_size_128kb);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_force_internal_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout1_cfg0);
+
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_bom);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_bom_hi);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_size_128kb);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_force_internal_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout2_cfg0);
+
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_bom);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_bom_hi);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_size_128kb);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_force_internal_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout3_cfg0);
+
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_bom);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_bom_hi);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_size_128kb);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_force_internal_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout4_cfg0);
+
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_bom);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_bom_hi);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_size_128kb);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access0);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access1);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access2);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access3);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_force_internal_access4);
+	CASE_SET_SDRAM_PARAM(mc_generalized_carveout5_cfg0);
+
+	/* Specifies enable for CA training */
+	CASE_SET_SDRAM_PARAM(emc_ca_training_enable);
+	/* Set if bit 6 select is greater than bit 7 select); uses aremc.spec packet SWIZZLE_BIT6_GT_BIT7 */
+	CASE_SET_SDRAM_PARAM(swizzle_rank_byte_encode);
+	/* Specifies enable and offset for patched boot rom write */
+	CASE_SET_SDRAM_PARAM(boot_rom_patch_control);
+	/* Specifies data for patched boot rom write */
+	CASE_SET_SDRAM_PARAM(boot_rom_patch_data);
+
+	/* Specifies the value for MC_MTS_CARVEOUT_BOM */
+	CASE_SET_SDRAM_PARAM(mc_mts_carveout_bom);
+	/* Specifies the value for MC_MTS_CARVEOUT_ADR_HI */
+	CASE_SET_SDRAM_PARAM(mc_mts_carveout_adr_hi);
+	/* Specifies the value for MC_MTS_CARVEOUT_SIZE_MB */
+	CASE_SET_SDRAM_PARAM(mc_mts_carveout_size_mb);
+	/* Specifies the value for MC_MTS_CARVEOUT_REG_CTRL */
+	CASE_SET_SDRAM_PARAM(mc_mts_carveout_reg_ctrl);
+
+	DEFAULT();
+	}
+	return 0;
+}
+
+int
+t210_getbl_param(u_int32_t set,
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
+t210_setbl_param(u_int32_t set,
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
+t210_bct_get_value(parse_token id, void *data, u_int8_t *bct)
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
+	CASE_GET_NVU32(secure_debug_control);
+
+	case token_block_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->block_size_log2;
+		break;
+
+	case token_page_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->page_size_log2;
+		break;
+
+	/*
+	 * Constants.
+	 */
+	CASE_GET_CONST(bootloaders_max,   NVBOOT_MAX_BOOTLOADERS);
+	CASE_GET_CONST(reserved_size,     NVBOOT_BCT_RESERVED_SIZE);
+	case token_crypto_hash:
+		memcpy(data,
+		&(bct_ptr->signature.crypto_hash),
+		sizeof(nvboot_hash));
+		break;
+
+	case token_unique_chip_id:
+		memcpy(data, &(bct_ptr->unique_chip_id), sizeof(nvboot_ecid));
+		break;
+
+	case token_reserved_offset:
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
+				- (u_int8_t *)&samplebct;
+		break;
+
+	case token_bct_size:
+		*((u_int32_t *)data) = sizeof(nvboot_config_table);
+		break;
+
+	CASE_GET_CONST(hash_size, sizeof(nvboot_hash));
+
+	case token_crypto_offset:
+		/* Offset to region in BCT to encrypt & sign */
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.random_aes_blk)
+				- (u_int8_t *)&samplebct;
+		break;
+
+	case token_crypto_length:
+		/* size of region in BCT to encrypt & sign */
+		*((u_int32_t *)data) = (u_int8_t *)bct_ptr + sizeof(nvboot_config_table)
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
+	CASE_GET_CONST_PREFIX(memory_type_lpddr4, nvboot);
+
+	default:
+		return -ENODATA;
+	}
+	return 0;
+}
+
+int
+t210_bct_set_value(parse_token id, void *data, u_int8_t *bct)
+{
+	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
+
+	if (data == NULL || bct == NULL)
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
+	CASE_SET_NVU32(secure_debug_control);
+	case token_unique_chip_id:
+		memcpy(&bct_ptr->unique_chip_id, data, sizeof(nvboot_ecid));
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
+t210_bct_set_data(parse_token id,
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
+int t210_get_bct_size()
+{
+	return sizeof(nvboot_config_table);
+}
+
+int t210_bct_token_supported(parse_token token)
+{
+	int index;
+
+	for (index = 0; index < ARRAY_SIZE(t210_root_token_list); index++)
+		if (t210_root_token_list[index] == token)
+			return 1;
+
+	return 0;
+}
+
+void t210_init_bad_block_table(build_image_context *context)
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
+cbootimage_soc_config tegra210_config = {
+	.init_bad_block_table		= t210_init_bad_block_table,
+	.set_dev_param				= t210_set_dev_param,
+	.get_dev_param				= t210_get_dev_param,
+	.set_sdram_param			= t210_set_sdram_param,
+	.get_sdram_param			= t210_get_sdram_param,
+	.setbl_param				= t210_setbl_param,
+	.getbl_param				= t210_getbl_param,
+	.set_value					= t210_bct_set_value,
+	.get_value					= t210_bct_get_value,
+	.set_data					= t210_bct_set_data,
+	.get_bct_size				= t210_get_bct_size,
+	.token_supported			= t210_bct_token_supported,
+
+	.devtype_table				= s_devtype_table_t210,
+	.sdmmc_data_width_table		= s_sdmmc_data_width_table_t210,
+	.spi_clock_source_table		= s_spi_clock_source_table_t210,
+	.nvboot_memory_type_table	= s_nvboot_memory_type_table_t210,
+	.sdram_field_table			= s_sdram_field_table_t210,
+	.nand_table					= 0,
+	.sdmmc_table				= s_sdmmc_table_t210,
+	.spiflash_table				= s_spiflash_table_t210,
+	.device_type_table			= s_device_type_table_t210,
+};
+
+void t210_get_soc_config(build_image_context *context,
+	cbootimage_soc_config **soc_config)
+{
+	context->boot_data_version = BOOTDATA_VERSION_T210;
+	*soc_config = &tegra210_config;
+}
+
+int if_bct_is_t210_get_soc_config(build_image_context *context,
+	cbootimage_soc_config **soc_config)
+{
+	nvboot_config_table *bct = (nvboot_config_table*) context->bct;
+
+	if (bct->boot_data_version == BOOTDATA_VERSION_T210) {
+		t210_get_soc_config(context, soc_config);
+		return 1;
+	}
+	return 0;
+}
diff --git a/src/t210/nvboot_bct_t210.h b/src/t210/nvboot_bct_t210.h
new file mode 100644
index 000000000000..90841f63feb6
--- /dev/null
+++ b/src/t210/nvboot_bct_t210.h
@@ -0,0 +1,406 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
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
+#ifndef INCLUDED_NVBOOT_BCT_T210_H
+#define INCLUDED_NVBOOT_BCT_T210_H
+
+#include <sys/types.h>
+#include "nvboot_sdram_param_t210.h"
+
+/**
+ * Defines the number of 32-bit words in the customer_data area of the BCT.
+ */
+#define NVBOOT_BCT_CUSTOMER_DATA_WORDS		49
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
+#define NVBOOT_BCT_RESERVED_SIZE		18
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
+#define NVBOOT_BCT_MAX_PARAM_SETS		1
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
+#define ARSE_RSA_MAX_MODULUS_SIZE	2048
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
+	 * Specifies the AES-CMAC signature for the rest of the BCT structure
+	 * if symmetric key encryption secure boot scheme is used.
+	 */
+	nvboot_hash crypto_hash;
+
+	/*
+	 * Specifies the RSASSA-PSS signature for the rest of the BCT structure
+	 * if public key cryptography secure boot scheme is used.
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
+enum {NVBOOT_SE_AES_KEY256_LENGTH_BYTES = 32};
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
+	nvboot_object_signature signature;		/* 310 */
+
+	/**
+	 * Specifies the Factory Secure Provisioning number to be used.
+	 * Only valid and consumed by BR in NvProduction Mode.
+	 * Because the key number is specified in the BCT, BR needs to read in
+	 * the BCT first to know the key number to validate against.
+	 * This field must match SecProvisioningKeyNum_Secure to be a valid
+	 * BCT for use in the Factory Secure Provisioning mode.
+	 */
+	u_int32_t secure_provisioning_key_number_insecure;	/* 420 */
+
+	/**
+	 * A 256-bit AES key encrypted by a reserved 256-bit AES "key wrap"
+	 * key. Only used in Factory Secure Provisioning mode.
+	 */
+	u_int8_t aes_key[NVBOOT_SE_AES_KEY256_LENGTH_BYTES];	/* 424 */
+
+	u_int8_t customer_data[NVBOOT_BCT_CUSTOMER_DATA_SIZE];	/* 444 */
+	u_int32_t odm_data;					/* 508 */
+	u_int32_t reserved1;
+
+	/* START OF SIGNED SECTION OF THE BCT */
+	nvboot_hash random_aes_blk;			/* 0x510 */
+	nvboot_ecid unique_chip_id;			/* 0x520 */
+	u_int32_t boot_data_version;			/* 0x530 */
+	u_int32_t block_size_log2;
+	u_int32_t page_size_log2;
+	u_int32_t partition_size;
+	u_int32_t num_param_sets;
+	nvboot_dev_type dev_type[NVBOOT_BCT_MAX_PARAM_SETS];
+	nvboot_dev_params dev_params[NVBOOT_BCT_MAX_PARAM_SETS];
+	u_int32_t num_sdram_sets;			/* 0x588 */
+	nvboot_sdram_params sdram_params[NVBOOT_BCT_MAX_SDRAM_SETS]; /* 0x58c */
+
+	u_int32_t bootloader_used;				/* 0x232c */
+	nv_bootloader_info bootloader[NVBOOT_MAX_BOOTLOADERS];	/* 0x2330 */
+
+	u_int8_t enable_fail_back;
+
+	/**
+	 * Specifies which debug features to be enabled or disabled.
+	 * Maps directly to APBDEV_PMC_DEBUG_AUTHENTICATION_0. Must specify
+	 * the ECID of the chip in UniqueChipId on production systems.
+	 * 0x1 = ENABLED. 0x0 = DISABLED.
+	 * DBGEN - bit 5
+	 * NIDEN - bit 4
+	 * SPIDEN - bit 3
+	 * SPNIDEN - bit 2
+	 * DEVICEEN - bit 1
+	 * JTAG_ENABLE - bit 0
+	 */
+	u_int32_t secure_debug_control;
+
+	/**
+	 * Specifies the factory secure provisioning key number to use.
+	 * There are 64 such 256-bit AES keys.
+	 *
+	 * Specifying a key number of 0 will cause Boot ROM to default to
+	 * NvProduction mode boot (i.e. Factory Secure Provisioning mode
+	 * disabled).
+	 *
+	 * Specifying a key number of 1 to 15 is invalid. These are
+	 * anti-cloning keys numbers and BR will ignore these values.
+	 * BR will ignore this field if the secure_provision_index fuse is
+	 * burned.
+	 *
+	 * Key number 64 (index [63]) is reserved for NVIDIA debug use.
+	 * So, this field will only be used if the chip is in NvProductionMode,
+	 * and when secure_provision_index is zero, and when
+	 * SecProvisioningKeyNum is not 0 to 15.
+	 *
+	 * This key number must match SecProvisioningKeyNum_Insecure.
+	 */
+	u_int32_t secure_provisioning_key_number_secure;
+
+	u_int8_t reserved[NVBOOT_BCT_RESERVED_SIZE];
+} nvboot_config_table;
+#endif /* #ifndef INCLUDED_NVBOOT_BCT_T210_H */
diff --git a/src/t210/nvboot_sdram_param_t210.h b/src/t210/nvboot_sdram_param_t210.h
new file mode 100644
index 000000000000..c4671e48d66a
--- /dev/null
+++ b/src/t210/nvboot_sdram_param_t210.h
@@ -0,0 +1,953 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
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
+#ifndef INCLUDED_NVBOOT_SDRAM_PARAM_T210_H
+#define INCLUDED_NVBOOT_SDRAM_PARAM_T210_H
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
+	/* Specifies the memory type to be LPDDR4 SDRAM */
+	nvboot_memory_type_lpddr4,
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
+	/* Specifies the P value for PLLM */
+	u_int32_t pllm_post_divider;
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
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare12;
+	/* Spare BCT param */
+	u_int32_t emc_bct_spare13;
+
+	/* Defines EMC_2X_CLK_SRC, EMC_2X_CLK_DIVISOR, EMC_INVERT_DCD */
+	u_int32_t emc_clock_source;
+	u_int32_t emc_clock_source_dll;
+
+	/* Defines possible override for PLLLM_MISC2 */
+	u_int32_t clk_rst_pllm_misc20_override;
+	/* enables override for PLLLM_MISC2 */
+	u_int32_t clk_rst_pllm_misc20_override_enable;
+	/* defines CLK_ENB_MC1 in register clk_rst_controller_clk_enb_w_clr */
+	u_int32_t clear_clock2_mc1;
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
+	u_int32_t emc_auto_cal_config4;
+	u_int32_t emc_auto_cal_config5;
+	u_int32_t emc_auto_cal_config6;
+	u_int32_t emc_auto_cal_config7;
+	u_int32_t emc_auto_cal_config8;
+	/* Specifies the value for EMC_AUTO_CAL_VREF_SEL_0 */
+	u_int32_t emc_auto_cal_vref_sel0;
+	u_int32_t emc_auto_cal_vref_sel1;
+
+	/* Specifies the value for EMC_AUTO_CAL_CHANNEL */
+	u_int32_t emc_auto_cal_channel;
+
+	/* Specifies the value for EMC_PMACRO_AUTOCAL_CFG_0 */
+	u_int32_t emc_pmacro_auto_cal_cfg0;
+	u_int32_t emc_pmacro_auto_cal_cfg1;
+	u_int32_t emc_pmacro_auto_cal_cfg2;
+
+	u_int32_t emc_pmacro_rx_term;
+	u_int32_t emc_pmacro_dq_tx_drive;
+	u_int32_t emc_pmacro_ca_tx_drive;
+	u_int32_t emc_pmacro_cmd_tx_drive;
+	u_int32_t emc_pmacro_auto_cal_common;
+	u_int32_t emc_pmacro_zcrtl;
+
+	/*
+	 * Specifies the time for the calibration
+	 * to stabilize (in microseconds)
+	 */
+	u_int32_t emc_auto_cal_wait;
+
+	u_int32_t emc_xm2_comp_pad_ctrl;
+	u_int32_t emc_xm2_comp_pad_ctrl2;
+	u_int32_t emc_xm2_comp_pad_ctrl3;
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
+
+	u_int32_t emc_pin_gpio_enable;
+	u_int32_t emc_pin_gpio;
+
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
+
+	u_int32_t emc_rfc_pb;
+	u_int32_t emc_ref_ctrl2;
+
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
+
+	u_int32_t emc_tppd;
+	u_int32_t emc_ccdmw;
+
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
+
+	u_int32_t emc_wdv_chk;
+	u_int32_t emc_wsv;
+	u_int32_t emc_wev;
+
+	/* Specifies the value for EMC_WDV_MASK */
+	u_int32_t emc_wdv_mask;
+
+	u_int32_t emc_ws_duration;
+	u_int32_t emc_we_duration;
+
+	/* Specifies the value for EMC_QUSE */
+	u_int32_t emc_quse;
+	/* Specifies the value for EMC_QUSE_WIDTH */
+	u_int32_t emc_quse_width;
+	/* Specifies the value for EMC_IBDLY */
+	u_int32_t emc_ibdly;
+
+	u_int32_t emc_obdly;
+
+	/* Specifies the value for EMC_EINPUT */
+	u_int32_t emc_einput;
+	/* Specifies the value for EMC_EINPUT_DURATION */
+	u_int32_t emc_einput_duration;
+	/* Specifies the value for EMC_PUTERM_EXTRA */
+	u_int32_t emc_puterm_extra;
+	/* Specifies the value for EMC_PUTERM_WIDTH */
+	u_int32_t emc_puterm_width;
+
+	u_int32_t emc_qrst;
+	u_int32_t emc_qsafe;
+	u_int32_t emc_rdv;
+	u_int32_t emc_rdv_mask;
+
+	u_int32_t emc_rdv_early;
+	u_int32_t emc_rdv_early_mask;
+
+	/* Specifies the value for EMC_QPOP */
+	u_int32_t emc_qpop;
+
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
+
+	u_int32_t emc_cke2pden;
+	u_int32_t emc_pdex2che;
+	u_int32_t emc_pdex2mrr;
+
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
+	/* Specifies the value for EMC_FBIO_CFG7 */
+	u_int32_t emc_fbio_cfg7;
+	u_int32_t emc_fbio_cfg8;
+
+	/* Command mapping for CMD brick 0 */
+	u_int32_t emc_cmd_mapping_cmd0_0;
+	u_int32_t emc_cmd_mapping_cmd0_1;
+	u_int32_t emc_cmd_mapping_cmd0_2;
+	u_int32_t emc_cmd_mapping_cmd1_0;
+	u_int32_t emc_cmd_mapping_cmd1_1;
+	u_int32_t emc_cmd_mapping_cmd1_2;
+	u_int32_t emc_cmd_mapping_cmd2_0;
+	u_int32_t emc_cmd_mapping_cmd2_1;
+	u_int32_t emc_cmd_mapping_cmd2_2;
+	u_int32_t emc_cmd_mapping_cmd3_0;
+	u_int32_t emc_cmd_mapping_cmd3_1;
+	u_int32_t emc_cmd_mapping_cmd3_2;
+	u_int32_t emc_cmd_mapping_byte;
+
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
+
+	/* Specifies the programming to LPDDR4 Mode Register 3 at cold boot */
+	u_int32_t emc_mrw6;
+	/* Specifies the programming to LPDDR4 Mode Register 11 at cold boot */
+	u_int32_t emc_mrw8;
+	/* Specifies the programming to LPDDR4 Mode Register 11 at cold boot */
+	u_int32_t emc_mrw9;
+	/* Specifies the programming to LPDDR4 Mode Register 12 at cold boot */
+	u_int32_t emc_mrw10;
+	/* Specifies the programming to LPDDR4 Mode Register 14 at cold boot */
+	u_int32_t emc_mrw12;
+	/* Specifies the programming to LPDDR4 Mode Register 14 at cold boot */
+	u_int32_t emc_mrw13;
+	/* Specifies the programming to LPDDR4 Mode Register 22 at cold boot */
+	u_int32_t emc_mrw14;
+
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
+
+	u_int32_t emc_cfg_pipe_clk;
+	u_int32_t emc_fdpd_ctrl_cmd_no_ramp;
+	u_int32_t emc_cfg_update;
+
+	/* Specifies the value for EMC_DBG */
+	u_int32_t emc_dbg;
+
+	u_int32_t emc_dbg_write_mux;
+
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
+	u_int32_t emc_cfg_dig_dll_1;
+
+	/* Specifies the value for EMC_CFG_DIG_DLL_PERIOD */
+	u_int32_t emc_cfg_dig_dll_period;
+	/* Specifies the value of *DEV_SELECTN of various EMC registers */
+	u_int32_t emc_dev_select;
+
+	/* Specifies the value for EMC_SEL_DPD_CTRL */
+	u_int32_t emc_sel_dpd_ctrl;
+
+	/* Pads trimmer delays */
+	u_int32_t emc_fdpd_ctrl_dq;
+	u_int32_t emc_fdpd_ctrl_cmd;
+	u_int32_t emc_pmacro_ib_vref_dq_0;
+	u_int32_t emc_pmacro_ib_vref_dq_1;
+	u_int32_t emc_pmacro_ib_vref_dqs_0;
+	u_int32_t emc_pmacro_ib_vref_dqs_1;
+	u_int32_t emc_pmacro_ib_rxrt;
+	u_int32_t emc_cfg_pipe1;
+	u_int32_t emc_cfg_pipe2;
+
+	/* Specifies the value for EMC_PMACRO_QUSE_DDLL_RANK0_0 */
+	u_int32_t emc_pmacro_quse_ddll_rank0_0;
+	u_int32_t emc_pmacro_quse_ddll_rank0_1;
+	u_int32_t emc_pmacro_quse_ddll_rank0_2;
+	u_int32_t emc_pmacro_quse_ddll_rank0_3;
+	u_int32_t emc_pmacro_quse_ddll_rank0_4;
+	u_int32_t emc_pmacro_quse_ddll_rank0_5;
+	u_int32_t emc_pmacro_quse_ddll_rank1_0;
+	u_int32_t emc_pmacro_quse_ddll_rank1_1;
+	u_int32_t emc_pmacro_quse_ddll_rank1_2;
+	u_int32_t emc_pmacro_quse_ddll_rank1_3;
+	u_int32_t emc_pmacro_quse_ddll_rank1_4;
+	u_int32_t emc_pmacro_quse_ddll_rank1_5;
+
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank0_0;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank0_1;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank0_2;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank0_3;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank0_4;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank0_5;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank1_0;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank1_1;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank1_2;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank1_3;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank1_4;
+	u_int32_t emc_pmacro_ob_ddll_long_dq_rank1_5;
+
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank0_0;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank0_1;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank0_2;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank0_3;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank0_4;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank0_5;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank1_0;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank1_1;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank1_2;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank1_3;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank1_4;
+	u_int32_t emc_pmacro_ob_ddll_long_dqs_rank1_5;
+
+	u_int32_t emc_pmacro_ib_ddll_long_dqs_rank0_0;
+	u_int32_t emc_pmacro_ib_ddll_long_dqs_rank0_1;
+	u_int32_t emc_pmacro_ib_ddll_long_dqs_rank0_2;
+	u_int32_t emc_pmacro_ib_ddll_long_dqs_rank0_3;
+	u_int32_t emc_pmacro_ib_ddll_long_dqs_rank1_0;
+	u_int32_t emc_pmacro_ib_ddll_long_dqs_rank1_1;
+	u_int32_t emc_pmacro_ib_ddll_long_dqs_rank1_2;
+	u_int32_t emc_pmacro_ib_ddll_long_dqs_rank1_3;
+
+	u_int32_t emc_pmacro_ddll_long_cmd_0;
+	u_int32_t emc_pmacro_ddll_long_cmd_1;
+	u_int32_t emc_pmacro_ddll_long_cmd_2;
+	u_int32_t emc_pmacro_ddll_long_cmd_3;
+	u_int32_t emc_pmacro_ddll_long_cmd_4;
+	u_int32_t emc_pmacro_ddll_short_cmd_0;
+	u_int32_t emc_pmacro_ddll_short_cmd_1;
+	u_int32_t emc_pmacro_ddll_short_cmd_2;
+
+	/*
+	 * Specifies the delay after asserting CKE pin during a WarmBoot0
+	 * sequence (in microseconds)
+	 */
+	u_int32_t warm_boot_wait;
+
+	/* Specifies the value for EMC_ODT_WRITE */
+	u_int32_t emc_odt_write;
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
+
+	u_int32_t emc_zqcal_lpddr4_warm_boot;
+
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
+
+	u_int32_t pmc_io_dpd4_req_wait;
+
+	/* Specifies the value for PMC_REG_SHORT */
+	u_int32_t pmc_reg_short;
+	/* Specifies the value for PMC_NO_IOPOWER */
+	u_int32_t pmc_no_io_power;
+
+	u_int32_t pmc_ddr_ctrl_wait;
+	u_int32_t pmc_ddr_ctrl;
+
+	/* Specifies the value for EMC_ACPD_CONTROL */
+	u_int32_t emc_acpd_control;
+
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE0 */
+	u_int32_t emc_swizzle_rank0_byte0;
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE1 */
+	u_int32_t emc_swizzle_rank0_byte1;
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE2 */
+	u_int32_t emc_swizzle_rank0_byte2;
+	/* Specifies the value for EMC_SWIZZLE_RANK0_BYTE3 */
+	u_int32_t emc_swizzle_rank0_byte3;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE0 */
+	u_int32_t emc_swizzle_rank1_byte0;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE1 */
+	u_int32_t emc_swizzle_rank1_byte1;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE2 */
+	u_int32_t emc_swizzle_rank1_byte2;
+	/* Specifies the value for EMC_SWIZZLE_RANK1_BYTE3 */
+	u_int32_t emc_swizzle_rank1_byte3;
+
+	/* Specifies the value for EMC_TXDSRVTTGEN */
+	u_int32_t emc_txdsrvttgen;
+
+	/* Specifies the value for EMC_DATA_BRLSHFT_0 */
+	u_int32_t emc_data_brlshft0;
+	u_int32_t emc_data_brlshft1;
+
+	u_int32_t emc_dqs_brlshft0;
+	u_int32_t emc_dqs_brlshft1;
+
+	u_int32_t emc_cmd_brlshft0;
+	u_int32_t emc_cmd_brlshft1;
+	u_int32_t emc_cmd_brlshft2;
+	u_int32_t emc_cmd_brlshft3;
+
+	u_int32_t emc_quse_brlshft0;
+	u_int32_t emc_quse_brlshft1;
+	u_int32_t emc_quse_brlshft2;
+	u_int32_t emc_quse_brlshft3;
+
+	u_int32_t emc_dll_cfg0;
+	u_int32_t emc_dll_cfg1;
+
+	u_int32_t emc_pmc_scratch1;
+	u_int32_t emc_pmc_scratch2;
+	u_int32_t emc_pmc_scratch3;
+
+	u_int32_t emc_pmacro_pad_cfg_ctrl;
+
+	u_int32_t emc_pmacro_vttgen_ctrl0;
+	u_int32_t emc_pmacro_vttgen_ctrl1;
+	u_int32_t emc_pmacro_vttgen_ctrl2;
+
+	u_int32_t emc_pmacro_brick_ctrl_rfu1;
+	u_int32_t emc_pmacro_cmd_brick_ctrl_fdpd;
+	u_int32_t emc_pmacro_brick_ctrl_rfu2;
+	u_int32_t emc_pmacro_data_brick_ctrl_fdpd;
+	u_int32_t emc_pmacro_bg_bias_ctrl0;
+	u_int32_t emc_pmacro_data_pad_rx_ctrl;
+	u_int32_t emc_pmacro_cmd_pad_rx_ctrl;
+	u_int32_t emc_pmacro_data_rx_term_mode;
+	u_int32_t emc_pmacro_cmd_rx_term_mode;
+	u_int32_t emc_pmacro_data_pad_tx_ctrl;
+	u_int32_t emc_pmacro_common_pad_tx_ctrl;
+	u_int32_t emc_pmacro_cmd_pad_tx_ctrl;
+	u_int32_t emc_cfg3;
+
+	u_int32_t emc_pmacro_tx_pwrd0;
+	u_int32_t emc_pmacro_tx_pwrd1;
+	u_int32_t emc_pmacro_tx_pwrd2;
+	u_int32_t emc_pmacro_tx_pwrd3;
+	u_int32_t emc_pmacro_tx_pwrd4;
+	u_int32_t emc_pmacro_tx_pwrd5;
+
+	u_int32_t emc_config_sample_delay;
+
+	u_int32_t emc_pmacro_brick_mapping0;
+	u_int32_t emc_pmacro_brick_mapping1;
+	u_int32_t emc_pmacro_brick_mapping2;
+
+	u_int32_t emc_pmacro_tx_sel_clk_src0;
+	u_int32_t emc_pmacro_tx_sel_clk_src1;
+	u_int32_t emc_pmacro_tx_sel_clk_src2;
+	u_int32_t emc_pmacro_tx_sel_clk_src3;
+	u_int32_t emc_pmacro_tx_sel_clk_src4;
+	u_int32_t emc_pmacro_tx_sel_clk_src5;
+
+	u_int32_t emc_pmacro_ddll_bypass;
+
+	u_int32_t emc_pmacro_ddll_pwrd0;
+	u_int32_t emc_pmacro_ddll_pwrd1;
+	u_int32_t emc_pmacro_ddll_pwrd2;
+
+	u_int32_t emc_pmacro_cmd_ctrl0;
+	u_int32_t emc_pmacro_cmd_ctrl1;
+	u_int32_t emc_pmacro_cmd_ctrl2;
+
+	/* DRAM size information */
+
+	/* Specifies the value for MC_EMEM_ADR_CFG */
+	u_int32_t mc_emem_adr_cfg;
+	/* Specifies the value for MC_EMEM_ADR_CFG_DEV0 */
+	u_int32_t mc_emem_adr_cfg_dev0;
+	/* Specifies the value for MC_EMEM_ADR_CFG_DEV1 */
+	u_int32_t mc_emem_adr_cfg_dev1;
+
+	u_int32_t mc_emem_adr_cfg_channel_mask;
+
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG0 */
+	u_int32_t mc_emem_adr_cfg_bank_mask0;
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG1 */
+	u_int32_t mc_emem_adr_cfg_bank_mask1;
+	/* Specifies the value for MC_EMEM_BANK_SWIZZLE_CFG2 */
+	u_int32_t mc_emem_adr_cfg_bank_mask2;
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
+
+	u_int32_t emc_emem_arb_refpb_hp_ctrl;
+	u_int32_t emc_emem_arb_refpb_bank_ctrl;
+
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
+
+	u_int32_t mc_emem_arb_timing_rfcpb;
+
+	/* Specifies the value for MC_EMEM_ARB_DA_TURNS */
+	u_int32_t mc_emem_arb_da_turns;
+	/* Specifies the value for MC_EMEM_ARB_DA_COVERS */
+	u_int32_t mc_emem_arb_da_covers;
+	/* Specifies the value for MC_EMEM_ARB_MISC0 */
+	u_int32_t mc_emem_arb_misc0;
+	/* Specifies the value for MC_EMEM_ARB_MISC1 */
+	u_int32_t mc_emem_arb_misc1;
+	u_int32_t mc_emem_arb_misc2;
+
+	/* Specifies the value for MC_EMEM_ARB_RING1_THROTTLE */
+	u_int32_t mc_emem_arb_ring1_throttle;
+	/* Specifies the value for MC_EMEM_ARB_OVERRIDE */
+	u_int32_t mc_emem_arb_override;
+	/* Specifies the value for MC_EMEM_ARB_OVERRIDE_1 */
+	u_int32_t mc_emem_arb_override1;
+	/* Specifies the value for MC_EMEM_ARB_RSV */
+	u_int32_t mc_emem_arb_rsv;
+
+	u_int32_t mc_da_cfg0;
+	u_int32_t mc_emem_arb_timing_ccdmw;
+
+	/* Specifies the value for MC_CLKEN_OVERRIDE */
+	u_int32_t mc_clken_override;
+
+	/* Specifies the value for MC_STAT_CONTROL */
+	u_int32_t mc_stat_control;
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
+	u_int32_t mc_generalized_carveout1_bom;
+	u_int32_t mc_generalized_carveout1_bom_hi;
+	u_int32_t mc_generalized_carveout1_size_128kb;
+	u_int32_t mc_generalized_carveout1_access0;
+	u_int32_t mc_generalized_carveout1_access1;
+	u_int32_t mc_generalized_carveout1_access2;
+	u_int32_t mc_generalized_carveout1_access3;
+	u_int32_t mc_generalized_carveout1_access4;
+	u_int32_t mc_generalized_carveout1_force_internal_access0;
+	u_int32_t mc_generalized_carveout1_force_internal_access1;
+	u_int32_t mc_generalized_carveout1_force_internal_access2;
+	u_int32_t mc_generalized_carveout1_force_internal_access3;
+	u_int32_t mc_generalized_carveout1_force_internal_access4;
+	u_int32_t mc_generalized_carveout1_cfg0;
+
+	u_int32_t mc_generalized_carveout2_bom;
+	u_int32_t mc_generalized_carveout2_bom_hi;
+	u_int32_t mc_generalized_carveout2_size_128kb;
+	u_int32_t mc_generalized_carveout2_access0;
+	u_int32_t mc_generalized_carveout2_access1;
+	u_int32_t mc_generalized_carveout2_access2;
+	u_int32_t mc_generalized_carveout2_access3;
+	u_int32_t mc_generalized_carveout2_access4;
+	u_int32_t mc_generalized_carveout2_force_internal_access0;
+	u_int32_t mc_generalized_carveout2_force_internal_access1;
+	u_int32_t mc_generalized_carveout2_force_internal_access2;
+	u_int32_t mc_generalized_carveout2_force_internal_access3;
+	u_int32_t mc_generalized_carveout2_force_internal_access4;
+	u_int32_t mc_generalized_carveout2_cfg0;
+
+	u_int32_t mc_generalized_carveout3_bom;
+	u_int32_t mc_generalized_carveout3_bom_hi;
+	u_int32_t mc_generalized_carveout3_size_128kb;
+	u_int32_t mc_generalized_carveout3_access0;
+	u_int32_t mc_generalized_carveout3_access1;
+	u_int32_t mc_generalized_carveout3_access2;
+	u_int32_t mc_generalized_carveout3_access3;
+	u_int32_t mc_generalized_carveout3_access4;
+	u_int32_t mc_generalized_carveout3_force_internal_access0;
+	u_int32_t mc_generalized_carveout3_force_internal_access1;
+	u_int32_t mc_generalized_carveout3_force_internal_access2;
+	u_int32_t mc_generalized_carveout3_force_internal_access3;
+	u_int32_t mc_generalized_carveout3_force_internal_access4;
+	u_int32_t mc_generalized_carveout3_cfg0;
+
+	u_int32_t mc_generalized_carveout4_bom;
+	u_int32_t mc_generalized_carveout4_bom_hi;
+	u_int32_t mc_generalized_carveout4_size_128kb;
+	u_int32_t mc_generalized_carveout4_access0;
+	u_int32_t mc_generalized_carveout4_access1;
+	u_int32_t mc_generalized_carveout4_access2;
+	u_int32_t mc_generalized_carveout4_access3;
+	u_int32_t mc_generalized_carveout4_access4;
+	u_int32_t mc_generalized_carveout4_force_internal_access0;
+	u_int32_t mc_generalized_carveout4_force_internal_access1;
+	u_int32_t mc_generalized_carveout4_force_internal_access2;
+	u_int32_t mc_generalized_carveout4_force_internal_access3;
+	u_int32_t mc_generalized_carveout4_force_internal_access4;
+	u_int32_t mc_generalized_carveout4_cfg0;
+
+	u_int32_t mc_generalized_carveout5_bom;
+	u_int32_t mc_generalized_carveout5_bom_hi;
+	u_int32_t mc_generalized_carveout5_size_128kb;
+	u_int32_t mc_generalized_carveout5_access0;
+	u_int32_t mc_generalized_carveout5_access1;
+	u_int32_t mc_generalized_carveout5_access2;
+	u_int32_t mc_generalized_carveout5_access3;
+	u_int32_t mc_generalized_carveout5_access4;
+	u_int32_t mc_generalized_carveout5_force_internal_access0;
+	u_int32_t mc_generalized_carveout5_force_internal_access1;
+	u_int32_t mc_generalized_carveout5_force_internal_access2;
+	u_int32_t mc_generalized_carveout5_force_internal_access3;
+	u_int32_t mc_generalized_carveout5_force_internal_access4;
+	u_int32_t mc_generalized_carveout5_cfg0;
+
+	/* Specifies enable for CA training */
+	u_int32_t emc_ca_training_enable;
+	/* Set if bit 6 select is greater than bit 7 select; uses aremc.spec packet SWIZZLE_BIT6_GT_BIT7 */
+	u_int32_t swizzle_rank_byte_encode;
+	/* Specifies enable and offset for patched boot rom write */
+	u_int32_t boot_rom_patch_control;
+	/* Specifies data for patched boot rom write */
+	u_int32_t boot_rom_patch_data;
+
+	/* Specifies the value for MC_MTS_CARVEOUT_BOM */
+	u_int32_t mc_mts_carveout_bom;
+	/* Specifies the value for MC_MTS_CARVEOUT_ADR_HI */
+	u_int32_t mc_mts_carveout_adr_hi;
+	/* Specifies the value for MC_MTS_CARVEOUT_SIZE_MB */
+	u_int32_t mc_mts_carveout_size_mb;
+	/* Specifies the value for MC_MTS_CARVEOUT_REG_CTRL */
+	u_int32_t mc_mts_carveout_reg_ctrl;
+	/* End of generated code by warmboot_code_gen */
+
+} nvboot_sdram_params;
+#endif /* #ifndef INCLUDED_NVBOOT_SDRAM_PARAM_T210_H */
diff --git a/src/t210/parse_t210.c b/src/t210/parse_t210.c
new file mode 100644
index 000000000000..309a1e602069
--- /dev/null
+++ b/src/t210/parse_t210.c
@@ -0,0 +1,741 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
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
+ * parse_t210.c - The implementation for parsing dev/sdram parameters
+ */
+
+#include "../parse.h"
+#include "nvboot_bct_t210.h"
+
+enum_item s_devtype_table_t210[] = {
+	{ "NvBootDevType_Sdmmc", nvboot_dev_type_sdmmc },
+	{ "NvBootDevType_Spi", nvboot_dev_type_spi },
+	{ "Sdmmc", nvboot_dev_type_sdmmc },
+	{ "Spi", nvboot_dev_type_spi },
+	{ NULL, 0 }
+};
+
+enum_item s_sdmmc_data_width_table_t210[] = {
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
+enum_item s_spi_clock_source_table_t210[] = {
+	{ "NvBootSpiClockSource_PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "NvBootSpiClockSource_ClockM", nvboot_spi_clock_source_clockm },
+	{ "ClockSource_PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "ClockSource_ClockM", nvboot_spi_clock_source_clockm },
+	{ "PllPOut0", nvboot_spi_clock_source_pllp_out0 },
+	{ "ClockM", nvboot_spi_clock_source_clockm },
+	{ NULL, 0 }
+};
+
+enum_item s_nvboot_memory_type_table_t210[] = {
+	{ "NvBootMemoryType_None", nvboot_memory_type_none },
+	{ "NvBootMemoryType_Ddr3", nvboot_memory_type_ddr3 },
+	{ "NvBootMemoryType_Ddr2", nvboot_memory_type_ddr2 },
+	{ "NvBootMemoryType_Ddr", nvboot_memory_type_ddr },
+	{ "NvBootMemoryType_LpDdr2", nvboot_memory_type_lpddr2 },
+	{ "NvBootMemoryType_LpDdr4", nvboot_memory_type_lpddr4 },
+	{ "NvBootMemoryType_LpDdr", nvboot_memory_type_lpddr },
+
+	{ "None", nvboot_memory_type_none },
+	{ "Ddr3", nvboot_memory_type_ddr3 },
+	{ "Ddr2", nvboot_memory_type_ddr2 },
+	{ "Ddr", nvboot_memory_type_ddr },
+	{ "LpDdr2", nvboot_memory_type_lpddr2 },
+	{ "LpDdr4", nvboot_memory_type_lpddr4 },
+	{ "LpDdr", nvboot_memory_type_lpddr },
+
+	{ NULL, 0 }
+};
+
+#define TOKEN(name)						\
+	token_##name, field_type_u32, NULL
+
+field_item s_sdram_field_table_t210[] = {
+	{ "MemoryType", token_memory_type,
+	  field_type_enum, s_nvboot_memory_type_table_t210 },
+
+	{ "PllMInputDivider",           TOKEN(pllm_input_divider) },
+	{ "PllMFeedbackDivider",        TOKEN(pllm_feedback_divider) },
+	{ "PllMStableTime",             TOKEN(pllm_stable_time) },
+	{ "PllMSetupControl",           TOKEN(pllm_setup_control) },
+	{ "PllMPostDivider",            TOKEN(pllm_post_divider) },
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
+	{ "EmcBctSpare12",              TOKEN(emc_bct_spare12) },
+	{ "EmcBctSpare13",              TOKEN(emc_bct_spare13) },
+	{ "EmcClockSource",             TOKEN(emc_clock_source) },
+	{ "EmcClockSourceDll",          TOKEN(emc_clock_source_dll) },
+
+	{ "ClkRstControllerPllmMisc2Override",
+			                TOKEN(clk_rst_pllm_misc20_override) },
+	{ "ClkRstControllerPllmMisc2OverrideEnable",
+			         TOKEN(clk_rst_pllm_misc20_override_enable) },
+	{ "ClearClk2Mc1",               TOKEN(clear_clock2_mc1) },
+
+	{ "EmcAutoCalInterval",         TOKEN(emc_auto_cal_interval) },
+	{ "EmcAutoCalConfig",           TOKEN(emc_auto_cal_config) },
+	{ "EmcAutoCalConfig2",          TOKEN(emc_auto_cal_config2) },
+	{ "EmcAutoCalConfig3",          TOKEN(emc_auto_cal_config3) },
+	{ "EmcAutoCalConfig4",          TOKEN(emc_auto_cal_config4) },
+	{ "EmcAutoCalConfig5",          TOKEN(emc_auto_cal_config5) },
+	{ "EmcAutoCalConfig6",          TOKEN(emc_auto_cal_config6) },
+	{ "EmcAutoCalConfig7",          TOKEN(emc_auto_cal_config7) },
+	{ "EmcAutoCalConfig8",          TOKEN(emc_auto_cal_config8) },
+
+	{ "EmcAutoCalVrefSel0",         TOKEN(emc_auto_cal_vref_sel0) },
+	{ "EmcAutoCalVrefSel1",         TOKEN(emc_auto_cal_vref_sel1) },
+
+	{ "EmcAutoCalChannel",          TOKEN(emc_auto_cal_channel) },
+	{ "EmcPmacroAutocalCfg0",       TOKEN(emc_pmacro_auto_cal_cfg0) },
+	{ "EmcPmacroAutocalCfg1",       TOKEN(emc_pmacro_auto_cal_cfg1) },
+	{ "EmcPmacroAutocalCfg2",       TOKEN(emc_pmacro_auto_cal_cfg2) },
+	{ "EmcPmacroRxTerm",            TOKEN(emc_pmacro_rx_term) },
+	{ "EmcPmacroDqTxDrv",           TOKEN(emc_pmacro_dq_tx_drive) },
+	{ "EmcPmacroCaTxDrv",           TOKEN(emc_pmacro_ca_tx_drive) },
+	{ "EmcPmacroCmdTxDrv",          TOKEN(emc_pmacro_cmd_tx_drive) },
+	{ "EmcPmacroAutocalCfgCommon",  TOKEN(emc_pmacro_auto_cal_common) },
+	{ "EmcPmacroZctrl",             TOKEN(emc_pmacro_zcrtl) },
+
+	{ "EmcAutoCalWait",             TOKEN(emc_auto_cal_wait) },
+
+	{ "EmcXm2CompPadCtrl",          TOKEN(emc_xm2_comp_pad_ctrl) },
+	{ "EmcXm2CompPadCtrl2",         TOKEN(emc_xm2_comp_pad_ctrl2) },
+	{ "EmcXm2CompPadCtrl3",         TOKEN(emc_xm2_comp_pad_ctrl3) },
+
+	{ "EmcAdrCfg",                  TOKEN(emc_adr_cfg) },
+
+	{ "EmcPinProgramWait",          TOKEN(emc_pin_program_wait) },
+	{ "EmcPinExtraWait",            TOKEN(emc_pin_extra_wait) },
+
+	{ "EmcPinGpioEn",               TOKEN(emc_pin_gpio_enable) },
+	{ "EmcPinGpio",                 TOKEN(emc_pin_gpio) },
+
+	{ "EmcTimingControlWait",       TOKEN(emc_timing_control_wait) },
+
+	{ "EmcRc",                      TOKEN(emc_rc) },
+	{ "EmcRfc",                     TOKEN(emc_rfc) },
+
+	{ "EmcRfcPb",                   TOKEN(emc_rfc_pb) },
+	{ "EmcRefctrl2",                TOKEN(emc_ref_ctrl2) },
+
+	{ "EmcRfcSlr",                  TOKEN(emc_rfc_slr) },
+	{ "EmcRas",                     TOKEN(emc_ras) },
+	{ "EmcRp",                      TOKEN(emc_rp) },
+	{ "EmcR2r",                     TOKEN(emc_r2r) },
+	{ "EmcW2w",                     TOKEN(emc_w2w) },
+	{ "EmcR2w",                     TOKEN(emc_r2w) },
+	{ "EmcW2r",                     TOKEN(emc_w2r) },
+	{ "EmcR2p",                     TOKEN(emc_r2p) },
+	{ "EmcW2p",                     TOKEN(emc_w2p) },
+
+	{ "EmcTppd",                    TOKEN(emc_tppd) },
+	{ "EmcCcdmw",                   TOKEN(emc_ccdmw) },
+
+	{ "EmcRdRcd",                   TOKEN(emc_rd_rcd) },
+	{ "EmcWrRcd",                   TOKEN(emc_wr_rcd) },
+	{ "EmcRrd",                     TOKEN(emc_rrd) },
+	{ "EmcRext",                    TOKEN(emc_rext) },
+	{ "EmcWext",                    TOKEN(emc_wext) },
+	{ "EmcWdv",                     TOKEN(emc_wdv) },
+
+	{ "EmcWdvChk",                  TOKEN(emc_wdv_chk) },
+	{ "EmcWsv",                     TOKEN(emc_wsv) },
+	{ "EmcWev",                     TOKEN(emc_wev) },
+
+	{ "EmcWdvMask",                 TOKEN(emc_wdv_mask) },
+
+	{ "EmcWsDuration",              TOKEN(emc_ws_duration) },
+	{ "EmcWeDuration",              TOKEN(emc_we_duration) },
+
+	{ "EmcQUse",                    TOKEN(emc_quse) },
+	{ "EmcQuseWidth",               TOKEN(emc_quse_width) },
+	{ "EmcIbdly",                   TOKEN(emc_ibdly) },
+
+	{ "EmcObdly",                   TOKEN(emc_obdly) },
+
+	{ "EmcEInput",                  TOKEN(emc_einput) },
+	{ "EmcEInputDuration",          TOKEN(emc_einput_duration) },
+	{ "EmcPutermExtra",             TOKEN(emc_puterm_extra) },
+	{ "EmcPutermWidth",             TOKEN(emc_puterm_width) },
+	{ "EmcQRst",                    TOKEN(emc_qrst) },
+	{ "EmcQSafe",                   TOKEN(emc_qsafe) },
+	{ "EmcRdv",                     TOKEN(emc_rdv) },
+	{ "EmcRdvMask",                 TOKEN(emc_rdv_mask) },
+
+	{ "EmcRdvEarly",                TOKEN(emc_rdv_early) },
+	{ "EmcRdvEarlyMask",            TOKEN(emc_rdv_early_mask) },
+
+	{ "EmcQpop",                    TOKEN(emc_qpop) },
+	{ "EmcRefresh",                 TOKEN(emc_refresh) },
+	{ "EmcBurstRefreshNum",         TOKEN(emc_burst_refresh_num) },
+
+	{ "EmcPreRefreshReqCnt",        TOKEN(emc_prerefresh_req_cnt) },
+
+	{ "EmcPdEx2Wr",                 TOKEN(emc_pdex2wr) },
+	{ "EmcPdEx2Rd",                 TOKEN(emc_pdex2rd) },
+	{ "EmcPChg2Pden",               TOKEN(emc_pchg2pden) },
+	{ "EmcAct2Pden",                TOKEN(emc_act2pden) },
+	{ "EmcAr2Pden",                 TOKEN(emc_ar2pden) },
+	{ "EmcRw2Pden",                 TOKEN(emc_rw2pden) },
+
+	{ "EmcCke2Pden",                TOKEN(emc_cke2pden) },
+	{ "EmcPdex2Cke",                TOKEN(emc_pdex2che) },
+	{ "EmcPdex2Mrr",                TOKEN(emc_pdex2mrr) },
+
+	{ "EmcTxsr",                    TOKEN(emc_txsr) },
+	{ "EmcTxsrDll",                 TOKEN(emc_txsr_dll) },
+	{ "EmcTcke",                    TOKEN(emc_tcke) },
+	{ "EmcTckesr",                  TOKEN(emc_tckesr) },
+	{ "EmcTpd",                     TOKEN(emc_tpd) },
+	{ "EmcTfaw",                    TOKEN(emc_tfaw) },
+	{ "EmcTrpab",                   TOKEN(emc_trpab) },
+	{ "EmcTClkStable",              TOKEN(emc_tclkstable) },
+	{ "EmcTClkStop",                TOKEN(emc_tclkstop) },
+	{ "EmcTRefBw",                  TOKEN(emc_trefbw) },
+	{ "EmcFbioCfg5",                TOKEN(emc_fbio_cfg5) },
+	{ "EmcFbioCfg7",                TOKEN(emc_fbio_cfg7) },
+	{ "EmcFbioCfg8",                TOKEN(emc_fbio_cfg8) },
+
+	{ "EmcCmdMappingCmd0_0",        TOKEN(emc_cmd_mapping_cmd0_0) },
+	{ "EmcCmdMappingCmd0_1",        TOKEN(emc_cmd_mapping_cmd0_1) },
+	{ "EmcCmdMappingCmd0_2",        TOKEN(emc_cmd_mapping_cmd0_2) },
+	{ "EmcCmdMappingCmd1_0",        TOKEN(emc_cmd_mapping_cmd1_0) },
+	{ "EmcCmdMappingCmd1_1",        TOKEN(emc_cmd_mapping_cmd1_1) },
+	{ "EmcCmdMappingCmd1_2",        TOKEN(emc_cmd_mapping_cmd1_2) },
+	{ "EmcCmdMappingCmd2_0",        TOKEN(emc_cmd_mapping_cmd2_0) },
+	{ "EmcCmdMappingCmd2_1",        TOKEN(emc_cmd_mapping_cmd2_1) },
+	{ "EmcCmdMappingCmd2_2",        TOKEN(emc_cmd_mapping_cmd2_2) },
+	{ "EmcCmdMappingCmd3_0",        TOKEN(emc_cmd_mapping_cmd3_0) },
+	{ "EmcCmdMappingCmd3_1",        TOKEN(emc_cmd_mapping_cmd3_1) },
+	{ "EmcCmdMappingCmd3_2",        TOKEN(emc_cmd_mapping_cmd3_2) },
+	{ "EmcCmdMappingByte",          TOKEN(emc_cmd_mapping_byte) },
+
+	{ "EmcFbioSpare",               TOKEN(emc_fbio_spare) },
+	{ "EmcCfgRsv",                  TOKEN(emc_cfg_rsv) },
+	{ "EmcMrs",                     TOKEN(emc_mrs) },
+
+	{ "EmcEmrs",                    TOKEN(emc_emrs) },
+
+	{ "EmcEmrs2",                   TOKEN(emc_emrs2) },
+	{ "EmcEmrs3",                   TOKEN(emc_emrs3) },
+	{ "EmcMrw1",                    TOKEN(emc_mrw1) },
+	{ "EmcMrw2",                    TOKEN(emc_mrw2) },
+	{ "EmcMrw3",                    TOKEN(emc_mrw3) },
+	{ "EmcMrw4",                    TOKEN(emc_mrw4) },
+
+	{ "EmcMrw6",                    TOKEN(emc_mrw6) },
+	{ "EmcMrw8",                    TOKEN(emc_mrw8) },
+	{ "EmcMrw9",                    TOKEN(emc_mrw9) },
+	{ "EmcMrw10",                   TOKEN(emc_mrw10) },
+	{ "EmcMrw12",                   TOKEN(emc_mrw12) },
+	{ "EmcMrw13",                   TOKEN(emc_mrw13) },
+	{ "EmcMrw14",                   TOKEN(emc_mrw14) },
+
+	{ "EmcMrwExtra",                TOKEN(emc_mrw_extra) },
+	{ "EmcWarmBootMrwExtra",        TOKEN(emc_warm_boot_mrw_extra) },
+	{ "EmcWarmBootExtraModeRegWriteEnable",
+			TOKEN(emc_warm_boot_extramode_reg_write_enable) },
+	{ "EmcExtraModeRegWriteEnable", TOKEN(emc_extramode_reg_write_enable) },
+	{ "EmcMrwResetCommand",         TOKEN(emc_mrw_reset_command) },
+	{ "EmcMrwResetNInitWait",       TOKEN(emc_mrw_reset_ninit_wait) },
+	{ "EmcMrsWaitCnt",              TOKEN(emc_mrs_wait_cnt) },
+	{ "EmcMrsWaitCnt2",             TOKEN(emc_mrs_wait_cnt2) },
+	{ "EmcCfg",                     TOKEN(emc_cfg) },
+	{ "EmcCfg2",                    TOKEN(emc_cfg2) },
+	{ "EmcCfgPipe",                 TOKEN(emc_cfg_pipe) },
+
+	{ "EmcCfgPipeClk",              TOKEN(emc_cfg_pipe_clk) },
+	{ "EmcFdpdCtrlCmdNoRamp",       TOKEN(emc_fdpd_ctrl_cmd_no_ramp) },
+	{ "EmcCfgUpdate",               TOKEN(emc_cfg_update) },
+
+	{ "EmcDbg",                     TOKEN(emc_dbg) },
+	{ "EmcDbgWriteMux",             TOKEN(emc_dbg_write_mux) },
+
+	{ "EmcCmdQ",                    TOKEN(emc_cmd_q) },
+	{ "EmcMc2EmcQ",                 TOKEN(emc_mc2emc_q) },
+	{ "EmcDynSelfRefControl",       TOKEN(emc_dyn_self_ref_control) },
+	{ "AhbArbitrationXbarCtrlMemInitDone",
+			TOKEN(ahb_arbitration_xbar_ctrl_meminit_done) },
+	{ "EmcCfgDigDll",               TOKEN(emc_cfg_dig_dll) },
+
+	{ "EmcCfgDigDll_1",             TOKEN(emc_cfg_dig_dll_1) },
+
+	{ "EmcCfgDigDllPeriod",         TOKEN(emc_cfg_dig_dll_period) },
+	{ "EmcDevSelect",               TOKEN(emc_dev_select) },
+	{ "EmcSelDpdCtrl",              TOKEN(emc_sel_dpd_ctrl) },
+
+	{ "EmcFdpdCtrlDq",              TOKEN(emc_fdpd_ctrl_dq) },
+	{ "EmcFdpdCtrlCmd",             TOKEN(emc_fdpd_ctrl_cmd) },
+	{ "EmcPmacroIbVrefDq_0",        TOKEN(emc_pmacro_ib_vref_dq_0) },
+	{ "EmcPmacroIbVrefDq_1",        TOKEN(emc_pmacro_ib_vref_dq_1) },
+	{ "EmcPmacroIbVrefDqs_0",       TOKEN(emc_pmacro_ib_vref_dqs_0) },
+	{ "EmcPmacroIbVrefDqs_1",       TOKEN(emc_pmacro_ib_vref_dqs_1) },
+	{ "EmcPmacroIbRxrt",            TOKEN(emc_pmacro_ib_rxrt) },
+	{ "EmcCfgPipe1",                TOKEN(emc_cfg_pipe1) },
+	{ "EmcCfgPipe2",                TOKEN(emc_cfg_pipe2) },
+	{ "EmcPmacroQuseDdllRank0_0",   TOKEN(emc_pmacro_quse_ddll_rank0_0) },
+	{ "EmcPmacroQuseDdllRank0_1",   TOKEN(emc_pmacro_quse_ddll_rank0_1) },
+	{ "EmcPmacroQuseDdllRank0_2",   TOKEN(emc_pmacro_quse_ddll_rank0_2) },
+	{ "EmcPmacroQuseDdllRank0_3",   TOKEN(emc_pmacro_quse_ddll_rank0_3) },
+	{ "EmcPmacroQuseDdllRank0_4",   TOKEN(emc_pmacro_quse_ddll_rank0_4) },
+	{ "EmcPmacroQuseDdllRank0_5",   TOKEN(emc_pmacro_quse_ddll_rank0_5) },
+	{ "EmcPmacroQuseDdllRank1_0",   TOKEN(emc_pmacro_quse_ddll_rank1_0) },
+	{ "EmcPmacroQuseDdllRank1_1",   TOKEN(emc_pmacro_quse_ddll_rank1_1) },
+	{ "EmcPmacroQuseDdllRank1_2",   TOKEN(emc_pmacro_quse_ddll_rank1_2) },
+	{ "EmcPmacroQuseDdllRank1_3",   TOKEN(emc_pmacro_quse_ddll_rank1_3) },
+	{ "EmcPmacroQuseDdllRank1_4",   TOKEN(emc_pmacro_quse_ddll_rank1_4) },
+	{ "EmcPmacroQuseDdllRank1_5",   TOKEN(emc_pmacro_quse_ddll_rank1_5) },
+	{ "EmcPmacroObDdllLongDqRank0_0",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank0_0) },
+	{ "EmcPmacroObDdllLongDqRank0_1",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank0_1) },
+	{ "EmcPmacroObDdllLongDqRank0_2",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank0_2) },
+	{ "EmcPmacroObDdllLongDqRank0_3",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank0_3) },
+	{ "EmcPmacroObDdllLongDqRank0_4",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank0_4) },
+	{ "EmcPmacroObDdllLongDqRank0_5",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank0_5) },
+	{ "EmcPmacroObDdllLongDqRank1_0",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank1_0) },
+	{ "EmcPmacroObDdllLongDqRank1_1",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank1_1) },
+	{ "EmcPmacroObDdllLongDqRank1_2",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank1_2) },
+	{ "EmcPmacroObDdllLongDqRank1_3",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank1_3) },
+	{ "EmcPmacroObDdllLongDqRank1_4",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank1_4) },
+	{ "EmcPmacroObDdllLongDqRank1_5",   TOKEN(emc_pmacro_ob_ddll_long_dq_rank1_5) },
+	{ "EmcPmacroObDdllLongDqsRank0_0",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank0_0) },
+	{ "EmcPmacroObDdllLongDqsRank0_1",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank0_1) },
+	{ "EmcPmacroObDdllLongDqsRank0_2",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank0_2) },
+	{ "EmcPmacroObDdllLongDqsRank0_3",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank0_3) },
+	{ "EmcPmacroObDdllLongDqsRank0_4",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank0_4) },
+	{ "EmcPmacroObDdllLongDqsRank0_5",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank0_5) },
+	{ "EmcPmacroObDdllLongDqsRank1_0",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank1_0) },
+	{ "EmcPmacroObDdllLongDqsRank1_1",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank1_1) },
+	{ "EmcPmacroObDdllLongDqsRank1_2",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank1_2) },
+	{ "EmcPmacroObDdllLongDqsRank1_3",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank1_3) },
+	{ "EmcPmacroObDdllLongDqsRank1_4",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank1_4) },
+	{ "EmcPmacroObDdllLongDqsRank1_5",   TOKEN(emc_pmacro_ob_ddll_long_dqs_rank1_5) },
+
+	{ "EmcPmacroIbDdllLongDqsRank0_0",   TOKEN(emc_pmacro_ib_ddll_long_dqs_rank0_0) },
+	{ "EmcPmacroIbDdllLongDqsRank0_1",   TOKEN(emc_pmacro_ib_ddll_long_dqs_rank0_1) },
+	{ "EmcPmacroIbDdllLongDqsRank0_2",   TOKEN(emc_pmacro_ib_ddll_long_dqs_rank0_2) },
+	{ "EmcPmacroIbDdllLongDqsRank0_3",   TOKEN(emc_pmacro_ib_ddll_long_dqs_rank0_3) },
+	{ "EmcPmacroIbDdllLongDqsRank1_0",   TOKEN(emc_pmacro_ib_ddll_long_dqs_rank1_0) },
+	{ "EmcPmacroIbDdllLongDqsRank1_1",   TOKEN(emc_pmacro_ib_ddll_long_dqs_rank1_1) },
+	{ "EmcPmacroIbDdllLongDqsRank1_2",   TOKEN(emc_pmacro_ib_ddll_long_dqs_rank1_2) },
+	{ "EmcPmacroIbDdllLongDqsRank1_3",   TOKEN(emc_pmacro_ib_ddll_long_dqs_rank1_3) },
+
+	{ "EmcPmacroDdllLongCmd_0",     TOKEN(emc_pmacro_ddll_long_cmd_0) },
+	{ "EmcPmacroDdllLongCmd_1",     TOKEN(emc_pmacro_ddll_long_cmd_1) },
+	{ "EmcPmacroDdllLongCmd_2",     TOKEN(emc_pmacro_ddll_long_cmd_2) },
+	{ "EmcPmacroDdllLongCmd_3",     TOKEN(emc_pmacro_ddll_long_cmd_3) },
+	{ "EmcPmacroDdllLongCmd_4",     TOKEN(emc_pmacro_ddll_long_cmd_4) },
+	{ "EmcPmacroDdllShortCmd_0",    TOKEN(emc_pmacro_ddll_short_cmd_0) },
+	{ "EmcPmacroDdllShortCmd_1",    TOKEN(emc_pmacro_ddll_short_cmd_1) },
+	{ "EmcPmacroDdllShortCmd_2",    TOKEN(emc_pmacro_ddll_short_cmd_2) },
+
+	{ "WarmBootWait",               TOKEN(warm_boot_wait) },
+	{ "EmcOdtWrite",                TOKEN(emc_odt_write) },
+	{ "EmcZcalInterval",            TOKEN(emc_zcal_interval) },
+	{ "EmcZcalWaitCnt",             TOKEN(emc_zcal_wait_cnt) },
+	{ "EmcZcalMrwCmd",              TOKEN(emc_zcal_mrw_cmd) },
+	{ "EmcMrsResetDll",             TOKEN(emc_mrs_reset_dll) },
+
+
+	{ "EmcZcalInitDev0",            TOKEN(emc_zcal_init_dev0) },
+	{ "EmcZcalInitDev1",            TOKEN(emc_zcal_init_dev1) },
+	{ "EmcZcalInitWait",            TOKEN(emc_zcal_init_wait) },
+	{ "EmcZcalWarmColdBootEnables", TOKEN(emc_zcal_warm_cold_boot_enables) },
+	{ "EmcMrwLpddr2ZcalWarmBoot",   TOKEN(emc_mrw_lpddr2zcal_warm_boot) },
+	{ "EmcZqCalDdr3WarmBoot",       TOKEN(emc_zqcal_ddr3_warm_boot) },
+
+	{ "EmcZqCalLpDdr4WarmBoot",     TOKEN(emc_zqcal_lpddr4_warm_boot) },
+
+	{ "EmcZcalWarmBootWait",        TOKEN(emc_zcal_warm_boot_wait) },
+	{ "EmcMrsWarmBootEnable",       TOKEN(emc_mrs_warm_boot_enable) },
+
+	{ "EmcMrsResetDllWait",         TOKEN(emc_mrs_reset_dll_wait) },
+
+	{ "EmcMrsExtra",                TOKEN(emc_mrs_extra) },
+	{ "EmcWarmBootMrsExtra",        TOKEN(emc_warm_boot_mrs_extra) },
+
+	{ "EmcEmrsDdr2DllEnable",       TOKEN(emc_emrs_ddr2_dll_enable) },
+	{ "EmcMrsDdr2DllReset",         TOKEN(emc_mrs_ddr2_dll_reset) },
+	{ "EmcEmrsDdr2OcdCalib",        TOKEN(emc_emrs_ddr2_ocd_calib) },
+
+	{ "EmcDdr2Wait",                TOKEN(emc_ddr2_wait) },
+	{ "EmcClkenOverride",           TOKEN(emc_clken_override) },
+	{ "EmcExtraRefreshNum",         TOKEN(emc_extra_refresh_num) },
+	{ "EmcClkenOverrideAllWarmBoot",
+			TOKEN(emc_clken_override_allwarm_boot) },
+	{ "McClkenOverrideAllWarmBoot", TOKEN(mc_clken_override_allwarm_boot) },
+	{ "EmcCfgDigDllPeriodWarmBoot",
+			TOKEN(emc_cfg_dig_dll_period_warm_boot) },
+	{ "PmcVddpSel",                 TOKEN(pmc_vddp_sel) },
+	{ "PmcVddpSelWait",             TOKEN(pmc_vddp_sel_wait) },
+	{ "PmcDdrPwr",                  TOKEN(pmc_ddr_pwr) },
+	{ "PmcDdrCfg",                  TOKEN(pmc_ddr_cfg) },
+	{ "PmcIoDpd3Req",               TOKEN(pmc_io_dpd3_req) },
+	{ "PmcIoDpd3ReqWait",           TOKEN(pmc_io_dpd3_req_wait) },
+
+	{ "PmcIoDpd4ReqWait",           TOKEN(pmc_io_dpd4_req_wait) },
+
+	{ "PmcRegShort",                TOKEN(pmc_reg_short) },
+	{ "PmcNoIoPower",               TOKEN(pmc_no_io_power) },
+
+	{ "PmcDdrCntrlWait",            TOKEN(pmc_ddr_ctrl_wait) },
+	{ "PmcDdrCntrl",                TOKEN(pmc_ddr_ctrl) },
+
+	{ "EmcAcpdControl",             TOKEN(emc_acpd_control) },
+	{ "EmcSwizzleRank0Byte0",       TOKEN(emc_swizzle_rank0_byte0) },
+	{ "EmcSwizzleRank0Byte1",       TOKEN(emc_swizzle_rank0_byte1) },
+	{ "EmcSwizzleRank0Byte2",       TOKEN(emc_swizzle_rank0_byte2) },
+	{ "EmcSwizzleRank0Byte3",       TOKEN(emc_swizzle_rank0_byte3) },
+	{ "EmcSwizzleRank1Byte0",       TOKEN(emc_swizzle_rank1_byte0) },
+	{ "EmcSwizzleRank1Byte1",       TOKEN(emc_swizzle_rank1_byte1) },
+	{ "EmcSwizzleRank1Byte2",       TOKEN(emc_swizzle_rank1_byte2) },
+	{ "EmcSwizzleRank1Byte3",       TOKEN(emc_swizzle_rank1_byte3) },
+
+	{ "EmcTxdsrvttgen",             TOKEN(emc_txdsrvttgen) },
+
+	{ "EmcDataBrlshft0",            TOKEN(emc_data_brlshft0) },
+	{ "EmcDataBrlshft1",            TOKEN(emc_data_brlshft1) },
+	{ "EmcDqsBrlshft0",             TOKEN(emc_dqs_brlshft0) },
+	{ "EmcDqsBrlshft1",             TOKEN(emc_dqs_brlshft1) },
+	{ "EmcCmdBrlshft0",             TOKEN(emc_cmd_brlshft0) },
+	{ "EmcCmdBrlshft1",             TOKEN(emc_cmd_brlshft1) },
+	{ "EmcCmdBrlshft2",             TOKEN(emc_cmd_brlshft2) },
+	{ "EmcCmdBrlshft3",             TOKEN(emc_cmd_brlshft3) },
+
+	{ "EmcQuseBrlshft0",            TOKEN(emc_quse_brlshft0) },
+	{ "EmcQuseBrlshft1",            TOKEN(emc_quse_brlshft1) },
+	{ "EmcQuseBrlshft2",            TOKEN(emc_quse_brlshft2) },
+	{ "EmcQuseBrlshft3",            TOKEN(emc_quse_brlshft3) },
+
+	{ "EmcDllCfg0",                 TOKEN(emc_dll_cfg0) },
+	{ "EmcDllCfg1",                 TOKEN(emc_dll_cfg1) },
+
+	{ "EmcPmcScratch1",             TOKEN(emc_pmc_scratch1) },
+	{ "EmcPmcScratch2",             TOKEN(emc_pmc_scratch2) },
+	{ "EmcPmcScratch3",             TOKEN(emc_pmc_scratch3) },
+
+	{ "EmcPmacroPadCfgCtrl",        TOKEN(emc_pmacro_pad_cfg_ctrl) },
+
+	{ "EmcPmacroVttgenCtrl0",       TOKEN(emc_pmacro_vttgen_ctrl0) },
+	{ "EmcPmacroVttgenCtrl1",       TOKEN(emc_pmacro_vttgen_ctrl1) },
+	{ "EmcPmacroVttgenCtrl2",       TOKEN(emc_pmacro_vttgen_ctrl2) },
+
+	{ "EmcPmacroBrickCtrlRfu1",     TOKEN(emc_pmacro_brick_ctrl_rfu1) },
+	{ "EmcPmacroCmdBrickCtrlFdpd",  TOKEN(emc_pmacro_cmd_brick_ctrl_fdpd) },
+
+	{ "EmcPmacroBrickCtrlRfu2",     TOKEN(emc_pmacro_brick_ctrl_rfu2) },
+	{ "EmcPmacroDataBrickCtrlFdpd", TOKEN(emc_pmacro_data_brick_ctrl_fdpd) },
+
+	{ "EmcPmacroBgBiasCtrl0",       TOKEN(emc_pmacro_bg_bias_ctrl0) },
+	{ "EmcPmacroDataPadRxCtrl",     TOKEN(emc_pmacro_data_pad_rx_ctrl) },
+	{ "EmcPmacroCmdPadRxCtrl",      TOKEN(emc_pmacro_cmd_pad_rx_ctrl) },
+	{ "EmcPmacroDataRxTermMode",    TOKEN(emc_pmacro_data_rx_term_mode) },
+
+	{ "EmcPmacroCmdRxTermMode",     TOKEN(emc_pmacro_cmd_rx_term_mode) },
+	{ "EmcPmacroDataPadTxCtrl",     TOKEN(emc_pmacro_data_pad_tx_ctrl) },
+	{ "EmcPmacroCommonPadTxCtrl",   TOKEN(emc_pmacro_common_pad_tx_ctrl) },
+	{ "EmcPmacroCmdPadTxCtrl",      TOKEN(emc_pmacro_cmd_pad_tx_ctrl) },
+
+	{ "EmcCfg3",                    TOKEN(emc_cfg3) },
+
+	{ "EmcPmacroTxPwrd0",           TOKEN(emc_pmacro_tx_pwrd0) },
+	{ "EmcPmacroTxPwrd1",           TOKEN(emc_pmacro_tx_pwrd1) },
+	{ "EmcPmacroTxPwrd2",           TOKEN(emc_pmacro_tx_pwrd2) },
+	{ "EmcPmacroTxPwrd3",           TOKEN(emc_pmacro_tx_pwrd3) },
+	{ "EmcPmacroTxPwrd4",           TOKEN(emc_pmacro_tx_pwrd4) },
+	{ "EmcPmacroTxPwrd5",           TOKEN(emc_pmacro_tx_pwrd5) },
+
+	{ "EmcConfigSampleDelay",       TOKEN(emc_config_sample_delay) },
+
+	{ "EmcPmacroBrickMapping0",     TOKEN(emc_pmacro_brick_mapping0) },
+	{ "EmcPmacroBrickMapping1",     TOKEN(emc_pmacro_brick_mapping1) },
+	{ "EmcPmacroBrickMapping2",     TOKEN(emc_pmacro_brick_mapping2) },
+
+	{ "EmcPmacroTxSelClkSrc0",      TOKEN(emc_pmacro_tx_sel_clk_src0) },
+	{ "EmcPmacroTxSelClkSrc1",      TOKEN(emc_pmacro_tx_sel_clk_src1) },
+	{ "EmcPmacroTxSelClkSrc2",      TOKEN(emc_pmacro_tx_sel_clk_src2) },
+	{ "EmcPmacroTxSelClkSrc3",      TOKEN(emc_pmacro_tx_sel_clk_src3) },
+	{ "EmcPmacroTxSelClkSrc4",      TOKEN(emc_pmacro_tx_sel_clk_src4) },
+	{ "EmcPmacroTxSelClkSrc5",      TOKEN(emc_pmacro_tx_sel_clk_src5) },
+
+	{ "EmcPmacroDdllBypass",        TOKEN(emc_pmacro_ddll_bypass) },
+
+	{ "EmcPmacroDdllPwrd0",         TOKEN(emc_pmacro_ddll_pwrd0) },
+	{ "EmcPmacroDdllPwrd1",         TOKEN(emc_pmacro_ddll_pwrd1) },
+	{ "EmcPmacroDdllPwrd2",         TOKEN(emc_pmacro_ddll_pwrd2) },
+
+	{ "EmcPmacroCmdCtrl0",          TOKEN(emc_pmacro_cmd_ctrl0) },
+	{ "EmcPmacroCmdCtrl1",          TOKEN(emc_pmacro_cmd_ctrl1) },
+	{ "EmcPmacroCmdCtrl2",          TOKEN(emc_pmacro_cmd_ctrl2) },
+
+	{ "McEmemAdrCfg",               TOKEN(mc_emem_adr_cfg) },
+	{ "McEmemAdrCfgDev0",           TOKEN(mc_emem_adr_cfg_dev0) },
+	{ "McEmemAdrCfgDev1",           TOKEN(mc_emem_adr_cfg_dev1) },
+	{ "McEmemAdrCfgChannelMask",    TOKEN(mc_emem_adr_cfg_channel_mask) },
+	{ "McEmemAdrCfgBankMask0",      TOKEN(mc_emem_adr_cfg_bank_mask0) },
+	{ "McEmemAdrCfgBankMask1",      TOKEN(mc_emem_adr_cfg_bank_mask1) },
+	{ "McEmemAdrCfgBankMask2",      TOKEN(mc_emem_adr_cfg_bank_mask2) },
+
+	{ "McEmemCfg",                  TOKEN(mc_emem_cfg) },
+	{ "McEmemArbCfg",               TOKEN(mc_emem_arb_cfg) },
+	{ "McEmemArbOutstandingReq",    TOKEN(mc_emem_arb_outstanding_req) },
+
+	{ "McEmemArbRefpbHpCtrl",       TOKEN(emc_emem_arb_refpb_hp_ctrl) },
+	{ "McEmemArbRefpbBankCtrl",     TOKEN(emc_emem_arb_refpb_bank_ctrl) },
+
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
+
+	{ "McEmemArbTimingRFCPB",       TOKEN(mc_emem_arb_timing_rfcpb) },
+
+	{ "McEmemArbDaTurns",           TOKEN(mc_emem_arb_da_turns) },
+	{ "McEmemArbDaCovers",          TOKEN(mc_emem_arb_da_covers) },
+	{ "McEmemArbMisc0",             TOKEN(mc_emem_arb_misc0) },
+	{ "McEmemArbMisc1",             TOKEN(mc_emem_arb_misc1) },
+	{ "McEmemArbMisc2",             TOKEN(mc_emem_arb_misc2) },
+	{ "McEmemArbRing1Throttle",     TOKEN(mc_emem_arb_ring1_throttle) },
+	{ "McEmemArbOverride",          TOKEN(mc_emem_arb_override) },
+	{ "McEmemArbOverride1",         TOKEN(mc_emem_arb_override1) },
+	{ "McEmemArbRsv",               TOKEN(mc_emem_arb_rsv) },
+
+	{ "McDaCfg0",                   TOKEN(mc_da_cfg0) },
+	{ "McEmemArbTimingCcdmw",       TOKEN(mc_emem_arb_timing_ccdmw) },
+
+	{ "McClkenOverride",            TOKEN(mc_clken_override) },
+	{ "McStatControl",              TOKEN(mc_stat_control) },
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
+
+	{ "McGeneralizedCarveout1Bom",  TOKEN(mc_generalized_carveout1_bom) },
+	{ "McGeneralizedCarveout1BomHi",TOKEN(mc_generalized_carveout1_bom_hi) },
+	{ "McGeneralizedCarveout1Size128kb",
+			TOKEN(mc_generalized_carveout1_size_128kb) },
+	{ "McGeneralizedCarveout1Access0",
+			TOKEN(mc_generalized_carveout1_access0) },
+	{ "McGeneralizedCarveout1Access1",
+			TOKEN(mc_generalized_carveout1_access1) },
+	{ "McGeneralizedCarveout1Access2",
+			TOKEN(mc_generalized_carveout1_access2) },
+	{ "McGeneralizedCarveout1Access3",
+			TOKEN(mc_generalized_carveout1_access3) },
+	{ "McGeneralizedCarveout1Access4",
+			TOKEN(mc_generalized_carveout1_access4) },
+	{ "McGeneralizedCarveout1ForceInternalAccess0",
+			TOKEN(mc_generalized_carveout1_force_internal_access0) },
+	{ "McGeneralizedCarveout1ForceInternalAccess1",
+			TOKEN(mc_generalized_carveout1_force_internal_access1) },
+	{ "McGeneralizedCarveout1ForceInternalAccess2",
+			TOKEN(mc_generalized_carveout1_force_internal_access2) },
+	{ "McGeneralizedCarveout1ForceInternalAccess3",
+			TOKEN(mc_generalized_carveout1_force_internal_access3) },
+	{ "McGeneralizedCarveout1ForceInternalAccess4",
+			TOKEN(mc_generalized_carveout1_force_internal_access4) },
+	{ "McGeneralizedCarveout1Cfg0", TOKEN(mc_generalized_carveout1_cfg0) },
+
+	{ "McGeneralizedCarveout2Bom",  TOKEN(mc_generalized_carveout2_bom) },
+	{ "McGeneralizedCarveout2BomHi",TOKEN(mc_generalized_carveout2_bom_hi) },
+	{ "McGeneralizedCarveout2Size128kb",
+			TOKEN(mc_generalized_carveout2_size_128kb) },
+	{ "McGeneralizedCarveout2Access0",
+			TOKEN(mc_generalized_carveout2_access0) },
+	{ "McGeneralizedCarveout2Access1",
+			TOKEN(mc_generalized_carveout2_access1) },
+	{ "McGeneralizedCarveout2Access2",
+			TOKEN(mc_generalized_carveout2_access2) },
+	{ "McGeneralizedCarveout2Access3",
+			TOKEN(mc_generalized_carveout2_access3) },
+	{ "McGeneralizedCarveout2Access4",
+			TOKEN(mc_generalized_carveout2_access4) },
+	{ "McGeneralizedCarveout2ForceInternalAccess0",
+			TOKEN(mc_generalized_carveout2_force_internal_access0) },
+	{ "McGeneralizedCarveout2ForceInternalAccess1",
+			TOKEN(mc_generalized_carveout2_force_internal_access1) },
+	{ "McGeneralizedCarveout2ForceInternalAccess2",
+			TOKEN(mc_generalized_carveout2_force_internal_access2) },
+	{ "McGeneralizedCarveout2ForceInternalAccess3",
+			TOKEN(mc_generalized_carveout2_force_internal_access3) },
+	{ "McGeneralizedCarveout2ForceInternalAccess4",
+			TOKEN(mc_generalized_carveout2_force_internal_access4) },
+	{ "McGeneralizedCarveout2Cfg0", TOKEN(mc_generalized_carveout2_cfg0) },
+
+	{ "McGeneralizedCarveout3Bom",  TOKEN(mc_generalized_carveout3_bom) },
+	{ "McGeneralizedCarveout3BomHi",TOKEN(mc_generalized_carveout3_bom_hi) },
+	{ "McGeneralizedCarveout3Size128kb",
+			TOKEN(mc_generalized_carveout3_size_128kb) },
+	{ "McGeneralizedCarveout3Access0",
+			TOKEN(mc_generalized_carveout3_access0) },
+	{ "McGeneralizedCarveout3Access1",
+			TOKEN(mc_generalized_carveout3_access1) },
+	{ "McGeneralizedCarveout3Access2",
+			TOKEN(mc_generalized_carveout3_access2) },
+	{ "McGeneralizedCarveout3Access3",
+			TOKEN(mc_generalized_carveout3_access3) },
+	{ "McGeneralizedCarveout3Access4",
+			TOKEN(mc_generalized_carveout3_access4) },
+	{ "McGeneralizedCarveout3ForceInternalAccess0",
+			TOKEN(mc_generalized_carveout3_force_internal_access0) },
+	{ "McGeneralizedCarveout3ForceInternalAccess1",
+			TOKEN(mc_generalized_carveout3_force_internal_access1) },
+	{ "McGeneralizedCarveout3ForceInternalAccess2",
+			TOKEN(mc_generalized_carveout3_force_internal_access2) },
+	{ "McGeneralizedCarveout3ForceInternalAccess3",
+			TOKEN(mc_generalized_carveout3_force_internal_access3) },
+	{ "McGeneralizedCarveout3ForceInternalAccess4",
+			TOKEN(mc_generalized_carveout3_force_internal_access4) },
+	{ "McGeneralizedCarveout3Cfg0", TOKEN(mc_generalized_carveout3_cfg0) },
+
+	{ "McGeneralizedCarveout4Bom",  TOKEN(mc_generalized_carveout4_bom) },
+	{ "McGeneralizedCarveout4BomHi",TOKEN(mc_generalized_carveout4_bom_hi) },
+	{ "McGeneralizedCarveout4Size128kb",
+			TOKEN(mc_generalized_carveout4_size_128kb) },
+	{ "McGeneralizedCarveout4Access0",
+			TOKEN(mc_generalized_carveout4_access0) },
+	{ "McGeneralizedCarveout4Access1",
+			TOKEN(mc_generalized_carveout4_access1) },
+	{ "McGeneralizedCarveout4Access2",
+			TOKEN(mc_generalized_carveout4_access2) },
+	{ "McGeneralizedCarveout4Access3",
+			TOKEN(mc_generalized_carveout4_access3) },
+	{ "McGeneralizedCarveout4Access4",
+			TOKEN(mc_generalized_carveout4_access4) },
+	{ "McGeneralizedCarveout4ForceInternalAccess0",
+			TOKEN(mc_generalized_carveout4_force_internal_access0) },
+	{ "McGeneralizedCarveout4ForceInternalAccess1",
+			TOKEN(mc_generalized_carveout4_force_internal_access1) },
+	{ "McGeneralizedCarveout4ForceInternalAccess2",
+			TOKEN(mc_generalized_carveout4_force_internal_access2) },
+	{ "McGeneralizedCarveout4ForceInternalAccess3",
+			TOKEN(mc_generalized_carveout4_force_internal_access3) },
+	{ "McGeneralizedCarveout4ForceInternalAccess4",
+			TOKEN(mc_generalized_carveout4_force_internal_access4) },
+	{ "McGeneralizedCarveout4Cfg0", TOKEN(mc_generalized_carveout4_cfg0) },
+
+	{ "McGeneralizedCarveout5Bom",  TOKEN(mc_generalized_carveout5_bom) },
+	{ "McGeneralizedCarveout5BomHi",TOKEN(mc_generalized_carveout5_bom_hi) },
+	{ "McGeneralizedCarveout5Size128kb",
+			TOKEN(mc_generalized_carveout5_size_128kb) },
+	{ "McGeneralizedCarveout5Access0",
+			TOKEN(mc_generalized_carveout5_access0) },
+	{ "McGeneralizedCarveout5Access1",
+			TOKEN(mc_generalized_carveout5_access1) },
+	{ "McGeneralizedCarveout5Access2",
+			TOKEN(mc_generalized_carveout5_access2) },
+	{ "McGeneralizedCarveout5Access3",
+			TOKEN(mc_generalized_carveout5_access3) },
+	{ "McGeneralizedCarveout5Access4",
+			TOKEN(mc_generalized_carveout5_access4) },
+	{ "McGeneralizedCarveout5ForceInternalAccess0",
+			TOKEN(mc_generalized_carveout5_force_internal_access0) },
+	{ "McGeneralizedCarveout5ForceInternalAccess1",
+			TOKEN(mc_generalized_carveout5_force_internal_access1) },
+	{ "McGeneralizedCarveout5ForceInternalAccess2",
+			TOKEN(mc_generalized_carveout5_force_internal_access2) },
+	{ "McGeneralizedCarveout5ForceInternalAccess3",
+			TOKEN(mc_generalized_carveout5_force_internal_access3) },
+	{ "McGeneralizedCarveout5ForceInternalAccess4",
+			TOKEN(mc_generalized_carveout5_force_internal_access4) },
+	{ "McGeneralizedCarveout5Cfg0", TOKEN(mc_generalized_carveout5_cfg0) },
+
+	{ "EmcCaTrainingEnable",        TOKEN(emc_ca_training_enable) },
+	{ "SwizzleRankByteEncode",      TOKEN(swizzle_rank_byte_encode) },
+	{ "BootRomPatchControl",        TOKEN(boot_rom_patch_control) },
+	{ "BootRomPatchData",           TOKEN(boot_rom_patch_data) },
+
+	{ "McMtsCarveoutBom",           TOKEN(mc_mts_carveout_bom) },
+	{ "McMtsCarveoutAdrHi",         TOKEN(mc_mts_carveout_adr_hi) },
+	{ "McMtsCarveoutSizeMb",        TOKEN(mc_mts_carveout_size_mb) },
+	{ "McMtsCarveoutRegCtrl",       TOKEN(mc_mts_carveout_reg_ctrl) },
+	{ NULL, 0, 0, NULL }
+};
+
+field_item s_sdmmc_table_t210[] = {
+	{ "ClockDivider",               TOKEN(sdmmc_clock_divider) },
+	{ "DataWidth",
+	  token_sdmmc_data_width,
+	  field_type_enum,
+	  s_sdmmc_data_width_table_t210 },
+	{ "MaxPowerClassSupported",     TOKEN(sdmmc_max_power_class_supported) },
+	{ "MultiPageSupport",           TOKEN(sdmmc_multi_page_support) },
+	{ NULL, 0, 0, NULL }
+};
+
+field_item s_spiflash_table_t210[] = {
+	{ "ReadCommandTypeFast",        TOKEN(spiflash_read_command_type_fast) },
+	{ "PageSize2kor16k",            TOKEN(spiflash_page_size_2k_or_16k) },
+	{ "ClockDivider",               TOKEN(spiflash_clock_divider) },
+	{ "ClockSource",
+	  token_spiflash_clock_source,
+	  field_type_enum,
+	  s_spi_clock_source_table_t210 },
+	{ NULL, 0, 0, NULL }
+};
+
+parse_subfield_item s_device_type_table_t210[] = {
+	{ "SdmmcParams.", token_sdmmc_params,
+		s_sdmmc_table_t210, t210_set_dev_param },
+	{ "SpiFlashParams.", token_spiflash_params,
+		s_spiflash_table_t210, t210_set_dev_param },
+	{ NULL, 0, NULL }
+};
-- 
1.8.1.5
