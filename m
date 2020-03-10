From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 5/8] memory: tegra: Add EMC scaling support code for Tegra210
Date: Tue, 10 Mar 2020 16:20:00 +0100
Message-ID: <20200310152003.2945170-6-thierry.reding@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200310152003.2945170-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is the initial patch for Tegra210 EMC frequency scaling. It has the
code to program various aspects of the EMC that are standardized, but it
does not yet include the specific programming sequence needed for clock
scaling.

The driver is designed to support LPDDR4 SDRAM. Devices that use LPDDR4
need to perform training of the RAM before it can be used. Firmware will
perform this training during early boot and pass a table of supported
frequencies to the kernel via device tree.

For the frequencies above 800 MHz, periodic retraining is needed to
compensate for changes in timing. This periodic training will have to be
performed until the frequency drops back to or below 800 MHz.

This driver provides helpers used during this runtime retraining that
will be used by the sequence specific code in a follow-up patch.

Based on work by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v5:
- major rework and cleanup

 drivers/memory/tegra/tegra210-emc.c | 1952 +++++++++++++++++++++------
 drivers/memory/tegra/tegra210-emc.h |  893 +++++++++++-
 2 files changed, 2390 insertions(+), 455 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/tegra210-emc.c
index 80ea14d1e6ce..4ea8fb70a4fd 100644
--- a/drivers/memory/tegra/tegra210-emc.c
+++ b/drivers/memory/tegra/tegra210-emc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2015-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/mc.h>
@@ -22,454 +23,1547 @@
 #define EMC_CLK_EMC_2X_CLK_SRC_SHIFT			29
 #define EMC_CLK_EMC_2X_CLK_SRC_MASK			\
 	(0x7 << EMC_CLK_EMC_2X_CLK_SRC_SHIFT)
+#define EMC_CLK_SOURCE_PLLM_LJ				0x4
+#define EMC_CLK_SOURCE_PLLMB_LJ				0x5
 #define EMC_CLK_MC_EMC_SAME_FREQ			BIT(16)
 #define EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT		0
 #define EMC_CLK_EMC_2X_CLK_DIVISOR_MASK			\
 	(0xff << EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT)
 
+#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL		0x664
+#define DLL_CLK_EMC_DLL_CLK_SRC_SHIFT			29
+#define DLL_CLK_EMC_DLL_CLK_SRC_MASK			\
+	(0x7 << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT)
+#define DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT		10
+#define DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK		\
+	(0x3 << DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT)
+#define PLLM_VCOA					0
+#define PLLM_VCOB					1
+#define EMC_DLL_SWITCH_OUT				2
+#define DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT		0
+#define DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK		\
+	(0xff << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT)
+
 #define MC_EMEM_ARB_MISC0_EMC_SAME_FREQ			BIT(27)
 
 #define TEGRA_EMC_MAX_FREQS		16
-#define TEGRA210_EMC_SUSPEND_RATE	204000000
-
-#define CLK_CHANGE_DELAY 100
-#define TRAINING_TIME 100
-
-enum {
-	TEGRA_EMC_SRC_PLLM,
-	TEGRA_EMC_SRC_PLLC,
-	TEGRA_EMC_SRC_PLLP,
-	TEGRA_EMC_SRC_CLKM,
-	TEGRA_EMC_SRC_PLLM_UD,
-	TEGRA_EMC_SRC_PLLMB_UD,
-	TEGRA_EMC_SRC_PLLMB,
-	TEGRA_EMC_SRC_PLLP_UD,
-	TEGRA_EMC_SRC_COUNT,
-};
 
-struct emc_sel {
-	struct clk *input;
-	u32 value;
-	unsigned long input_rate;
-
-	struct clk *input_b;		// second source of PLLM: PLLMB
-	u32 value_b;
-	unsigned long input_rate_b;
+#define EMC0_EMC_DATA_BRLSHFT_0_INDEX	2
+#define EMC1_EMC_DATA_BRLSHFT_0_INDEX	3
+#define EMC0_EMC_DATA_BRLSHFT_1_INDEX	4
+#define EMC1_EMC_DATA_BRLSHFT_1_INDEX	5
+
+#define TRIM_REG(chan, rank, reg, byte)					\
+	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
+	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
+	   next->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##		\
+				 rank ## _ ## reg ## _INDEX]) >>	\
+	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
+	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
+	 +								\
+	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
+	    byte ## _DATA_BRLSHFT_MASK &				\
+	    next->trim_perch_regs[EMC ## chan ##			\
+			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
+	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
+	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
+
+#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
+	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
+	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT) & \
+	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
+	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
+	 |								\
+	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
+	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT) & \
+	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
+	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))
+
+static const struct tegra210_emc_sequence *tegra210_emc_sequences[] = {
 };
 
-static struct emc_sel *emc_clk_sel;
-static struct clk *emc_src[TEGRA_EMC_SRC_COUNT];
-static const char *emc_src_names[TEGRA_EMC_SRC_COUNT] = {
-	[TEGRA_EMC_SRC_PLLM] = "pll_m",
-	[TEGRA_EMC_SRC_PLLC] = "pll_c",
-	[TEGRA_EMC_SRC_PLLP] = "pll_p",
-	[TEGRA_EMC_SRC_CLKM] = "clk_m",
-	[TEGRA_EMC_SRC_PLLM_UD] = "pll_m_ud",
-	[TEGRA_EMC_SRC_PLLMB_UD] = "pll_mb_ud",
-	[TEGRA_EMC_SRC_PLLMB] = "pll_mb",
-	[TEGRA_EMC_SRC_PLLP_UD] = "pll_p_ud",
+static const struct tegra210_emc_table_register_offsets
+tegra210_emc_table_register_offsets = {
+	.burst = {
+		EMC_RC,
+		EMC_RFC,
+		EMC_RFCPB,
+		EMC_REFCTRL2,
+		EMC_RFC_SLR,
+		EMC_RAS,
+		EMC_RP,
+		EMC_R2W,
+		EMC_W2R,
+		EMC_R2P,
+		EMC_W2P,
+		EMC_R2R,
+		EMC_TPPD,
+		EMC_CCDMW,
+		EMC_RD_RCD,
+		EMC_WR_RCD,
+		EMC_RRD,
+		EMC_REXT,
+		EMC_WEXT,
+		EMC_WDV_CHK,
+		EMC_WDV,
+		EMC_WSV,
+		EMC_WEV,
+		EMC_WDV_MASK,
+		EMC_WS_DURATION,
+		EMC_WE_DURATION,
+		EMC_QUSE,
+		EMC_QUSE_WIDTH,
+		EMC_IBDLY,
+		EMC_OBDLY,
+		EMC_EINPUT,
+		EMC_MRW6,
+		EMC_EINPUT_DURATION,
+		EMC_PUTERM_EXTRA,
+		EMC_PUTERM_WIDTH,
+		EMC_QRST,
+		EMC_QSAFE,
+		EMC_RDV,
+		EMC_RDV_MASK,
+		EMC_RDV_EARLY,
+		EMC_RDV_EARLY_MASK,
+		EMC_REFRESH,
+		EMC_BURST_REFRESH_NUM,
+		EMC_PRE_REFRESH_REQ_CNT,
+		EMC_PDEX2WR,
+		EMC_PDEX2RD,
+		EMC_PCHG2PDEN,
+		EMC_ACT2PDEN,
+		EMC_AR2PDEN,
+		EMC_RW2PDEN,
+		EMC_CKE2PDEN,
+		EMC_PDEX2CKE,
+		EMC_PDEX2MRR,
+		EMC_TXSR,
+		EMC_TXSRDLL,
+		EMC_TCKE,
+		EMC_TCKESR,
+		EMC_TPD,
+		EMC_TFAW,
+		EMC_TRPAB,
+		EMC_TCLKSTABLE,
+		EMC_TCLKSTOP,
+		EMC_MRW7,
+		EMC_TREFBW,
+		EMC_ODT_WRITE,
+		EMC_FBIO_CFG5,
+		EMC_FBIO_CFG7,
+		EMC_CFG_DIG_DLL,
+		EMC_CFG_DIG_DLL_PERIOD,
+		EMC_PMACRO_IB_RXRT,
+		EMC_CFG_PIPE_1,
+		EMC_CFG_PIPE_2,
+		EMC_PMACRO_QUSE_DDLL_RANK0_4,
+		EMC_PMACRO_QUSE_DDLL_RANK0_5,
+		EMC_PMACRO_QUSE_DDLL_RANK1_4,
+		EMC_PMACRO_QUSE_DDLL_RANK1_5,
+		EMC_MRW8,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_4,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_5,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_0,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_1,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_2,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_3,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_4,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_5,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_0,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_1,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_2,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_3,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_4,
+		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_5,
+		EMC_PMACRO_DDLL_LONG_CMD_0,
+		EMC_PMACRO_DDLL_LONG_CMD_1,
+		EMC_PMACRO_DDLL_LONG_CMD_2,
+		EMC_PMACRO_DDLL_LONG_CMD_3,
+		EMC_PMACRO_DDLL_LONG_CMD_4,
+		EMC_PMACRO_DDLL_SHORT_CMD_0,
+		EMC_PMACRO_DDLL_SHORT_CMD_1,
+		EMC_PMACRO_DDLL_SHORT_CMD_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_3,
+		EMC_TXDSRVTTGEN,
+		EMC_FDPD_CTRL_DQ,
+		EMC_FDPD_CTRL_CMD,
+		EMC_FBIO_SPARE,
+		EMC_ZCAL_INTERVAL,
+		EMC_ZCAL_WAIT_CNT,
+		EMC_MRS_WAIT_CNT,
+		EMC_MRS_WAIT_CNT2,
+		EMC_AUTO_CAL_CHANNEL,
+		EMC_DLL_CFG_0,
+		EMC_DLL_CFG_1,
+		EMC_PMACRO_AUTOCAL_CFG_COMMON,
+		EMC_PMACRO_ZCTRL,
+		EMC_CFG,
+		EMC_CFG_PIPE,
+		EMC_DYN_SELF_REF_CONTROL,
+		EMC_QPOP,
+		EMC_DQS_BRLSHFT_0,
+		EMC_DQS_BRLSHFT_1,
+		EMC_CMD_BRLSHFT_2,
+		EMC_CMD_BRLSHFT_3,
+		EMC_PMACRO_PAD_CFG_CTRL,
+		EMC_PMACRO_DATA_PAD_RX_CTRL,
+		EMC_PMACRO_CMD_PAD_RX_CTRL,
+		EMC_PMACRO_DATA_RX_TERM_MODE,
+		EMC_PMACRO_CMD_RX_TERM_MODE,
+		EMC_PMACRO_CMD_PAD_TX_CTRL,
+		EMC_PMACRO_DATA_PAD_TX_CTRL,
+		EMC_PMACRO_COMMON_PAD_TX_CTRL,
+		EMC_PMACRO_VTTGEN_CTRL_0,
+		EMC_PMACRO_VTTGEN_CTRL_1,
+		EMC_PMACRO_VTTGEN_CTRL_2,
+		EMC_PMACRO_BRICK_CTRL_RFU1,
+		EMC_PMACRO_CMD_BRICK_CTRL_FDPD,
+		EMC_PMACRO_BRICK_CTRL_RFU2,
+		EMC_PMACRO_DATA_BRICK_CTRL_FDPD,
+		EMC_PMACRO_BG_BIAS_CTRL_0,
+		EMC_CFG_3,
+		EMC_PMACRO_TX_PWRD_0,
+		EMC_PMACRO_TX_PWRD_1,
+		EMC_PMACRO_TX_PWRD_2,
+		EMC_PMACRO_TX_PWRD_3,
+		EMC_PMACRO_TX_PWRD_4,
+		EMC_PMACRO_TX_PWRD_5,
+		EMC_CONFIG_SAMPLE_DELAY,
+		EMC_PMACRO_TX_SEL_CLK_SRC_0,
+		EMC_PMACRO_TX_SEL_CLK_SRC_1,
+		EMC_PMACRO_TX_SEL_CLK_SRC_2,
+		EMC_PMACRO_TX_SEL_CLK_SRC_3,
+		EMC_PMACRO_TX_SEL_CLK_SRC_4,
+		EMC_PMACRO_TX_SEL_CLK_SRC_5,
+		EMC_PMACRO_DDLL_BYPASS,
+		EMC_PMACRO_DDLL_PWRD_0,
+		EMC_PMACRO_DDLL_PWRD_1,
+		EMC_PMACRO_DDLL_PWRD_2,
+		EMC_PMACRO_CMD_CTRL_0,
+		EMC_PMACRO_CMD_CTRL_1,
+		EMC_PMACRO_CMD_CTRL_2,
+		EMC_TR_TIMING_0,
+		EMC_TR_DVFS,
+		EMC_TR_CTRL_1,
+		EMC_TR_RDV,
+		EMC_TR_QPOP,
+		EMC_TR_RDV_MASK,
+		EMC_MRW14,
+		EMC_TR_QSAFE,
+		EMC_TR_QRST,
+		EMC_TRAINING_CTRL,
+		EMC_TRAINING_SETTLE,
+		EMC_TRAINING_VREF_SETTLE,
+		EMC_TRAINING_CA_FINE_CTRL,
+		EMC_TRAINING_CA_CTRL_MISC,
+		EMC_TRAINING_CA_CTRL_MISC1,
+		EMC_TRAINING_CA_VREF_CTRL,
+		EMC_TRAINING_QUSE_CORS_CTRL,
+		EMC_TRAINING_QUSE_FINE_CTRL,
+		EMC_TRAINING_QUSE_CTRL_MISC,
+		EMC_TRAINING_QUSE_VREF_CTRL,
+		EMC_TRAINING_READ_FINE_CTRL,
+		EMC_TRAINING_READ_CTRL_MISC,
+		EMC_TRAINING_READ_VREF_CTRL,
+		EMC_TRAINING_WRITE_FINE_CTRL,
+		EMC_TRAINING_WRITE_CTRL_MISC,
+		EMC_TRAINING_WRITE_VREF_CTRL,
+		EMC_TRAINING_MPC,
+		EMC_MRW15,
+	},
+	.trim = {
+		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_0,
+		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_1,
+		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_2,
+		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_3,
+		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_0,
+		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_1,
+		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_2,
+		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_3,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_2,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_0,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_1,
+		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_2,
+		EMC_PMACRO_IB_VREF_DQS_0,
+		EMC_PMACRO_IB_VREF_DQS_1,
+		EMC_PMACRO_IB_VREF_DQ_0,
+		EMC_PMACRO_IB_VREF_DQ_1,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2,
+		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_2,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_0,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_1,
+		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_2,
+		EMC_PMACRO_QUSE_DDLL_RANK0_0,
+		EMC_PMACRO_QUSE_DDLL_RANK0_1,
+		EMC_PMACRO_QUSE_DDLL_RANK0_2,
+		EMC_PMACRO_QUSE_DDLL_RANK0_3,
+		EMC_PMACRO_QUSE_DDLL_RANK1_0,
+		EMC_PMACRO_QUSE_DDLL_RANK1_1,
+		EMC_PMACRO_QUSE_DDLL_RANK1_2,
+		EMC_PMACRO_QUSE_DDLL_RANK1_3
+	},
+	.burst_mc = {
+		MC_EMEM_ARB_CFG,
+		MC_EMEM_ARB_OUTSTANDING_REQ,
+		MC_EMEM_ARB_REFPB_HP_CTRL,
+		MC_EMEM_ARB_REFPB_BANK_CTRL,
+		MC_EMEM_ARB_TIMING_RCD,
+		MC_EMEM_ARB_TIMING_RP,
+		MC_EMEM_ARB_TIMING_RC,
+		MC_EMEM_ARB_TIMING_RAS,
+		MC_EMEM_ARB_TIMING_FAW,
+		MC_EMEM_ARB_TIMING_RRD,
+		MC_EMEM_ARB_TIMING_RAP2PRE,
+		MC_EMEM_ARB_TIMING_WAP2PRE,
+		MC_EMEM_ARB_TIMING_R2R,
+		MC_EMEM_ARB_TIMING_W2W,
+		MC_EMEM_ARB_TIMING_R2W,
+		MC_EMEM_ARB_TIMING_CCDMW,
+		MC_EMEM_ARB_TIMING_W2R,
+		MC_EMEM_ARB_TIMING_RFCPB,
+		MC_EMEM_ARB_DA_TURNS,
+		MC_EMEM_ARB_DA_COVERS,
+		MC_EMEM_ARB_MISC0,
+		MC_EMEM_ARB_MISC1,
+		MC_EMEM_ARB_MISC2,
+		MC_EMEM_ARB_RING1_THROTTLE,
+		MC_EMEM_ARB_DHYST_CTRL,
+		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0,
+		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1,
+		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2,
+		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3,
+		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4,
+		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5,
+		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6,
+		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7,
+	},
+	.la_scale = {
+		MC_MLL_MPCORER_PTSA_RATE,
+		MC_FTOP_PTSA_RATE,
+		MC_PTSA_GRANT_DECREMENT,
+		MC_LATENCY_ALLOWANCE_XUSB_0,
+		MC_LATENCY_ALLOWANCE_XUSB_1,
+		MC_LATENCY_ALLOWANCE_TSEC_0,
+		MC_LATENCY_ALLOWANCE_SDMMCA_0,
+		MC_LATENCY_ALLOWANCE_SDMMCAA_0,
+		MC_LATENCY_ALLOWANCE_SDMMC_0,
+		MC_LATENCY_ALLOWANCE_SDMMCAB_0,
+		MC_LATENCY_ALLOWANCE_PPCS_0,
+		MC_LATENCY_ALLOWANCE_PPCS_1,
+		MC_LATENCY_ALLOWANCE_MPCORE_0,
+		MC_LATENCY_ALLOWANCE_HC_0,
+		MC_LATENCY_ALLOWANCE_HC_1,
+		MC_LATENCY_ALLOWANCE_AVPC_0,
+		MC_LATENCY_ALLOWANCE_GPU_0,
+		MC_LATENCY_ALLOWANCE_GPU2_0,
+		MC_LATENCY_ALLOWANCE_NVENC_0,
+		MC_LATENCY_ALLOWANCE_NVDEC_0,
+		MC_LATENCY_ALLOWANCE_VIC_0,
+		MC_LATENCY_ALLOWANCE_VI2_0,
+		MC_LATENCY_ALLOWANCE_ISP2_0,
+		MC_LATENCY_ALLOWANCE_ISP2_1,
+	},
+	.burst_per_channel = {
+		{ .bank = 0, .offset = EMC_MRW10, },
+		{ .bank = 1, .offset = EMC_MRW10, },
+		{ .bank = 0, .offset = EMC_MRW11, },
+		{ .bank = 1, .offset = EMC_MRW11, },
+		{ .bank = 0, .offset = EMC_MRW12, },
+		{ .bank = 1, .offset = EMC_MRW12, },
+		{ .bank = 0, .offset = EMC_MRW13, },
+		{ .bank = 1, .offset = EMC_MRW13, },
+	},
+	.trim_per_channel = {
+		{ .bank = 0, .offset = EMC_CMD_BRLSHFT_0, },
+		{ .bank = 1, .offset = EMC_CMD_BRLSHFT_1, },
+		{ .bank = 0, .offset = EMC_DATA_BRLSHFT_0, },
+		{ .bank = 1, .offset = EMC_DATA_BRLSHFT_0, },
+		{ .bank = 0, .offset = EMC_DATA_BRLSHFT_1, },
+		{ .bank = 1, .offset = EMC_DATA_BRLSHFT_1, },
+		{ .bank = 0, .offset = EMC_QUSE_BRLSHFT_0, },
+		{ .bank = 1, .offset = EMC_QUSE_BRLSHFT_1, },
+		{ .bank = 0, .offset = EMC_QUSE_BRLSHFT_2, },
+		{ .bank = 1, .offset = EMC_QUSE_BRLSHFT_3, },
+	},
+	.vref_per_channel = {
+		{
+			.bank = 0,
+			.offset = EMC_TRAINING_OPT_DQS_IB_VREF_RANK0,
+		}, {
+			.bank = 1,
+			.offset = EMC_TRAINING_OPT_DQS_IB_VREF_RANK0,
+		}, {
+			.bank = 0,
+			.offset = EMC_TRAINING_OPT_DQS_IB_VREF_RANK1,
+		}, {
+			.bank = 1,
+			.offset = EMC_TRAINING_OPT_DQS_IB_VREF_RANK1,
+		},
+	},
 };
 
-static const struct supported_sequence supported_seqs[] = {
-	{
-		0,
-		NULL,
-		NULL,
-		NULL
-	}
-};
-static const struct supported_sequence *seq = supported_seqs;
-static DEFINE_SPINLOCK(emc_access_lock);
+static void tegra210_emc_train(struct timer_list *timer)
+{
+	struct tegra210_emc *emc = from_timer(emc, timer, training);
+	unsigned long flags;
+
+	if (!emc->last)
+		return;
+
+	spin_lock_irqsave(&emc->lock, flags);
 
-static inline struct tegra_emc *clk_hw_to_emc(struct clk_hw *hw)
+	if (emc->sequence->periodic_compensation)
+		emc->sequence->periodic_compensation(emc);
+
+	spin_unlock_irqrestore(&emc->lock, flags);
+
+	mod_timer(&emc->training,
+		  jiffies + msecs_to_jiffies(emc->training_interval));
+}
+
+static void tegra210_emc_training_start(struct tegra210_emc *emc)
 {
-	return container_of(hw, struct tegra_emc, hw);
+	mod_timer(&emc->training,
+		  jiffies + msecs_to_jiffies(emc->training_interval));
 }
 
-u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
+static void tegra210_emc_training_stop(struct tegra210_emc *emc)
 {
-	return readl_relaxed(emc->emc_base[REG_EMC] + offset);
+	del_timer(&emc->training);
 }
 
-u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
-			    unsigned long offset)
+static void tegra210_emc_set_clock(struct tegra210_emc *emc, u32 clksrc)
 {
-	u32 val = 0;
+	emc->sequence->set_clock(emc, clksrc);
 
-	switch (type) {
-	case REG_EMC:
-	case REG_EMC0:
-		val = readl_relaxed(emc->emc_base[REG_EMC] + offset);
-		break;
-	case REG_EMC1:
-		val = readl_relaxed(emc->emc_base[REG_EMC1] + offset);
-		break;
-	}
+	if (emc->next->periodic_training)
+		tegra210_emc_training_start(emc);
+	else
+		tegra210_emc_training_stop(emc);
+}
 
-	return val;
+static void tegra210_change_dll_src(struct tegra210_emc *emc,
+				    u32 clksrc)
+{
+	u32 dll_setting = emc->next->dll_clk_src;
+	u32 emc_clk_src;
+	u32 emc_clk_div;
+
+	emc_clk_src = (clksrc & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
+		       EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
+	emc_clk_div = (clksrc & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
+		       EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
+
+	dll_setting &= ~(DLL_CLK_EMC_DLL_CLK_SRC_MASK |
+			 DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK);
+	dll_setting |= emc_clk_src << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT;
+	dll_setting |= emc_clk_div << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT;
+
+	dll_setting &= ~DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK;
+	if (emc_clk_src == EMC_CLK_SOURCE_PLLMB_LJ)
+		dll_setting |= (PLLM_VCOB <<
+				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
+	else if (emc_clk_src == EMC_CLK_SOURCE_PLLM_LJ)
+		dll_setting |= (PLLM_VCOA <<
+				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
+	else
+		dll_setting |= (EMC_DLL_SWITCH_OUT <<
+				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
+
+	tegra210_clk_emc_dll_update_setting(dll_setting);
+
+	if (emc->next->clk_out_enb_x_0_clk_enb_emc_dll)
+		tegra210_clk_emc_dll_enable(true);
+	else
+		tegra210_clk_emc_dll_enable(false);
 }
 
-static inline u32 emc_src_val(u32 val)
+void tegra210_emc_do_clock_change(struct tegra210_emc *emc, u32 clksrc)
 {
-	return (val & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
-		EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
+	int err;
+
+	mc_readl(emc->mc, MC_EMEM_ADR_CFG);
+	emc_readl(emc, EMC_INTSTATUS);
+
+	tegra210_clk_emc_update_setting(clksrc);
+
+	err = tegra210_emc_wait_for_update(emc, 0, EMC_INTSTATUS,
+					   EMC_INTSTATUS_CLKCHANGE_COMPLETE,
+					   true);
+	if (err)
+		dev_warn(emc->dev, "clock change completion error: %d\n", err);
 }
 
-static inline u32 emc_div_val(u32 val)
+struct tegra210_emc_timing *tegra210_emc_find_timing(struct tegra210_emc *emc,
+						     unsigned long rate)
 {
-	return (val & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
-		EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
+	unsigned int i;
+
+	for (i = 0; i < emc->num_timings; i++)
+		if (emc->timings[i].rate * 1000UL == rate)
+			return &emc->timings[i];
+
+	return NULL;
 }
 
-static void emc_train_func(struct timer_list *tmr)
+int tegra210_emc_wait_for_update(struct tegra210_emc *emc, unsigned int channel,
+				 unsigned int offset, u32 bit_mask, bool state)
 {
-	unsigned long flags;
-	struct tegra_emc *emc = from_timer(emc, tmr, training_timer);
+	unsigned int i;
+	u32 value;
 
-	if (!emc->current_timing)
-		return;
+	for (i = 0; i < EMC_STATUS_UPDATE_TIMEOUT; i++) {
+		value = emc_channel_readl(emc, channel, offset);
+		if (!!(value & bit_mask) == state)
+			return 0;
 
-	spin_lock_irqsave(&emc_access_lock, flags);
-	if (seq->periodic_compensation)
-		seq->periodic_compensation(emc);
-	spin_unlock_irqrestore(&emc_access_lock, flags);
+		udelay(1);
+	}
 
-	mod_timer(&emc->training_timer,
-		  jiffies + msecs_to_jiffies(emc->timer_period_training));
+	return -ETIMEDOUT;
 }
 
-static void emc_training_timer_start(struct tegra_emc *emc)
+void tegra210_emc_set_shadow_bypass(struct tegra210_emc *emc, int set)
 {
-	mod_timer(&emc->training_timer,
-		  jiffies + msecs_to_jiffies(emc->timer_period_training));
+	u32 emc_dbg = emc_readl(emc, EMC_DBG);
+
+	if (set)
+		emc_writel(emc, emc_dbg | EMC_DBG_WRITE_MUX_ACTIVE, EMC_DBG);
+	else
+		emc_writel(emc, emc_dbg & ~EMC_DBG_WRITE_MUX_ACTIVE, EMC_DBG);
 }
 
-static void emc_training_timer_stop(struct tegra_emc *emc)
+u32 tegra210_emc_get_dll_state(struct tegra210_emc_timing *next)
 {
-	del_timer(&emc->training_timer);
+	if (next->emc_emrs & 0x1)
+		return 0;
+
+	return 1;
 }
 
-static void emc_set_clock(struct tegra_emc *emc, u32 clksrc)
+void tegra210_emc_timing_update(struct tegra210_emc *emc,
+				unsigned int num_channels)
 {
-	seq->set_clock(emc, clksrc);
+	unsigned int i;
+	int err = 0;
 
-	if (emc->next_timing->periodic_training)
-		emc_training_timer_start(emc);
-	else
-		emc_training_timer_stop(emc);
+	emc_writel(emc, 0x1, EMC_TIMING_CONTROL);
+
+	for (i = 0; i < num_channels; i++) {
+		err |= tegra210_emc_wait_for_update(emc, i, EMC_EMC_STATUS,
+						    EMC_EMC_STATUS_TIMING_UPDATE_STALLED,
+						    false);
+	}
+
+	if (err)
+		dev_warn(emc->dev, "timing update error: %d\n", err);
 }
 
-static inline unsigned long emc_get_src_clk_rate(void)
+unsigned long tegra210_emc_actual_osc_clocks(u32 in)
 {
-	int div;
-	u32 val;
-	unsigned long rate;
+	if (in < 0x40)
+		return in * 16;
+	else if (in < 0x80)
+		return 2048;
+	else if (in < 0xc0)
+		return 4096;
+	else
+		return 8192;
+}
 
-	val = tegra210_clk_emc_get_setting();
-	rate = clk_get_rate(emc_src[emc_src_val(val)]);
-	div = emc_div_val(val);
-	div += 2;
-	rate *= 2;
-	rate += div - 1;
-	do_div(rate, div);
+void tegra210_emc_start_periodic_compensation(struct tegra210_emc *emc)
+{
+	u32 mpc_req = 0x4b;
 
-	return rate;
+	emc_writel(emc, mpc_req, EMC_MPC);
+	mpc_req = emc_readl(emc, EMC_MPC);
 }
 
-static int emc_table_lookup(struct tegra_emc *emc, unsigned long rate)
+u32 tegra210_emc_compensate(struct tegra210_emc_timing *next, u32 offset)
 {
-	int i;
+	u32 temp = 0, rate = next->rate / 1000;
+	s32 delta[4], delta_taps[4];
+	s32 new[] = {
+		TRIM_REG(0, 0, 0, 0),
+		TRIM_REG(0, 0, 0, 1),
+		TRIM_REG(0, 0, 1, 2),
+		TRIM_REG(0, 0, 1, 3),
+
+		TRIM_REG(1, 0, 2, 4),
+		TRIM_REG(1, 0, 2, 5),
+		TRIM_REG(1, 0, 3, 6),
+		TRIM_REG(1, 0, 3, 7),
+
+		TRIM_REG(0, 1, 0, 0),
+		TRIM_REG(0, 1, 0, 1),
+		TRIM_REG(0, 1, 1, 2),
+		TRIM_REG(0, 1, 1, 3),
+
+		TRIM_REG(1, 1, 2, 4),
+		TRIM_REG(1, 1, 2, 5),
+		TRIM_REG(1, 1, 3, 6),
+		TRIM_REG(1, 1, 3, 7)
+	};
+	unsigned i;
+
+	switch (offset) {
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3:
+	case EMC_DATA_BRLSHFT_0:
+		delta[0] = 128 * (next->current_dram_clktree[C0D0U0] -
+				  next->trained_dram_clktree[C0D0U0]);
+		delta[1] = 128 * (next->current_dram_clktree[C0D0U1] -
+				  next->trained_dram_clktree[C0D0U1]);
+		delta[2] = 128 * (next->current_dram_clktree[C1D0U0] -
+				  next->trained_dram_clktree[C1D0U0]);
+		delta[3] = 128 * (next->current_dram_clktree[C1D0U1] -
+				  next->trained_dram_clktree[C1D0U1]);
+
+		delta_taps[0] = (delta[0] * (s32)rate) / 1000000;
+		delta_taps[1] = (delta[1] * (s32)rate) / 1000000;
+		delta_taps[2] = (delta[2] * (s32)rate) / 1000000;
+		delta_taps[3] = (delta[3] * (s32)rate) / 1000000;
+
+		for (i = 0; i < 4; i++) {
+			if ((delta_taps[i] > next->tree_margin) ||
+			    (delta_taps[i] < (-1 * next->tree_margin))) {
+				new[i * 2] = new[i * 2] + delta_taps[i];
+				new[i * 2 + 1] = new[i * 2 + 1] +
+							delta_taps[i];
+			}
+		}
 
-	for (i = 0; i < emc->emc_table_size; i++) {
-		if (emc_clk_sel[i].input == NULL)
-			continue;
+		if (offset == EMC_DATA_BRLSHFT_0) {
+			for (i = 0; i < 8; i++)
+				new[i] = new[i] / 64;
+		} else {
+			for (i = 0; i < 8; i++)
+				new[i] = new[i] % 64;
+		}
 
-		if (emc->emc_table[i].rate == rate)
-			return i;
+		break;
+
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3:
+	case EMC_DATA_BRLSHFT_1:
+		delta[0] = 128 * (next->current_dram_clktree[C0D1U0] -
+				  next->trained_dram_clktree[C0D1U0]);
+		delta[1] = 128 * (next->current_dram_clktree[C0D1U1] -
+				  next->trained_dram_clktree[C0D1U1]);
+		delta[2] = 128 * (next->current_dram_clktree[C1D1U0] -
+				  next->trained_dram_clktree[C1D1U0]);
+		delta[3] = 128 * (next->current_dram_clktree[C1D1U1] -
+				  next->trained_dram_clktree[C1D1U1]);
+
+		delta_taps[0] = (delta[0] * (s32)rate) / 1000000;
+		delta_taps[1] = (delta[1] * (s32)rate) / 1000000;
+		delta_taps[2] = (delta[2] * (s32)rate) / 1000000;
+		delta_taps[3] = (delta[3] * (s32)rate) / 1000000;
+
+		for (i = 0; i < 4; i++) {
+			if ((delta_taps[i] > next->tree_margin) ||
+			    (delta_taps[i] < (-1 * next->tree_margin))) {
+				new[8 + i * 2] = new[8 + i * 2] +
+							delta_taps[i];
+				new[8 + i * 2 + 1] = new[8 + i * 2 + 1] +
+							delta_taps[i];
+			}
+		}
+
+		if (offset == EMC_DATA_BRLSHFT_1) {
+			for (i = 0; i < 8; i++)
+				new[i + 8] = new[i + 8] / 64;
+		} else {
+			for (i = 0; i < 8; i++)
+				new[i + 8] = new[i + 8] % 64;
+		}
+
+		break;
 	}
 
-	return -EINVAL;
-}
+	switch (offset) {
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0:
+		temp = CALC_TEMP(0, 0, 0, 1, 0);
+		break;
 
-static struct clk *emc_predict_parent(struct tegra_emc *emc,
-				      unsigned long rate)
-{
-	struct clk *old_parent, *new_parent;
-	unsigned long parent_rate;
-	int idx;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1:
+		temp = CALC_TEMP(0, 1, 2, 3, 2);
+		break;
+
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2:
+		temp = CALC_TEMP(0, 2, 4, 5, 4);
+		break;
+
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3:
+		temp = CALC_TEMP(0, 3, 6, 7, 6);
+		break;
 
-	idx = emc_table_lookup(emc, rate / 1000);
-	if (idx < 0)
-		return ERR_PTR(-EINVAL);
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0:
+		temp = CALC_TEMP(1, 0, 0, 1, 8);
+		break;
 
-	parent_rate = emc_clk_sel[idx].input_rate * 1000;
-	new_parent = emc_clk_sel[idx].input;
-	old_parent = clk_get_parent(emc->emc_clk);
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1:
+		temp = CALC_TEMP(1, 1, 2, 3, 10);
+		break;
 
-	if (parent_rate == clk_get_rate(old_parent))
-		return old_parent;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2:
+		temp = CALC_TEMP(1, 2, 4, 5, 12);
+		break;
 
-	if (clk_is_match(new_parent, old_parent))
-		new_parent = emc_clk_sel[idx].input_b;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3:
+		temp = CALC_TEMP(1, 3, 6, 7, 14);
+		break;
 
-	if (parent_rate != clk_get_rate(new_parent))
-		clk_set_rate(new_parent, parent_rate);
+	case EMC_DATA_BRLSHFT_0:
+		temp = ((new[0] <<
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE0_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE0_DATA_BRLSHFT_MASK) |
+		       ((new[1] <<
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE1_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE1_DATA_BRLSHFT_MASK) |
+		       ((new[2] <<
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE2_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE2_DATA_BRLSHFT_MASK) |
+		       ((new[3] <<
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE3_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE3_DATA_BRLSHFT_MASK) |
+		       ((new[4] <<
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE4_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE4_DATA_BRLSHFT_MASK) |
+		       ((new[5] <<
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE5_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE5_DATA_BRLSHFT_MASK) |
+		       ((new[6] <<
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE6_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE6_DATA_BRLSHFT_MASK) |
+		       ((new[7] <<
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE7_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_0_RANK0_BYTE7_DATA_BRLSHFT_MASK);
+		break;
+
+	case EMC_DATA_BRLSHFT_1:
+		temp = ((new[8] <<
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE0_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE0_DATA_BRLSHFT_MASK) |
+		       ((new[9] <<
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE1_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE1_DATA_BRLSHFT_MASK) |
+		       ((new[10] <<
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE2_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE2_DATA_BRLSHFT_MASK) |
+		       ((new[11] <<
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE3_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE3_DATA_BRLSHFT_MASK) |
+		       ((new[12] <<
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE4_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE4_DATA_BRLSHFT_MASK) |
+		       ((new[13] <<
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE5_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE5_DATA_BRLSHFT_MASK) |
+		       ((new[14] <<
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE6_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE6_DATA_BRLSHFT_MASK) |
+		       ((new[15] <<
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE7_DATA_BRLSHFT_SHIFT) &
+			 EMC_DATA_BRLSHFT_1_RANK1_BYTE7_DATA_BRLSHFT_MASK);
+		break;
+
+	default:
+		break;
+	}
 
-	return new_parent;
+	return temp;
 }
 
-static int emc_set_rate(struct tegra_emc *emc, unsigned long rate)
+u32 tegra210_emc_dll_prelock(struct tegra210_emc *emc, u32 clksrc)
 {
-	int i;
-	unsigned long flags;
-	s64 last_change_delay;
-	struct clk *parent;
+	unsigned int num_channels = 1, i;
+	u32 value;
 
-	if (emc->emc_suspend)
-		rate = TEGRA210_EMC_SUSPEND_RATE;
+	value = emc_readl(emc, EMC_FBIO_CFG7);
+
+	if ((value & EMC_FBIO_CFG7_CH1_ENABLE) &&
+	    (value & EMC_FBIO_CFG7_CH0_ENABLE))
+		num_channels = 2;
+
+	value = emc_readl(emc, EMC_CFG_DIG_DLL);
+	value &= ~EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_MASK;
+	value |= (3 << EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_SHIFT);
+	value &= ~EMC_CFG_DIG_DLL_CFG_DLL_EN;
+	value &= ~EMC_CFG_DIG_DLL_CFG_DLL_MODE_MASK;
+	value |= (3 << EMC_CFG_DIG_DLL_CFG_DLL_MODE_SHIFT);
+	value |= EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_TRAFFIC;
+	value &= ~EMC_CFG_DIG_DLL_CFG_DLL_STALL_RW_UNTIL_LOCK;
+	value &= ~EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_UNTIL_LOCK;
+	emc_writel(emc, value, EMC_CFG_DIG_DLL);
+	emc_writel(emc, 1, EMC_TIMING_CONTROL);
+
+	for (i = 0; i < num_channels; i++)
+		tegra210_emc_wait_for_update(emc, i, EMC_EMC_STATUS,
+					     EMC_EMC_STATUS_TIMING_UPDATE_STALLED,
+					     0);
+
+	for (i = 0; i < num_channels; i++) {
+		while (true) {
+			value = emc_channel_readl(emc, i, EMC_CFG_DIG_DLL);
+			if ((value & EMC_CFG_DIG_DLL_CFG_DLL_EN) == 0)
+				break;
+		}
+	}
 
-	if (rate == emc->current_timing->rate)
-		return 0;
+	value = emc->next->burst_regs[EMC_DLL_CFG_0_INDEX];
+	emc_writel(emc, value, EMC_DLL_CFG_0);
 
-	i = emc_table_lookup(emc, rate / 1000);
+	value = emc_readl(emc, EMC_DLL_CFG_1);
+	value &= EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_MASK;
 
-	if (i < 0)
-		return i;
+	if (emc->next->rate >= 400000 && emc->next->rate < 600000)
+		value |= 150;
+	else if (emc->next->rate >= 600000 && emc->next->rate < 800000)
+		value |= 100;
+	else if (emc->next->rate >= 800000 && emc->next->rate < 1000000)
+		value |= 70;
+	else if (emc->next->rate >= 1000000 && emc->next->rate < 1200000)
+		value |= 30;
+	else
+		value |= 20;
 
-	if (rate > 204000000 && !emc->emc_table[i].trained)
-		return -EINVAL;
+	emc_writel(emc, value, EMC_DLL_CFG_1);
 
-	parent = emc_predict_parent(emc, rate);
-	if (clk_is_match(parent, emc_clk_sel[i].input))
-		emc->clk_setting = emc_clk_sel[i].value;
-	else
-		emc->clk_setting = emc_clk_sel[i].value_b;
+	tegra210_change_dll_src(emc, clksrc);
 
-	emc->next_timing = &emc->emc_table[i];
-	last_change_delay = ktime_us_delta(ktime_get(), emc->clkchange_time);
-	if ((last_change_delay >= 0) &&
-	    (last_change_delay < emc->clkchange_delay))
-		udelay(emc->clkchange_delay - (int)last_change_delay);
+	value = emc_readl(emc, EMC_CFG_DIG_DLL);
+	value |= EMC_CFG_DIG_DLL_CFG_DLL_EN;
+	emc_writel(emc, value, EMC_CFG_DIG_DLL);
 
-	spin_lock_irqsave(&emc_access_lock, flags);
-	emc_set_clock(emc, emc->clk_setting);
-	emc->clkchange_time = ktime_get();
-	emc->current_timing = &emc->emc_table[i];
-	spin_unlock_irqrestore(&emc_access_lock, flags);
+	tegra210_emc_timing_update(emc, num_channels);
 
-	return 0;
+	for (i = 0; i < num_channels; i++) {
+		while (true) {
+			value = emc_channel_readl(emc, 0, EMC_CFG_DIG_DLL);
+			if (value & EMC_CFG_DIG_DLL_CFG_DLL_EN)
+				break;
+		}
+	}
+
+	while (true) {
+		value = emc_readl(emc, EMC_DIG_DLL_STATUS);
+
+		if ((value & EMC_DIG_DLL_STATUS_DLL_PRIV_UPDATED) == 0)
+			continue;
+
+		if ((value & EMC_DIG_DLL_STATUS_DLL_LOCK) == 0)
+			continue;
+
+		break;
+	}
+
+	value = emc_readl(emc, EMC_DIG_DLL_STATUS);
+
+	return value & EMC_DIG_DLL_STATUS_DLL_OUT_MASK;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int debug_emc_get_rate(void *data, u64 *val)
+u32 tegra210_emc_dvfs_power_ramp_up(struct tegra210_emc *emc, u32 clk,
+				    bool flip_backward)
 {
-	struct clk *c = data;
+	u32 cmd_pad, dq_pad, rfu1, cfg5, common_tx, ramp_up_wait = 0;
+	const struct tegra210_emc_timing *timing;
 
-	*val = clk_get_rate(c);
+	if (flip_backward)
+		timing = emc->last;
+	else
+		timing = emc->next;
+
+	cmd_pad = timing->burst_regs[EMC_PMACRO_CMD_PAD_TX_CTRL_INDEX];
+	dq_pad = timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
+	rfu1 = timing->burst_regs[EMC_PMACRO_BRICK_CTRL_RFU1_INDEX];
+	cfg5 = timing->burst_regs[EMC_FBIO_CFG5_INDEX];
+	common_tx = timing->burst_regs[EMC_PMACRO_COMMON_PAD_TX_CTRL_INDEX];
+
+	cmd_pad |= EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON;
+
+	if (clk < 1000000 / DVFS_FGCG_MID_SPEED_THRESHOLD) {
+		ccfifo_writel(emc, common_tx & 0xa,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, 0);
+		ccfifo_writel(emc, common_tx & 0xf,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL,
+			      (100000 / clk) + 1);
+		ramp_up_wait += 100000;
+	} else {
+		ccfifo_writel(emc, common_tx | 0x8,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, 0);
+	}
 
-	return 0;
+	if (clk < 1000000 / DVFS_FGCG_HIGH_SPEED_THRESHOLD) {
+		if (clk < 1000000 / IOBRICK_DCC_THRESHOLD) {
+			cmd_pad |=
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC;
+			cmd_pad &=
+				~(EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC);
+			ccfifo_writel(emc, cmd_pad,
+				      EMC_PMACRO_CMD_PAD_TX_CTRL,
+				      (100000 / clk) + 1);
+			ramp_up_wait += 100000;
+
+			dq_pad |=
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC;
+			dq_pad &=
+			       ~(EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+				 EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC);
+			ccfifo_writel(emc, dq_pad,
+				      EMC_PMACRO_DATA_PAD_TX_CTRL, 0);
+			ccfifo_writel(emc, rfu1 & 0xfe40fe40,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		} else {
+			ccfifo_writel(emc, rfu1 & 0xfe40fe40,
+				      EMC_PMACRO_BRICK_CTRL_RFU1,
+				      (100000 / clk) + 1);
+			ramp_up_wait += 100000;
+		}
+
+		ccfifo_writel(emc, rfu1 & 0xfeedfeed,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, (100000 / clk) + 1);
+		ramp_up_wait += 100000;
+
+		if (clk < 1000000 / IOBRICK_DCC_THRESHOLD) {
+			cmd_pad |=
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC;
+			ccfifo_writel(emc, cmd_pad,
+				      EMC_PMACRO_CMD_PAD_TX_CTRL,
+				      (100000 / clk) + 1);
+			ramp_up_wait += 100000;
+
+			dq_pad |=
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC;
+			ccfifo_writel(emc, dq_pad,
+				      EMC_PMACRO_DATA_PAD_TX_CTRL, 0);
+			ccfifo_writel(emc, rfu1,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		} else {
+			ccfifo_writel(emc, rfu1,
+				      EMC_PMACRO_BRICK_CTRL_RFU1,
+				      (100000 / clk) + 1);
+			ramp_up_wait += 100000;
+		}
+
+		ccfifo_writel(emc, cfg5 & ~EMC_FBIO_CFG5_CMD_TX_DIS,
+			      EMC_FBIO_CFG5, (100000 / clk) + 10);
+		ramp_up_wait += 100000 + (10 * clk);
+	} else if (clk < 1000000 / DVFS_FGCG_MID_SPEED_THRESHOLD) {
+		ccfifo_writel(emc, rfu1 | 0x06000600,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, (100000 / clk) + 1);
+		ccfifo_writel(emc, cfg5 & ~EMC_FBIO_CFG5_CMD_TX_DIS,
+			      EMC_FBIO_CFG5, (100000 / clk) + 10);
+		ramp_up_wait += 100000 + 10 * clk;
+	} else {
+		ccfifo_writel(emc, rfu1 | 0x00000600,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		ccfifo_writel(emc, cfg5 & ~EMC_FBIO_CFG5_CMD_TX_DIS,
+			      EMC_FBIO_CFG5, 12);
+		ramp_up_wait += 12 * clk;
+	}
+
+	cmd_pad &= ~EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON;
+	ccfifo_writel(emc, cmd_pad, EMC_PMACRO_CMD_PAD_TX_CTRL, 5);
+
+	return ramp_up_wait;
 }
 
-static int debug_emc_set_rate(void *data, u64 val)
+u32 tegra210_emc_dvfs_power_ramp_down(struct tegra210_emc *emc, u32 clk,
+				      bool flip_backward)
 {
-	struct clk *c = data;
+	u32 ramp_down_wait = 0, cmd_pad, dq_pad, rfu1, cfg5, common_tx;
+	const struct tegra210_emc_timing *entry;
+	u32 seq_wait;
 
-	return clk_set_rate(c, val);
+	if (flip_backward)
+		entry = emc->next;
+	else
+		entry = emc->last;
+
+	cmd_pad = entry->burst_regs[EMC_PMACRO_CMD_PAD_TX_CTRL_INDEX];
+	dq_pad = entry->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
+	rfu1 = entry->burst_regs[EMC_PMACRO_BRICK_CTRL_RFU1_INDEX];
+	cfg5 = entry->burst_regs[EMC_FBIO_CFG5_INDEX];
+	common_tx = entry->burst_regs[EMC_PMACRO_COMMON_PAD_TX_CTRL_INDEX];
+
+	cmd_pad |= EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON;
+
+	ccfifo_writel(emc, cmd_pad, EMC_PMACRO_CMD_PAD_TX_CTRL, 0);
+	ccfifo_writel(emc, cfg5 | EMC_FBIO_CFG5_CMD_TX_DIS,
+		      EMC_FBIO_CFG5, 12);
+	ramp_down_wait = 12 * clk;
+
+	seq_wait = (100000 / clk) + 1;
+
+	if (clk < (1000000 / DVFS_FGCG_HIGH_SPEED_THRESHOLD)) {
+		if (clk < (1000000 / IOBRICK_DCC_THRESHOLD)) {
+			cmd_pad &=
+				~(EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC);
+			cmd_pad |=
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC;
+			ccfifo_writel(emc, cmd_pad,
+				      EMC_PMACRO_CMD_PAD_TX_CTRL, seq_wait);
+			ramp_down_wait += 100000;
+
+			dq_pad &=
+			      ~(EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC);
+			dq_pad |=
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC;
+			ccfifo_writel(emc, dq_pad,
+				      EMC_PMACRO_DATA_PAD_TX_CTRL, 0);
+			ccfifo_writel(emc, rfu1 & ~0x01120112,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		} else {
+			ccfifo_writel(emc, rfu1 & ~0x01120112,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, seq_wait);
+			ramp_down_wait += 100000;
+		}
+
+		ccfifo_writel(emc, rfu1 & ~0x01bf01bf,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, seq_wait);
+		ramp_down_wait += 100000;
+
+		if (clk < (1000000 / IOBRICK_DCC_THRESHOLD)) {
+			cmd_pad &=
+				~(EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC);
+			ccfifo_writel(emc, cmd_pad,
+				      EMC_PMACRO_CMD_PAD_TX_CTRL, seq_wait);
+			ramp_down_wait += 100000;
+
+			dq_pad &=
+			      ~(EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC);
+			ccfifo_writel(emc, dq_pad,
+				      EMC_PMACRO_DATA_PAD_TX_CTRL, 0);
+			ccfifo_writel(emc, rfu1 & ~0x07ff07ff,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		} else {
+			ccfifo_writel(emc, rfu1 & ~0x07ff07ff,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, seq_wait);
+			ramp_down_wait += 100000;
+		}
+	} else {
+		ccfifo_writel(emc, rfu1 & ~0xffff07ff,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, seq_wait + 19);
+		ramp_down_wait += 100000 + (20 * clk);
+	}
+
+	if (clk < (1000000 / DVFS_FGCG_MID_SPEED_THRESHOLD)) {
+		ramp_down_wait += 100000;
+		ccfifo_writel(emc, common_tx & ~0x5,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, seq_wait);
+		ramp_down_wait += 100000;
+		ccfifo_writel(emc, common_tx & ~0xf,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, seq_wait);
+		ramp_down_wait += 100000;
+		ccfifo_writel(emc, 0, 0, seq_wait);
+		ramp_down_wait += 100000;
+	} else {
+		ccfifo_writel(emc, common_tx & ~0xf,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, seq_wait);
+	}
+
+	return ramp_down_wait;
 }
-DEFINE_SIMPLE_ATTRIBUTE(emc_rate_fops, debug_emc_get_rate,
-			debug_emc_set_rate, "%llu\n");
 
-static int tegra_emc_debug_init(struct tegra_emc *emc)
+void tegra210_emc_reset_dram_clktree_values(struct tegra210_emc_timing *timing)
 {
-	struct dentry *emc_debugfs_root;
+	timing->current_dram_clktree[C0D0U0] =
+		timing->trained_dram_clktree[C0D0U0];
+	timing->current_dram_clktree[C0D0U1] =
+		timing->trained_dram_clktree[C0D0U1];
+	timing->current_dram_clktree[C1D0U0] =
+		timing->trained_dram_clktree[C1D0U0];
+	timing->current_dram_clktree[C1D0U1] =
+		timing->trained_dram_clktree[C1D0U1];
+	timing->current_dram_clktree[C1D1U0] =
+		timing->trained_dram_clktree[C1D1U0];
+	timing->current_dram_clktree[C1D1U1] =
+		timing->trained_dram_clktree[C1D1U1];
+}
 
-	emc_debugfs_root = debugfs_create_dir("tegra_emc", NULL);
-	if (!emc_debugfs_root)
-		return -ENOMEM;
+static void update_dll_control(struct tegra210_emc *emc, u32 value,
+			       unsigned int num_channels, bool state)
+{
+	unsigned int i;
 
-	if (!debugfs_create_file("rate", 0644, emc_debugfs_root, emc->emc_clk,
-				 &emc_rate_fops))
-		goto err_out;
+	emc_writel(emc, value, EMC_CFG_DIG_DLL);
+	tegra210_emc_timing_update(emc, num_channels);
 
-	return 0;
+	for (i = 0; i < num_channels; i++)
+		tegra210_emc_wait_for_update(emc, i, EMC_CFG_DIG_DLL,
+					     EMC_CFG_DIG_DLL_CFG_DLL_EN,
+					     state);
+}
+
+void tegra210_emc_dll_disable(struct tegra210_emc *emc,
+			      unsigned int num_channels)
+{
+	u32 value;
+
+	value = emc_readl(emc, EMC_CFG_DIG_DLL);
+	value &= ~EMC_CFG_DIG_DLL_CFG_DLL_EN;
 
-err_out:
-	debugfs_remove_recursive(emc_debugfs_root);
-	return -ENOMEM;
+	update_dll_control(emc, value, num_channels, false);
 }
-#endif /* CONFIG_DEBUG_FS */
 
-static u8 clk_emc_get_parent(struct clk_hw *hw)
+void tegra210_emc_dll_enable(struct tegra210_emc *emc,
+			     unsigned int num_channels)
 {
-	struct tegra_emc *emc = clk_hw_to_emc(hw);
+	u32 value;
 
-	if (!emc->clk_setting)
-		emc->clk_setting = tegra210_clk_emc_get_setting();
+	value = emc_readl(emc, EMC_CFG_DIG_DLL);
+	value |= EMC_CFG_DIG_DLL_CFG_DLL_EN;
 
-	return emc_src_val(emc->clk_setting);
+	update_dll_control(emc, value, num_channels, true);
 }
 
-static unsigned long clk_emc_recalc_rate(struct clk_hw *hw,
-					 unsigned long parent_rate)
+void tegra210_emc_set_over_temp_timing(struct tegra210_emc *emc,
+				       struct tegra210_emc_timing *timing)
 {
-	struct tegra_emc *emc = clk_hw_to_emc(hw);
+#define REFRESH_X2      1
+#define REFRESH_X4      2
+#define REFRESH_SPEEDUP(val, speedup)					\
+		(val = ((val) & 0xFFFF0000) | (((val) & 0xFFFF) >> (speedup)))
+
+	u32 ref = timing->burst_regs[EMC_REFRESH_INDEX];
+	u32 pre_ref = timing->burst_regs[EMC_PRE_REFRESH_REQ_CNT_INDEX];
+	u32 dsr_cntrl = timing->burst_regs[EMC_DYN_SELF_REF_CONTROL_INDEX];
+
+	switch (emc->state) {
+	case TEGRA_DRAM_OVER_TEMP_NONE:
+	case TEGRA_DRAM_OVER_TEMP_THROTTLE:
+		break;
 
-	if (!emc->emc_table_size || !seq) {
-		u32 emc_setting = tegra210_clk_emc_get_setting();
+	case TEGRA_DRAM_OVER_TEMP_REFRESH_X2:
+		REFRESH_SPEEDUP(ref, REFRESH_X2);
+		REFRESH_SPEEDUP(pre_ref, REFRESH_X2);
+		REFRESH_SPEEDUP(dsr_cntrl, REFRESH_X2);
+		break;
+
+	case TEGRA_DRAM_OVER_TEMP_REFRESH_X4:
+		REFRESH_SPEEDUP(ref, REFRESH_X4);
+		REFRESH_SPEEDUP(pre_ref, REFRESH_X4);
+		REFRESH_SPEEDUP(dsr_cntrl, REFRESH_X4);
+		break;
 
-		return clk_get_rate(emc_src[emc_src_val(emc_setting)]);
+	default:
+		dev_warn(emc->dev, "failed to set over temperature state: %d\n",
+			 emc->state);
+		return;
 	}
 
-	return emc->current_timing->rate * 1000;
+	emc_writel(emc, ref, emc->offsets->burst[EMC_REFRESH_INDEX]);
+	emc_writel(emc, pre_ref,
+		   emc->offsets->burst[EMC_PRE_REFRESH_REQ_CNT_INDEX]);
+	emc_writel(emc, dsr_cntrl,
+		   emc->offsets->burst[EMC_DYN_SELF_REF_CONTROL_INDEX]);
 }
 
-static long clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int tegra210_emc_set_rate(struct device *dev,
+				 const struct tegra210_clk_emc_config *config)
 {
-	struct tegra_emc *emc = clk_hw_to_emc(hw);
-	int i;
+	struct tegra210_emc *emc = dev_get_drvdata(dev);
+	struct tegra210_emc_timing *timing = NULL;
+	unsigned long rate = config->rate;
+	s64 last_change_delay;
+	unsigned long flags;
+	unsigned int i;
+
+	if (rate == emc->last->rate * 1000UL)
+		return 0;
 
-	if (!emc->emc_table_size || !seq) {
-		u32 emc_setting = tegra210_clk_emc_get_setting();
-		return clk_get_rate(emc_src[emc_src_val(emc_setting)]);
+	for (i = 0; i < emc->num_timings; i++) {
+		if (emc->timings[i].rate * 1000UL == rate) {
+			timing = &emc->timings[i];
+			break;
+		}
 	}
 
-	if (emc->emc_suspend)
-		return TEGRA210_EMC_SUSPEND_RATE;
+	if (!timing)
+		return -EINVAL;
 
-	rate /= 1000;
+	if (rate > 204000000 && !timing->trained)
+		return -EINVAL;
 
-	for (i = 0; i < emc->emc_table_size; i++) {
-		if (emc->emc_table[i].rate >= rate)
-			return emc->emc_table[i].rate * 1000;
-	}
+	emc->next = timing;
+	last_change_delay = ktime_us_delta(ktime_get(), emc->clkchange_time);
+
+	/* XXX use non-busy-looping sleep? */
+	if ((last_change_delay >= 0) &&
+	    (last_change_delay < emc->clkchange_delay))
+		udelay(emc->clkchange_delay - (int)last_change_delay);
 
-	return emc->emc_table[i - 1].rate * 1000;
+	spin_lock_irqsave(&emc->lock, flags);
+	tegra210_emc_set_clock(emc, config->value);
+	emc->clkchange_time = ktime_get();
+	emc->last = timing;
+	spin_unlock_irqrestore(&emc->lock, flags);
+
+	return 0;
 }
 
-static int clk_emc_set_rate(struct clk_hw *hw, unsigned long rate,
-			    unsigned long parent_rate)
-{
-	struct tegra_emc *emc = clk_hw_to_emc(hw);
-	struct clk *old_parent, *new_parent;
-	int ret = -EINVAL;
+/*
+ * debugfs interface
+ *
+ * The memory controller driver exposes some files in debugfs that can be used
+ * to control the EMC frequency. The top-level directory can be found here:
+ *
+ *   /sys/kernel/debug/emc
+ *
+ * It contains the following files:
+ *
+ *   - available_rates: This file contains a list of valid, space-separated
+ *     EMC frequencies.
+ *
+ *   - min_rate: Writing a value to this file sets the given frequency as the
+ *       floor of the permitted range. If this is higher than the currently
+ *       configured EMC frequency, this will cause the frequency to be
+ *       increased so that it stays within the valid range.
+ *
+ *   - max_rate: Similarily to the min_rate file, writing a value to this file
+ *       sets the given frequency as the ceiling of the permitted range. If
+ *       the value is lower than the currently configured EMC frequency, this
+ *       will cause the frequency to be decreased so that it stays within the
+ *       valid range.
+ */
 
-	if (!emc->emc_table_size || !seq)
-		return ret;
+static bool tegra210_emc_validate_rate(struct tegra210_emc *emc,
+				       unsigned long rate)
+{
+	unsigned int i;
 
-	if (emc->emc_suspend)
-		rate = TEGRA210_EMC_SUSPEND_RATE;
+	for (i = 0; i < emc->num_timings; i++)
+		if (rate == emc->timings[i].rate * 1000UL)
+			return true;
 
-	old_parent = clk_get_parent(hw->clk);
-	new_parent = emc_predict_parent(emc, rate);
-	if (IS_ERR(new_parent))
-		goto out;
+	return false;
+}
 
-	if (!clk_is_match(new_parent, old_parent))
-		clk_prepare_enable(new_parent);
+static int tegra210_emc_debug_available_rates_show(struct seq_file *s,
+						   void *data)
+{
+	struct tegra210_emc *emc = s->private;
+	const char *prefix = "";
+	unsigned int i;
 
-	ret = emc_set_rate(emc, rate);
-	if (ret) {
-		if (new_parent != old_parent)
-			clk_disable_unprepare(new_parent);
-		goto out;
+	for (i = 0; i < emc->num_timings; i++) {
+		seq_printf(s, "%s%u", prefix, emc->timings[i].rate * 1000);
+		prefix = " ";
 	}
 
-	if (!clk_is_match(new_parent, old_parent)) {
-		clk_hw_reparent(hw, __clk_get_hw(new_parent));
-		clk_disable_unprepare(old_parent);
-	}
+	seq_puts(s, "\n");
+
+	return 0;
+}
 
-out:
-	return ret;
+static int tegra210_emc_debug_available_rates_open(struct inode *inode,
+						   struct file *file)
+{
+	return single_open(file, tegra210_emc_debug_available_rates_show,
+			   inode->i_private);
 }
 
-static const struct clk_ops tegra_clk_emc_ops = {
-	.get_parent = clk_emc_get_parent,
-	.recalc_rate = clk_emc_recalc_rate,
-	.round_rate = clk_emc_round_rate,
-	.set_rate = clk_emc_set_rate,
+static const struct file_operations tegra210_emc_debug_available_rates_fops = {
+	.open = tegra210_emc_debug_available_rates_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
 };
 
-static int find_matching_input(struct emc_table *table, struct emc_sel *sel)
+static int tegra210_emc_debug_min_rate_get(void *data, u64 *rate)
 {
-	u32 div_value;
-	u32 src_value;
-	unsigned long input_rate = 0;
-	struct clk *input_clk;
+	struct tegra210_emc *emc = data;
+
+	*rate = emc->debugfs.min_rate;
+
+	return 0;
+}
 
-	div_value = emc_div_val(table->clk_src_emc);
-	src_value = emc_src_val(table->clk_src_emc);
+static int tegra210_emc_debug_min_rate_set(void *data, u64 rate)
+{
+	struct tegra210_emc *emc = data;
+	int err;
 
-	if (div_value & 0x1) {
-		pr_warn("Tegra EMC: invalid odd divider for EMC rate %u\n",
-			table->rate);
+	if (!tegra210_emc_validate_rate(emc, rate))
 		return -EINVAL;
-	}
 
-	if (!(table->clk_src_emc & EMC_CLK_MC_EMC_SAME_FREQ) !=
-	    !(MC_EMEM_ARB_MISC0_EMC_SAME_FREQ &
-	    table->burst_mc_regs[MC_EMEM_ARB_MISC0_INDEX])) {
-		pr_warn("Tegra EMC: ambiguous EMC to MC ratio for rate %u\n",
-			table->rate);
+	err = clk_set_min_rate(emc->clk, rate);
+	if (err < 0)
+		return err;
+
+	emc->debugfs.min_rate = rate;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(tegra210_emc_debug_min_rate_fops,
+			tegra210_emc_debug_min_rate_get,
+			tegra210_emc_debug_min_rate_set, "%llu\n");
+
+static int tegra210_emc_debug_max_rate_get(void *data, u64 *rate)
+{
+	struct tegra210_emc *emc = data;
+
+	*rate = emc->debugfs.max_rate;
+
+	return 0;
+}
+
+static int tegra210_emc_debug_max_rate_set(void *data, u64 rate)
+{
+	struct tegra210_emc *emc = data;
+	int err;
+
+	if (!tegra210_emc_validate_rate(emc, rate))
 		return -EINVAL;
+
+	err = clk_set_max_rate(emc->clk, rate);
+	if (err < 0)
+		return err;
+
+	emc->debugfs.max_rate = rate;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(tegra210_emc_debug_max_rate_fops,
+			tegra210_emc_debug_max_rate_get,
+			tegra210_emc_debug_max_rate_set, "%llu\n");
+
+static void tegra210_emc_debugfs_init(struct tegra210_emc *emc)
+{
+	struct device *dev = emc->dev;
+	unsigned int i;
+	int err;
+
+	emc->debugfs.min_rate = ULONG_MAX;
+	emc->debugfs.max_rate = 0;
+
+	for (i = 0; i < emc->num_timings; i++) {
+		if (emc->timings[i].rate * 1000UL < emc->debugfs.min_rate)
+			emc->debugfs.min_rate = emc->timings[i].rate * 1000UL;
+
+		if (emc->timings[i].rate * 1000UL > emc->debugfs.max_rate)
+			emc->debugfs.max_rate = emc->timings[i].rate * 1000UL;
 	}
 
-	input_clk = emc_src[src_value];
-	if (input_clk == emc_src[TEGRA_EMC_SRC_PLLM]
-		|| input_clk == emc_src[TEGRA_EMC_SRC_PLLM_UD]) {
-		input_rate = table->rate * (1 + div_value / 2);
-	} else {
-		input_rate = clk_get_rate(input_clk) / 1000;
-		if (input_rate != (table->rate * (1 + div_value / 2))) {
-			pr_warn("Tegra EMC: rate %u doesn't match input\n",
-				table->rate);
-			return -EINVAL;
-		}
+	if (!emc->num_timings) {
+		emc->debugfs.min_rate = clk_get_rate(emc->clk);
+		emc->debugfs.max_rate = emc->debugfs.min_rate;
 	}
 
-	sel->input = input_clk;
-	sel->input_rate = input_rate;
-	sel->value = table->clk_src_emc;
-	sel->input_b = input_clk;
-	sel->input_rate_b = input_rate;
-	sel->value_b = table->clk_src_emc;
-
-	if (input_clk == emc_src[TEGRA_EMC_SRC_PLLM]) {
-		sel->input_b = emc_src[TEGRA_EMC_SRC_PLLMB];
-		sel->value_b = table->clk_src_emc &
-			       ~EMC_CLK_EMC_2X_CLK_SRC_MASK;
-		sel->value_b |= TEGRA_EMC_SRC_PLLMB <<
-				EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
+	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
+				 emc->debugfs.max_rate);
+	if (err < 0) {
+		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
+			emc->debugfs.min_rate, emc->debugfs.max_rate,
+			emc->clk);
+		return;
 	}
 
-	if (input_clk == emc_src[TEGRA_EMC_SRC_PLLM_UD]) {
-		sel->input_b = emc_src[TEGRA_EMC_SRC_PLLMB_UD];
-		sel->value_b = table->clk_src_emc &
-			       ~EMC_CLK_EMC_2X_CLK_SRC_MASK;
-		sel->value_b |= TEGRA_EMC_SRC_PLLMB_UD <<
-				EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
+	emc->debugfs.root = debugfs_create_dir("emc", NULL);
+	if (!emc->debugfs.root) {
+		dev_err(dev, "failed to create debugfs directory\n");
+		return;
 	}
 
-	return 0;
+	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root, emc,
+			    &tegra210_emc_debug_available_rates_fops);
+	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+			    emc, &tegra210_emc_debug_min_rate_fops);
+	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+			    emc, &tegra210_emc_debug_max_rate_fops);
 }
 
 static int tegra210_emc_probe(struct platform_device *pdev)
 {
-	int i;
-	unsigned long table_rate;
 	unsigned long current_rate;
-	struct clk *emc_clk;
-	struct device_node *np;
 	struct platform_device *mc;
-	struct resource res;
-	struct tegra_emc *emc;
-	void *table_addr;
+	struct tegra210_emc *emc;
+	struct device_node *np;
+	unsigned int i;
+	int err;
 
-	emc_clk = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(emc_clk))
-		return PTR_ERR(emc_clk);
-	emc = clk_hw_to_emc(__clk_get_hw(emc_clk));
+	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
+	if (!emc)
+		return -ENOMEM;
+
+	emc->clk = devm_clk_get(&pdev->dev, "emc");
+	if (IS_ERR(emc->clk))
+		return PTR_ERR(emc->clk);
+
+	platform_set_drvdata(pdev, emc);
+	spin_lock_init(&emc->lock);
+	emc->dev = &pdev->dev;
 
 	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
 	if (!np) {
@@ -486,160 +1580,143 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 	if (!emc->mc)
 		return -EPROBE_DEFER;
 
-	emc->emc_base[REG_EMC] = devm_platform_ioremap_resource(pdev, 0);
-	emc->emc_base[REG_EMC0] = devm_platform_ioremap_resource(pdev, 1);
-	emc->emc_base[REG_EMC1] = devm_platform_ioremap_resource(pdev, 2);
-
-	for (i = 0; i < TEGRA_EMC_SRC_COUNT; i++) {
-		if (!IS_ERR(emc_src[i]))
-			clk_put(emc_src[i]);
-
-		emc_src[i] = devm_clk_get(&pdev->dev, emc_src_names[i]);
-		if (IS_ERR(emc_src[i])) {
-			dev_err(&pdev->dev, "Can not find EMC source clock\n");
-			return -ENODATA;
-		}
-	}
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(emc->regs))
+		return PTR_ERR(emc->regs);
 
-	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
-	if (!np) {
-		dev_err(&pdev->dev, "could not find EMC table\n");
-		return -ENODATA;
+	for (i = 0; i < 2; i++) {
+		emc->channel[i] = devm_platform_ioremap_resource(pdev, 1 + i);
+		if (IS_ERR(emc->channel[i]))
+			return PTR_ERR(emc->channel[i]);
 	}
 
-	if (!of_device_is_compatible(np, "nvidia,tegra210-emc-table") ||
-	    !of_device_is_available(np)) {
-		dev_err(&pdev->dev, "EMC table is invalid\n");
-		return -ENODATA;
-	}
+	/* probe the number of connected DRAM devices */
+	emc->num_devices = 1 + (mc_readl(emc->mc, MC_EMEM_ADR_CFG) & 0x1);
 
-	of_address_to_resource(np, 0, &res);
-	table_addr = memremap(res.start, resource_size(&res), MEMREMAP_WB);
-	of_node_put(np);
-	if (!table_addr) {
-		dev_err(&pdev->dev, "could not map EMC table\n");
-		return -ENOMEM;
+	err = of_reserved_mem_device_init(emc->dev);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to get EMC table: %d\n", err);
+		return err;
 	}
-	emc->emc_table = (struct emc_table *)table_addr;
 
-	for (i = 0; i < TEGRA_EMC_MAX_FREQS; i++)
-		if (emc->emc_table[i].rev != 0)
-			emc->emc_table_size++;
-		else
-			break;
+	for (i = 0; i < ARRAY_SIZE(tegra210_emc_sequences); i++) {
+		const struct tegra210_emc_sequence *sequence =
+				tegra210_emc_sequences[i];
 
-	/* check the supported sequence */
-	while (seq->table_rev) {
-		if (seq->table_rev == emc->emc_table[0].rev)
+		if (emc->timings[0].revision == sequence->revision) {
+			emc->sequence = sequence;
 			break;
-		seq++;
+		}
 	}
-	if (!seq->set_clock) {
-		seq = NULL;
-		dev_err(&pdev->dev, "Invalid EMC sequence for table Rev. %d\n",
-			emc->emc_table[0].rev);
-		return -ENODATA;
+
+	if (!emc->sequence) {
+		dev_err(&pdev->dev, "sequence %u not supported\n",
+			emc->timings[0].revision);
+		return -ENOTSUPP;
 	}
 
-	emc_clk_sel = devm_kcalloc(&pdev->dev,
-				   emc->emc_table_size,
-				   sizeof(struct emc_sel),
-				   GFP_KERNEL);
+	emc->offsets = &tegra210_emc_table_register_offsets;
+	emc->state = TEGRA_DRAM_OVER_TEMP_NONE;
 
 	/* calculate the rate from source clock */
-	current_rate = emc_get_src_clk_rate() / 1000;
+	current_rate = clk_get_rate(emc->clk) / 1000;
 
 	/* validate the table */
-	for (i = 0; i < emc->emc_table_size; i++) {
-		table_rate = emc->emc_table[i].rate;
-		if (!table_rate)
-			continue;
+	for (i = 0; i < emc->num_timings; i++) {
+		u32 min_volt = emc->timings[i].min_volt;
+		u32 rate = emc->timings[i].rate;
 
-		if (i && ((table_rate <= emc->emc_table[i-1].rate) ||
-		   (emc->emc_table[i].min_volt <
-		    emc->emc_table[i-1].min_volt)))
-			continue;
+		if (!rate)
+			return -EINVAL;
 
-		if (emc->emc_table[i].rev != emc->emc_table[0].rev)
-			continue;
+		if ((i > 0) && ((rate <= emc->timings[i - 1].rate) ||
+		    (min_volt < emc->timings[i - 1].min_volt)))
+			return -EINVAL;
 
-		if (find_matching_input(&emc->emc_table[i], &emc_clk_sel[i]))
+		if (emc->timings[i].revision != emc->timings[0].revision)
 			continue;
 
-		if (table_rate == current_rate)
-			emc->current_timing = &emc->emc_table[i];
+		if (rate == current_rate)
+			emc->last = &emc->timings[i];
 	}
 
-	emc->clk_setting = tegra210_clk_emc_get_setting();
-	emc->clkchange_delay = CLK_CHANGE_DELAY;
-	emc->timer_period_training = TRAINING_TIME;
-	emc->dev = &pdev->dev;
-	dev_set_drvdata(emc->dev, emc);
+	emc->provider.dev = &pdev->dev;
+	emc->provider.set_rate = tegra210_emc_set_rate;
 
-	/* EMC training timer */
-	timer_setup(&emc->training_timer, emc_train_func, 0);
+	emc->provider.configs = devm_kcalloc(&pdev->dev, emc->num_timings,
+					     sizeof(*emc->provider.configs),
+					     GFP_KERNEL);
+	if (!emc->provider.configs)
+		return -ENOMEM;
 
-#ifdef CONFIG_DEBUG_FS
-	tegra_emc_debug_init(emc);
-#endif
+	emc->provider.num_configs = emc->num_timings;
 
-	return 0;
-}
+	for (i = 0; i < emc->provider.num_configs; i++) {
+		struct tegra210_emc_timing *timing = &emc->timings[i];
+		struct tegra210_clk_emc_config *config =
+				&emc->provider.configs[i];
+		u32 value;
 
-struct clk *tegra210_clk_register_emc(void)
-{
-	struct clk_init_data init;
-	struct clk *clk;
-	struct tegra_emc *emc;
-	int i;
+		config->rate = timing->rate * 1000UL;
+		config->value = timing->clk_src_emc;
 
-	emc = kzalloc(sizeof(*emc), GFP_KERNEL);
-	if (!emc)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < TEGRA_EMC_SRC_COUNT; i++)
-		emc_src[i] = clk_get_sys(NULL, emc_src_names[i]);
-
-	init.name = "emc";
-	init.ops = &tegra_clk_emc_ops;
-	init.flags = CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE;
-	init.parent_names = emc_src_names;
-	init.num_parents = ARRAY_SIZE(emc_src_names);
-	emc->hw.init = &init;
-
-	clk = clk_register(NULL, &emc->hw);
-	if (IS_ERR(clk)) {
-		kfree(emc);
-		return clk;
+		value = timing->burst_mc_regs[MC_EMEM_ARB_MISC0_INDEX];
+
+		if ((value & MC_EMEM_ARB_MISC0_EMC_SAME_FREQ) == 0)
+			config->same_freq = false;
+		else
+			config->same_freq = true;
+	}
+
+	err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to attach to EMC clock: %d\n", err);
+		return err;
 	}
-	emc->emc_clk = clk;
 
-	return clk;
+	emc->clkchange_delay = 100;
+	emc->training_interval = 100;
+	dev_set_drvdata(emc->dev, emc);
+
+	/* EMC training timer */
+	timer_setup(&emc->training, tegra210_emc_train, 0);
+
+	tegra210_emc_debugfs_init(emc);
+
+	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra210_clk_register_emc);
 
 #ifdef CONFIG_PM_SLEEP
 static int tegra210_emc_suspend(struct device *dev)
 {
-	struct tegra_emc *emc = dev_get_drvdata(dev);
+	struct tegra210_emc *emc = dev_get_drvdata(dev);
 
-	emc->emc_suspend = true;
-	emc->emc_resume_rate = clk_get_rate(emc->emc_clk);
-	clk_set_rate(emc->emc_clk, TEGRA210_EMC_SUSPEND_RATE);
+	emc->resume_rate = clk_get_rate(emc->clk);
+	emc->suspend = true;
 
-	pr_debug("%s at rate %lu\n", __func__, clk_get_rate(emc->emc_clk));
+	clk_set_rate(emc->clk, 204000000);
+	tegra210_clk_emc_detach(emc->clk);
+
+	dev_dbg(dev, "suspending at %lu Hz\n", clk_get_rate(emc->clk));
 
 	return 0;
 }
 
 static int tegra210_emc_resume(struct device *dev)
 {
-	struct tegra_emc *emc = dev_get_drvdata(dev);
+	struct tegra210_emc *emc = dev_get_drvdata(dev);
+	int err;
+
+	err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
+	if (err < 0) {
+		dev_err(dev, "failed to attach to EMC clock: %d\n", err);
+		return err;
+	}
 
-	emc->emc_suspend = false;
-	clk_set_rate(emc->emc_clk, emc->emc_resume_rate);
+	clk_set_rate(emc->clk, emc->resume_rate);
+	emc->suspend = false;
 
-	pr_debug("%s at rate %lu\n", __func__, clk_get_rate(emc->emc_clk));
+	dev_dbg(dev, "resuming at %lu Hz\n", clk_get_rate(emc->clk));
 
 	return 0;
 }
@@ -655,7 +1732,7 @@ static const struct of_device_id tegra210_emc_of_match[] = {
 };
 
 static struct platform_driver tegra210_emc_driver = {
-	.driver	= {
+	.driver = {
 		.name = "tegra210-emc",
 		.of_match_table = tegra210_emc_of_match,
 		.pm = &tegra210_emc_pm_ops,
@@ -669,3 +1746,54 @@ static int __init tegra210_emc_init(void)
 	return platform_driver_register(&tegra210_emc_driver);
 }
 subsys_initcall(tegra210_emc_init);
+
+static int tegra210_emc_table_device_init(struct reserved_mem *rmem,
+					  struct device *dev)
+{
+	struct tegra210_emc *emc = dev_get_drvdata(dev);
+	unsigned int i;
+	void *table;
+
+	table = memremap(rmem->base, rmem->size, MEMREMAP_WB);
+	if (!table) {
+		dev_err(dev, "failed to map EMC table\n");
+		return -ENOMEM;
+	}
+
+	emc->timings = (struct tegra210_emc_timing *)table;
+	emc->num_timings = 0;
+
+	for (i = 0; i < TEGRA_EMC_MAX_FREQS; i++) {
+		if (emc->timings[i].revision == 0)
+			break;
+
+		emc->num_timings++;
+	}
+
+	return 0;
+}
+
+static void tegra210_emc_table_device_release(struct reserved_mem *rmem,
+					      struct device *dev)
+{
+	struct tegra210_emc *emc = dev_get_drvdata(dev);
+
+	memunmap(emc->timings);
+}
+
+static const struct reserved_mem_ops tegra210_emc_table_ops = {
+	.device_init = tegra210_emc_table_device_init,
+	.device_release = tegra210_emc_table_device_release,
+};
+
+static int tegra210_emc_table_init(struct reserved_mem *rmem)
+{
+	pr_debug("Tegra210 EMC table at %pa, size %lu bytes\n", &rmem->base,
+		 (unsigned long)rmem->size);
+
+	rmem->ops = &tegra210_emc_table_ops;
+
+	return 0;
+}
+RESERVEDMEM_OF_DECLARE(tegra210_emc_table, "nvidia,tegra210-emc-table",
+		       tegra210_emc_table_init);
diff --git a/drivers/memory/tegra/tegra210-emc.h b/drivers/memory/tegra/tegra210-emc.h
index 029f8afb2d66..e022c319f37f 100644
--- a/drivers/memory/tegra/tegra210-emc.h
+++ b/drivers/memory/tegra/tegra210-emc.h
@@ -1,26 +1,730 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2015-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
-#ifndef _TEGRA210_EMC_REG_H
-#define _TEGRA210_EMC_REG_H
+#ifndef TEGRA210_EMC_H
+#define TEGRA210_EMC_H
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/tegra.h>
 #include <linux/platform_device.h>
 
 #include "mc.h"
 
+#define DVFS_FGCG_HIGH_SPEED_THRESHOLD				1000
+#define IOBRICK_DCC_THRESHOLD					2400
+#define DVFS_FGCG_MID_SPEED_THRESHOLD				600
+
+#define EMC_STATUS_UPDATE_TIMEOUT				1000
+
+#define MC_EMEM_ADR_CFG						0x54
+#define MC_EMEM_ARB_CFG						0x90
+#define MC_EMEM_ARB_OUTSTANDING_REQ				0x94
+#define MC_EMEM_ARB_TIMING_RCD					0x98
+#define MC_EMEM_ARB_TIMING_RP					0x9c
+#define MC_EMEM_ARB_TIMING_RC					0xa0
+#define MC_EMEM_ARB_TIMING_RAS					0xa4
+#define MC_EMEM_ARB_TIMING_FAW					0xa8
+#define MC_EMEM_ARB_TIMING_RRD					0xac
+#define MC_EMEM_ARB_TIMING_RAP2PRE				0xb0
+#define MC_EMEM_ARB_TIMING_WAP2PRE				0xb4
+#define MC_EMEM_ARB_TIMING_R2R					0xb8
+#define MC_EMEM_ARB_TIMING_W2W					0xbc
+#define MC_EMEM_ARB_TIMING_R2W					0xc0
+#define MC_EMEM_ARB_TIMING_W2R					0xc4
+#define MC_EMEM_ARB_MISC2					0xc8
+#define MC_EMEM_ARB_DA_TURNS					0xd0
+#define MC_EMEM_ARB_DA_COVERS					0xd4
+#define MC_EMEM_ARB_MISC0					0xd8
+#define MC_EMEM_ARB_MISC1					0xdc
+#define MC_EMEM_ARB_RING1_THROTTLE				0xe0
+#define MC_LATENCY_ALLOWANCE_AVPC_0				0x2e4
+#define MC_LATENCY_ALLOWANCE_HC_0				0x310
+#define MC_LATENCY_ALLOWANCE_HC_1				0x314
+#define MC_LATENCY_ALLOWANCE_MPCORE_0				0x320
+#define MC_LATENCY_ALLOWANCE_NVENC_0				0x328
+#define MC_LATENCY_ALLOWANCE_PPCS_0				0x344
+#define MC_LATENCY_ALLOWANCE_PPCS_1				0x348
+#define MC_LATENCY_ALLOWANCE_ISP2_0				0x370
+#define MC_LATENCY_ALLOWANCE_ISP2_1				0x374
+#define MC_LATENCY_ALLOWANCE_XUSB_0				0x37c
+#define MC_LATENCY_ALLOWANCE_XUSB_1				0x380
+#define MC_LATENCY_ALLOWANCE_TSEC_0				0x390
+#define MC_LATENCY_ALLOWANCE_VIC_0				0x394
+#define MC_LATENCY_ALLOWANCE_VI2_0				0x398
+#define MC_LATENCY_ALLOWANCE_GPU_0				0x3ac
+#define MC_LATENCY_ALLOWANCE_SDMMCA_0				0x3b8
+#define MC_LATENCY_ALLOWANCE_SDMMCAA_0				0x3bc
+#define MC_LATENCY_ALLOWANCE_SDMMC_0				0x3c0
+#define MC_LATENCY_ALLOWANCE_SDMMCAB_0				0x3c4
+#define MC_LATENCY_ALLOWANCE_GPU2_0				0x3e8
+#define MC_LATENCY_ALLOWANCE_NVDEC_0				0x3d8
+#define MC_MLL_MPCORER_PTSA_RATE				0x44c
+#define MC_FTOP_PTSA_RATE					0x50c
+#define MC_EMEM_ARB_TIMING_RFCPB				0x6c0
+#define MC_EMEM_ARB_TIMING_CCDMW				0x6c4
+#define MC_EMEM_ARB_REFPB_HP_CTRL				0x6f0
+#define MC_EMEM_ARB_REFPB_BANK_CTRL				0x6f4
+#define MC_PTSA_GRANT_DECREMENT					0x960
+#define MC_EMEM_ARB_DHYST_CTRL					0xbcc
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0			0xbd0
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1			0xbd4
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2			0xbd8
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3			0xbdc
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4			0xbe0
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5			0xbe4
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6			0xbe8
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7			0xbec
+
+#define EMC_INTSTATUS						0x0
+#define EMC_INTSTATUS_CLKCHANGE_COMPLETE			BIT(4)
+#define EMC_DBG							0x8
+#define EMC_DBG_WRITE_MUX_ACTIVE				BIT(1)
+#define EMC_CFG							0xc
+#define EMC_TIMING_CONTROL					0x28
+#define EMC_RC							0x2c
+#define EMC_RFC							0x30
+#define EMC_RAS							0x34
+#define EMC_RP							0x38
+#define EMC_R2W							0x3c
+#define EMC_W2R							0x40
+#define EMC_R2P							0x44
+#define EMC_W2P							0x48
+#define EMC_RD_RCD						0x4c
+#define EMC_WR_RCD						0x50
+#define EMC_RRD							0x54
+#define EMC_REXT						0x58
+#define EMC_WDV							0x5c
+#define EMC_QUSE						0x60
+#define EMC_QRST						0x64
+#define EMC_QSAFE						0x68
+#define EMC_RDV							0x6c
+#define EMC_REFRESH						0x70
+#define EMC_BURST_REFRESH_NUM					0x74
+#define EMC_PDEX2WR						0x78
+#define EMC_PDEX2RD						0x7c
+#define EMC_PCHG2PDEN						0x80
+#define EMC_ACT2PDEN						0x84
+#define EMC_AR2PDEN						0x88
+#define EMC_RW2PDEN						0x8c
+#define EMC_TXSR						0x90
+#define EMC_TCKE						0x94
+#define EMC_TFAW						0x98
+#define EMC_TRPAB						0x9c
+#define EMC_TCLKSTABLE						0xa0
+#define EMC_TCLKSTOP						0xa4
+#define EMC_TREFBW						0xa8
+#define EMC_TPPD						0xac
+#define EMC_ODT_WRITE						0xb0
+#define EMC_PDEX2MRR						0xb4
+#define EMC_WEXT						0xb8
+#define EMC_RFC_SLR						0xc0
+#define EMC_MRS_WAIT_CNT2					0xc4
+#define EMC_MRS_WAIT_CNT					0xc8
+#define EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT			0
+#define EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK			\
+	(0x3FF << EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT)
+
+#define EMC_MRS							0xcc
+#define EMC_EMRS						0xd0
+#define EMC_EMRS_USE_EMRS_LONG_CNT				BIT(26)
+#define EMC_REF							0xd4
+#define EMC_SELF_REF						0xe0
+#define EMC_MRW							0xe8
+#define EMC_MRW_MRW_OP_SHIFT					0
+#define EMC_MRW_MRW_OP_MASK					\
+	(0xff << EMC_MRW_MRW_OP_SHIFT)
+#define EMC_MRW_MRW_MA_SHIFT					16
+#define EMC_MRW_USE_MRW_EXT_CNT					27
+#define EMC_MRW_MRW_DEV_SELECTN_SHIFT				30
+
+#define EMC_MRR							0xec
+#define EMC_MRR_DEV_SEL_SHIFT					30
+#define EMC_MRR_DEV_SEL_MASK					0x3
+#define EMC_MRR_MA_SHIFT					16
+#define EMC_MRR_MA_MASK						0xff
+#define EMC_MRR_DATA_SHIFT					0
+#define EMC_MRR_DATA_MASK					0xffff
+
+#define EMC_FBIO_SPARE						0x100
+#define EMC_FBIO_CFG5						0x104
+#define EMC_FBIO_CFG5_DRAM_TYPE_SHIFT				0
+#define EMC_FBIO_CFG5_DRAM_TYPE_MASK				\
+	(0x3 << EMC_FBIO_CFG5_DRAM_TYPE_SHIFT)
+#define EMC_FBIO_CFG5_CMD_TX_DIS				BIT(8)
+
+#define EMC_PDEX2CKE						0x118
+#define EMC_CKE2PDEN						0x11c
+#define EMC_MPC							0x128
+#define EMC_R2R							0x144
+#define EMC_EINPUT						0x14c
+#define EMC_EINPUT_DURATION					0x150
+#define EMC_PUTERM_EXTRA					0x154
+#define EMC_TCKESR						0x158
+#define EMC_TPD							0x15c
+#define EMC_EMC_STATUS						0x2b4
+#define EMC_EMC_STATUS_TIMING_UPDATE_STALLED			BIT(23)
+#define EMC_CFG_DIG_DLL						0x2bc
+#define EMC_CFG_DIG_DLL_CFG_DLL_EN				BIT(0)
+#define EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_UNTIL_LOCK		BIT(1)
+#define EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_TRAFFIC		BIT(3)
+#define EMC_CFG_DIG_DLL_CFG_DLL_STALL_RW_UNTIL_LOCK		BIT(4)
+#define EMC_CFG_DIG_DLL_CFG_DLL_MODE_SHIFT			6
+#define EMC_CFG_DIG_DLL_CFG_DLL_MODE_MASK			\
+	(0x3 << EMC_CFG_DIG_DLL_CFG_DLL_MODE_SHIFT)
+#define EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_SHIFT		8
+#define EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_MASK			\
+	(0x7 << EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_SHIFT)
+
+#define EMC_CFG_DIG_DLL_PERIOD					0x2c0
+#define EMC_DIG_DLL_STATUS					0x2c4
+#define EMC_DIG_DLL_STATUS_DLL_LOCK				BIT(15)
+#define EMC_DIG_DLL_STATUS_DLL_PRIV_UPDATED			BIT(17)
+#define EMC_DIG_DLL_STATUS_DLL_OUT_SHIFT			0
+#define EMC_DIG_DLL_STATUS_DLL_OUT_MASK				\
+	(0x7ff << EMC_DIG_DLL_STATUS_DLL_OUT_SHIFT)
+
+#define EMC_CFG_DIG_DLL_1					0x2c8
+#define EMC_RDV_MASK						0x2cc
+#define EMC_WDV_MASK						0x2d0
+#define EMC_RDV_EARLY_MASK					0x2d4
+#define EMC_RDV_EARLY						0x2d8
+#define EMC_ZCAL_INTERVAL					0x2e0
+#define EMC_ZCAL_WAIT_CNT					0x2e4
+#define EMC_FDPD_CTRL_DQ					0x310
+#define EMC_FDPD_CTRL_CMD					0x314
+#define EMC_PMACRO_CMD_BRICK_CTRL_FDPD				0x318
+#define EMC_PMACRO_DATA_BRICK_CTRL_FDPD				0x31c
+#define EMC_PMACRO_BRICK_CTRL_RFU1				0x330
+#define EMC_PMACRO_BRICK_CTRL_RFU2				0x334
+#define EMC_TR_TIMING_0						0x3b4
+#define EMC_TR_CTRL_1						0x3bc
+#define EMC_TR_RDV						0x3c4
+#define EMC_PRE_REFRESH_REQ_CNT					0x3dc
+#define EMC_DYN_SELF_REF_CONTROL				0x3e0
+#define EMC_TXSRDLL						0x3e4
+#define EMC_CCFIFO_ADDR						0x3e8
+#define  EMC_CCFIFO_ADDR_STALL_BY_1 (1 << 31)
+#define  EMC_CCFIFO_ADDR_STALL(x) (((x) & 0x7fff) << 16)
+#define  EMC_CCFIFO_ADDR_OFFSET(x) ((x) & 0xffff)
+#define EMC_CCFIFO_DATA						0x3ec
+#define EMC_TR_QPOP						0x3f4
+#define EMC_TR_RDV_MASK						0x3f8
+#define EMC_TR_QSAFE						0x3fc
+#define EMC_TR_QRST						0x400
+#define EMC_TR_DVFS						0x460
+#define EMC_AUTO_CAL_CHANNEL					0x464
+#define EMC_IBDLY						0x468
+#define EMC_OBDLY						0x46c
+#define EMC_TXDSRVTTGEN						0x480
+#define EMC_WE_DURATION						0x48c
+#define EMC_WS_DURATION						0x490
+#define EMC_WEV							0x494
+#define EMC_WSV							0x498
+#define EMC_CFG_3						0x49c
+#define EMC_MRW6						0x4a4
+#define EMC_MRW7						0x4a8
+#define EMC_MRW8						0x4ac
+#define EMC_MRW10						0x4b4
+#define EMC_MRW11						0x4b8
+#define EMC_MRW12						0x4bc
+#define EMC_MRW13						0x4c0
+#define EMC_MRW14						0x4c4
+#define EMC_MRW15						0x4d0
+#define EMC_WDV_CHK						0x4e0
+#define EMC_CFG_PIPE_2						0x554
+#define EMC_CFG_PIPE_1						0x55c
+#define EMC_CFG_PIPE						0x560
+#define EMC_QPOP						0x564
+#define EMC_QUSE_WIDTH						0x568
+#define EMC_PUTERM_WIDTH					0x56c
+#define EMC_REFCTRL2						0x580
+#define EMC_FBIO_CFG7						0x584
+#define EMC_FBIO_CFG7_CH0_ENABLE				BIT(1)
+#define EMC_FBIO_CFG7_CH1_ENABLE				BIT(2)
+#define EMC_DATA_BRLSHFT_0					0x588
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE7_DATA_BRLSHFT_SHIFT	21
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE7_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE7_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE6_DATA_BRLSHFT_SHIFT	18
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE6_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE6_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE5_DATA_BRLSHFT_SHIFT	15
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE5_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE5_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE4_DATA_BRLSHFT_SHIFT	12
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE4_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE4_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE3_DATA_BRLSHFT_SHIFT	9
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE3_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE3_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE2_DATA_BRLSHFT_SHIFT	6
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE2_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE2_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE1_DATA_BRLSHFT_SHIFT	3
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE1_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE1_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE0_DATA_BRLSHFT_SHIFT	0
+#define EMC_DATA_BRLSHFT_0_RANK0_BYTE0_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE0_DATA_BRLSHFT_SHIFT)
+
+#define EMC_DATA_BRLSHFT_1					0x58c
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE7_DATA_BRLSHFT_SHIFT	21
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE7_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE7_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE6_DATA_BRLSHFT_SHIFT	18
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE6_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE6_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE5_DATA_BRLSHFT_SHIFT	15
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE5_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE5_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE4_DATA_BRLSHFT_SHIFT	12
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE4_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE4_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE3_DATA_BRLSHFT_SHIFT	9
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE3_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE3_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE2_DATA_BRLSHFT_SHIFT	6
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE2_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE2_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE1_DATA_BRLSHFT_SHIFT	3
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE1_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE1_DATA_BRLSHFT_SHIFT)
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE0_DATA_BRLSHFT_SHIFT	0
+#define EMC_DATA_BRLSHFT_1_RANK1_BYTE0_DATA_BRLSHFT_MASK	\
+	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE0_DATA_BRLSHFT_SHIFT)
+
+#define EMC_RFCPB						0x590
+#define EMC_DQS_BRLSHFT_0					0x594
+#define EMC_DQS_BRLSHFT_1					0x598
+#define EMC_CMD_BRLSHFT_0					0x59c
+#define EMC_CMD_BRLSHFT_1					0x5a0
+#define EMC_CMD_BRLSHFT_2					0x5a4
+#define EMC_CMD_BRLSHFT_3					0x5a8
+#define EMC_QUSE_BRLSHFT_0					0x5ac
+#define EMC_QUSE_BRLSHFT_1					0x5b8
+#define EMC_QUSE_BRLSHFT_2					0x5bc
+#define EMC_CCDMW						0x5c0
+#define EMC_QUSE_BRLSHFT_3					0x5c4
+#define EMC_DLL_CFG_0						0x5e4
+#define EMC_DLL_CFG_1						0x5e8
+#define EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_SHIFT		10
+#define EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_MASK		\
+	(0x7ff << EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_SHIFT)
+
+#define EMC_CONFIG_SAMPLE_DELAY					0x5f0
+#define EMC_PMACRO_QUSE_DDLL_RANK0_0				0x600
+#define EMC_PMACRO_QUSE_DDLL_RANK0_1				0x604
+#define EMC_PMACRO_QUSE_DDLL_RANK0_2				0x608
+#define EMC_PMACRO_QUSE_DDLL_RANK0_3				0x60c
+#define EMC_PMACRO_QUSE_DDLL_RANK0_4				0x610
+#define EMC_PMACRO_QUSE_DDLL_RANK0_5				0x614
+#define EMC_PMACRO_QUSE_DDLL_RANK1_0				0x620
+#define EMC_PMACRO_QUSE_DDLL_RANK1_1				0x624
+#define EMC_PMACRO_QUSE_DDLL_RANK1_2				0x628
+#define EMC_PMACRO_QUSE_DDLL_RANK1_3				0x62c
+#define EMC_PMACRO_QUSE_DDLL_RANK1_4				0x630
+#define EMC_PMACRO_QUSE_DDLL_RANK1_5				0x634
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0			0x640
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE1_SHIFT \
+	16
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE1_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE1_SHIFT)
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE0_SHIFT \
+	0
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE0_MASK \
+	(0x3ff <<							    \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE0_SHIFT)
+
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1			0x644
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE3_SHIFT \
+	16
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE3_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE3_SHIFT)
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE2_SHIFT \
+	0
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE2_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE2_SHIFT)
+
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2			0x648
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE5_SHIFT  \
+	16
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE5_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE5_SHIFT)
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE4_SHIFT \
+	0
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE4_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE4_SHIFT)
+
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3			0x64c
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE7_SHIFT \
+	16
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE7_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE7_SHIFT)
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE6_SHIFT \
+	0
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE6_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE6_SHIFT)
+
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4			0x650
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5			0x654
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0			0x660
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE1_SHIFT \
+	16
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE1_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE1_SHIFT)
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE0_SHIFT \
+	0
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE0_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE0_SHIFT)
+
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1			0x664
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE3_SHIFT \
+	16
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE3_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE3_SHIFT)
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE2_SHIFT \
+	0
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE2_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE2_SHIFT)
+
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2			0x668
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE5_SHIFT \
+	16
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE5_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE5_SHIFT)
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE4_SHIFT \
+	0
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE4_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE4_SHIFT)
+
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3			0x66c
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE7_SHIFT \
+	16
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE7_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE7_SHIFT)
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE6_SHIFT \
+	0
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE6_MASK  \
+	(0x3ff <<							     \
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE6_SHIFT)
+
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_4			0x670
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_5			0x674
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_0			0x680
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_1			0x684
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_2			0x688
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_3			0x68c
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_4			0x690
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_5			0x694
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_0			0x6a0
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_1			0x6a4
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_2			0x6a8
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_3			0x6ac
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_4			0x6b0
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_5			0x6b4
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_0			0x6c0
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_1			0x6c4
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_2			0x6c8
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_3			0x6cc
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_0			0x6e0
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_1			0x6e4
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_2			0x6e8
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_3			0x6ec
+#define EMC_PMACRO_TX_PWRD_0					0x720
+#define EMC_PMACRO_TX_PWRD_1					0x724
+#define EMC_PMACRO_TX_PWRD_2					0x728
+#define EMC_PMACRO_TX_PWRD_3					0x72c
+#define EMC_PMACRO_TX_PWRD_4					0x730
+#define EMC_PMACRO_TX_PWRD_5					0x734
+#define EMC_PMACRO_TX_SEL_CLK_SRC_0				0x740
+#define EMC_PMACRO_TX_SEL_CLK_SRC_1				0x744
+#define EMC_PMACRO_TX_SEL_CLK_SRC_3				0x74c
+#define EMC_PMACRO_TX_SEL_CLK_SRC_2				0x748
+#define EMC_PMACRO_TX_SEL_CLK_SRC_4				0x750
+#define EMC_PMACRO_TX_SEL_CLK_SRC_5				0x754
+#define EMC_PMACRO_DDLL_BYPASS					0x760
+#define EMC_PMACRO_DDLL_PWRD_0					0x770
+#define EMC_PMACRO_DDLL_PWRD_1					0x774
+#define EMC_PMACRO_DDLL_PWRD_2					0x778
+#define EMC_PMACRO_CMD_CTRL_0					0x780
+#define EMC_PMACRO_CMD_CTRL_1					0x784
+#define EMC_PMACRO_CMD_CTRL_2					0x788
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_0		0x800
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_1		0x804
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_2		0x808
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_3		0x80c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_0		0x810
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_1		0x814
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_2		0x818
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_3		0x81c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_0		0x820
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_1		0x824
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_2		0x828
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_3		0x82c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_0		0x830
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_1		0x834
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_2		0x838
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_3		0x83c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_0		0x840
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_1		0x844
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_2		0x848
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_3		0x84c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_0		0x850
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_1		0x854
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_2		0x858
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_3		0x85c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_0		0x860
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_1		0x864
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_2		0x868
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_3		0x86c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_0		0x870
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_1		0x874
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_2		0x878
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_3		0x87c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_0		0x880
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_1		0x884
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_2		0x888
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_3		0x88c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_0		0x890
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_1		0x894
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_2		0x898
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_3		0x89c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_0		0x8a0
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_1		0x8a4
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_2		0x8a8
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_3		0x8ac
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_0		0x8b0
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_1		0x8b4
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_2		0x8b8
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_3		0x8bc
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_0		0x900
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_1		0x904
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_2		0x908
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_3		0x90c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_0		0x910
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_1		0x914
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_2		0x918
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_3		0x91c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_0		0x920
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_1		0x924
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_2		0x928
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_3		0x92c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_0		0x930
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_1		0x934
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_2		0x938
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_3		0x93c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_0		0x940
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_1		0x944
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_2		0x948
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_3		0x94c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_0		0x950
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_1		0x954
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_2		0x958
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_3		0x95c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_0		0x960
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_1		0x964
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_2		0x968
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_3		0x96c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_0		0x970
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_1		0x974
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_2		0x978
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_3		0x97c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_0		0x980
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_1		0x984
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_2		0x988
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_3		0x98c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_0		0x990
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_1		0x994
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_2		0x998
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_3		0x99c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_0		0x9a0
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_1		0x9a4
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_2		0x9a8
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_3		0x9ac
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_0		0x9b0
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_1		0x9b4
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_2		0x9b8
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_3		0x9bc
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_0		0xa00
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_1		0xa04
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_2		0xa08
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_0		0xa10
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_1		0xa14
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_2		0xa18
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_0		0xa20
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_1		0xa24
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_2		0xa28
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_0		0xa30
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_1		0xa34
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_2		0xa38
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_0		0xa40
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_1		0xa44
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_2		0xa48
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_0		0xa50
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_1		0xa54
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_2		0xa58
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_0		0xa60
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_1		0xa64
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_2		0xa68
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_0		0xa70
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_1		0xa74
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_2		0xa78
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_0		0xb00
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_1		0xb04
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_2		0xb08
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_0		0xb10
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_1		0xb14
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_2		0xb18
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_0		0xb20
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_1		0xb24
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_2		0xb28
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_0		0xb30
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_1		0xb34
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_2		0xb38
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_0		0xb40
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_1		0xb44
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_2		0xb48
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_0		0xb50
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_1		0xb54
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_2		0xb58
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_0		0xb60
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_1		0xb64
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_2		0xb68
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_0		0xb70
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_1		0xb74
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_2		0xb78
+#define EMC_PMACRO_IB_VREF_DQ_0					0xbe0
+#define EMC_PMACRO_IB_VREF_DQ_1					0xbe4
+#define EMC_PMACRO_IB_VREF_DQS_0				0xbf0
+#define EMC_PMACRO_IB_VREF_DQS_1				0xbf4
+#define EMC_PMACRO_DDLL_LONG_CMD_0				0xc00
+#define EMC_PMACRO_DDLL_LONG_CMD_1				0xc04
+#define EMC_PMACRO_DDLL_LONG_CMD_2				0xc08
+#define EMC_PMACRO_DDLL_LONG_CMD_3				0xc0c
+#define EMC_PMACRO_DDLL_LONG_CMD_4				0xc10
+#define EMC_PMACRO_DDLL_LONG_CMD_5				0xc14
+#define EMC_PMACRO_DDLL_SHORT_CMD_0				0xc20
+#define EMC_PMACRO_DDLL_SHORT_CMD_1				0xc24
+#define EMC_PMACRO_DDLL_SHORT_CMD_2				0xc28
+#define EMC_PMACRO_VTTGEN_CTRL_0				0xc34
+#define EMC_PMACRO_VTTGEN_CTRL_1				0xc38
+#define EMC_PMACRO_BG_BIAS_CTRL_0				0xc3c
+#define EMC_PMACRO_PAD_CFG_CTRL					0xc40
+#define EMC_PMACRO_ZCTRL					0xc44
+#define EMC_PMACRO_CMD_PAD_RX_CTRL				0xc50
+#define EMC_PMACRO_DATA_PAD_RX_CTRL				0xc54
+#define EMC_PMACRO_CMD_RX_TERM_MODE				0xc58
+#define EMC_PMACRO_DATA_RX_TERM_MODE				0xc5c
+#define EMC_PMACRO_CMD_PAD_TX_CTRL				0xc60
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC		BIT(1)
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC		BIT(9)
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC		BIT(16)
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC		BIT(24)
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON		BIT(26)
+
+#define EMC_PMACRO_DATA_PAD_TX_CTRL				0xc64
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC		BIT(1)
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC		BIT(9)
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC		BIT(16)
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC		BIT(24)
+
+#define EMC_PMACRO_COMMON_PAD_TX_CTRL				0xc68
+#define EMC_PMACRO_AUTOCAL_CFG_COMMON				0xc78
+#define EMC_PMACRO_VTTGEN_CTRL_2				0xcf0
+#define EMC_PMACRO_IB_RXRT					0xcf4
+#define EMC_TRAINING_CTRL					0xe04
+#define EMC_TRAINING_QUSE_CORS_CTRL				0xe0c
+#define EMC_TRAINING_QUSE_FINE_CTRL				0xe10
+#define EMC_TRAINING_QUSE_CTRL_MISC				0xe14
+#define EMC_TRAINING_WRITE_FINE_CTRL				0xe18
+#define EMC_TRAINING_WRITE_CTRL_MISC				0xe1c
+#define EMC_TRAINING_WRITE_VREF_CTRL				0xe20
+#define EMC_TRAINING_READ_FINE_CTRL				0xe24
+#define EMC_TRAINING_READ_CTRL_MISC				0xe28
+#define EMC_TRAINING_READ_VREF_CTRL				0xe2c
+#define EMC_TRAINING_CA_FINE_CTRL				0xe30
+#define EMC_TRAINING_CA_CTRL_MISC				0xe34
+#define EMC_TRAINING_CA_CTRL_MISC1				0xe38
+#define EMC_TRAINING_CA_VREF_CTRL				0xe3c
+#define EMC_TRAINING_SETTLE					0xe44
+#define EMC_TRAINING_MPC					0xe5c
+#define EMC_TRAINING_VREF_SETTLE				0xe6c
+#define EMC_TRAINING_QUSE_VREF_CTRL				0xed0
+#define EMC_TRAINING_OPT_DQS_IB_VREF_RANK0			0xed4
+#define EMC_TRAINING_OPT_DQS_IB_VREF_RANK1			0xed8
+
+#define EMC_COPY_TABLE_PARAM_PERIODIC_FIELDS			BIT(0)
+#define EMC_COPY_TABLE_PARAM_TRIM_REGS				BIT(1)
+
+enum burst_regs_list {
+	EMC_REFRESH_INDEX = 41,
+	EMC_PRE_REFRESH_REQ_CNT_INDEX = 43,
+	EMC_FBIO_CFG5_INDEX = 65,
+	EMC_DLL_CFG_0_INDEX = 144,
+	EMC_DYN_SELF_REF_CONTROL_INDEX = 150,
+	EMC_PMACRO_CMD_PAD_TX_CTRL_INDEX = 161,
+	EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX,
+	EMC_PMACRO_COMMON_PAD_TX_CTRL_INDEX,
+	EMC_PMACRO_BRICK_CTRL_RFU1_INDEX = 167,
+};
+
+enum trim_regs_list {
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_INDEX = 60,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_INDEX,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_INDEX,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_INDEX,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4_INDEX,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5_INDEX,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_INDEX,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_INDEX,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_INDEX,
+	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_INDEX,
+};
+
 enum burst_mc_regs_list {
 	MC_EMEM_ARB_MISC0_INDEX = 20,
 };
 
 enum {
-	REG_EMC,
-	REG_EMC0,
-	REG_EMC1,
-	REG_TYPE_NUM,
+	T_RP,
+	T_FC_LPDDR4,
+	T_RFC,
+	T_PDEX,
+	RL,
+};
+
+enum {
+	AUTO_PD = 0,
+	MAN_SR  = 2,
+};
+
+enum {
+	ASSEMBLY = 0,
+	ACTIVE,
+};
+
+enum {
+	DRAM_TYPE_DDR3,
+	DRAM_TYPE_LPDDR4,
+	DRAM_TYPE_LPDDR2,
+	DRAM_TYPE_DDR2,
 };
 
 enum {
@@ -35,22 +739,35 @@ enum {
 	DRAM_CLKTREE_NUM,
 };
 
-enum {
-	VREF_REGS_PER_CH_SIZE = 4,
-	DRAM_TIMINGS_NUM = 5,
-	BURST_REGS_PER_CH_SIZE = 8,
-	TRIM_REGS_PER_CH_SIZE = 10,
-	PTFV_ARRAY_SIZE = 12,
-	SAVE_RESTORE_MOD_REGS_SIZE = 12,
-	TRAINING_MOD_REGS_SIZE = 20,
-	BURST_UP_DOWN_REGS_SIZE = 24,
-	BURST_MC_REGS_SIZE = 33,
-	TRIM_REGS_SIZE = 138,
-	BURST_REGS_SIZE = 221,
+#define VREF_REGS_PER_CHANNEL_SIZE 4
+#define DRAM_TIMINGS_NUM 5
+#define BURST_REGS_PER_CHANNEL_SIZE 8
+#define TRIM_REGS_PER_CHANNEL_SIZE 10
+#define PTFV_ARRAY_SIZE 12
+#define SAVE_RESTORE_MOD_REGS_SIZE 12
+#define TRAINING_MOD_REGS_SIZE 20
+#define BURST_UP_DOWN_REGS_SIZE 24
+#define BURST_MC_REGS_SIZE 33
+#define TRIM_REGS_SIZE 138
+#define BURST_REGS_SIZE 221
+
+struct tegra210_emc_per_channel_regs {
+	u16 bank;
+	u16 offset;
+};
+
+struct tegra210_emc_table_register_offsets {
+	u16 burst[BURST_REGS_SIZE];
+	u16 trim[TRIM_REGS_SIZE];
+	u16 burst_mc[BURST_MC_REGS_SIZE];
+	u16 la_scale[BURST_UP_DOWN_REGS_SIZE];
+	struct tegra210_emc_per_channel_regs burst_per_channel[BURST_REGS_PER_CHANNEL_SIZE];
+	struct tegra210_emc_per_channel_regs trim_per_channel[TRIM_REGS_PER_CHANNEL_SIZE];
+	struct tegra210_emc_per_channel_regs vref_per_channel[VREF_REGS_PER_CHANNEL_SIZE];
 };
 
-struct emc_table {
-	u32 rev;
+struct tegra210_emc_timing {
+	u32 revision;
 	const char dvfs_ver[60];
 	u32 rate;
 	u32 min_volt;
@@ -80,15 +797,15 @@ struct emc_table {
 	u32 ptfv_list[PTFV_ARRAY_SIZE];
 
 	u32 burst_regs[BURST_REGS_SIZE];
-	u32 burst_reg_per_ch[BURST_REGS_PER_CH_SIZE];
+	u32 burst_reg_per_ch[BURST_REGS_PER_CHANNEL_SIZE];
 	u32 shadow_regs_ca_train[BURST_REGS_SIZE];
 	u32 shadow_regs_quse_train[BURST_REGS_SIZE];
 	u32 shadow_regs_rdwr_train[BURST_REGS_SIZE];
 
 	u32 trim_regs[TRIM_REGS_SIZE];
-	u32 trim_perch_regs[TRIM_REGS_PER_CH_SIZE];
+	u32 trim_perch_regs[TRIM_REGS_PER_CHANNEL_SIZE];
 
-	u32 vref_perch_regs[VREF_REGS_PER_CH_SIZE];
+	u32 vref_perch_regs[VREF_REGS_PER_CHANNEL_SIZE];
 
 	u32 dram_timings[DRAM_TIMINGS_NUM];
 	u32 training_mod_regs[TRAINING_MOD_REGS_SIZE];
@@ -121,36 +838,126 @@ struct emc_table {
 	u32 latency;
 };
 
-struct tegra_emc {
-	struct clk_hw hw;
-	struct clk *emc_clk;
-	struct device *dev;
-	struct timer_list training_timer;
+enum tegra210_emc_dram_over_temp_state {
+	TEGRA_DRAM_OVER_TEMP_NONE = 0,
+	TEGRA_DRAM_OVER_TEMP_REFRESH_X2,
+	TEGRA_DRAM_OVER_TEMP_REFRESH_X4,
+	TEGRA_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
+	TEGRA_DRAM_OVER_TEMP_MAX,
+};
 
+struct tegra210_emc {
 	struct tegra_mc *mc;
+	struct device *dev;
+	struct clk *clk;
+
+	struct tegra210_emc_timing *timings;
+	unsigned int num_timings;
 
-	void __iomem *emc_base[REG_TYPE_NUM];
+	const struct tegra210_emc_table_register_offsets *offsets;
 
-	struct emc_table *current_timing;
-	struct emc_table *next_timing;
+	const struct tegra210_emc_sequence *sequence;
+	spinlock_t lock;
 
-	struct emc_table *emc_table;
-	unsigned int emc_table_size;
+	void __iomem *regs, *channel[2];
+	unsigned int num_devices;
+
+	struct tegra210_emc_timing *last;
+	struct tegra210_emc_timing *next;
+
+	unsigned int training_interval;
+	struct timer_list training;
+
+	enum tegra210_emc_dram_over_temp_state state;
 
-	u32 clk_setting;
 	ktime_t clkchange_time;
 	int clkchange_delay;
-	u32 timer_period_training;
 
-	bool emc_suspend;
-	unsigned long emc_resume_rate;
+	unsigned long resume_rate;
+	bool suspend;
+
+	struct {
+		struct dentry *root;
+		unsigned long min_rate;
+		unsigned long max_rate;
+	} debugfs;
+
+	struct tegra210_clk_emc_provider provider;
 };
 
-struct supported_sequence {
-	u8 table_rev;
-	void (*set_clock)(struct tegra_emc *emc, u32 clksrc);
-	u32 (*periodic_compensation)(struct tegra_emc *emc);
-	char *seq_rev;
+struct tegra210_emc_sequence {
+	u8 revision;
+	void (*set_clock)(struct tegra210_emc *emc, u32 clksrc);
+	u32 (*periodic_compensation)(struct tegra210_emc *emc);
 };
 
+static inline void emc_writel(struct tegra210_emc *emc, u32 value,
+			      unsigned int offset)
+{
+	writel_relaxed(value, emc->regs + offset);
+}
+
+static inline u32 emc_readl(struct tegra210_emc *emc, unsigned int offset)
+{
+	return readl_relaxed(emc->regs + offset);
+}
+
+static inline void emc_channel_writel(struct tegra210_emc *emc,
+				      unsigned int channel,
+				      u32 value, unsigned int offset)
+{
+	writel_relaxed(value, emc->channel[channel] + offset);
+}
+
+static inline u32 emc_channel_readl(struct tegra210_emc *emc,
+				    unsigned int channel, unsigned int offset)
+{
+	return readl_relaxed(emc->channel[channel] + offset);
+}
+
+static inline void ccfifo_writel(struct tegra210_emc *emc, u32 value,
+				 unsigned int offset, u32 delay)
+{
+	writel_relaxed(value, emc->regs + EMC_CCFIFO_DATA);
+
+	value = EMC_CCFIFO_ADDR_STALL_BY_1 | EMC_CCFIFO_ADDR_STALL(delay) |
+		EMC_CCFIFO_ADDR_OFFSET(offset);
+	writel_relaxed(value, emc->regs + EMC_CCFIFO_ADDR);
+}
+
+static inline u32 div_o3(u32 a, u32 b)
+{
+	u32 result = a / b;
+
+	if ((b * result) < a)
+		return result + 1;
+
+	return result;
+}
+
+void tegra210_emc_do_clock_change(struct tegra210_emc *emc, u32 clksrc);
+void tegra210_emc_set_shadow_bypass(struct tegra210_emc *emc, int set);
+void tegra210_emc_timing_update(struct tegra210_emc *emc,
+				unsigned int num_channels);
+u32 tegra210_emc_get_dll_state(struct tegra210_emc_timing *next);
+struct tegra210_emc_timing *tegra210_emc_find_timing(struct tegra210_emc *emc,
+						     unsigned long rate);
+void tegra210_emc_set_over_temp_timing(struct tegra210_emc *emc,
+			      struct tegra210_emc_timing *timing);
+int tegra210_emc_wait_for_update(struct tegra210_emc *emc, unsigned int channel,
+				 unsigned int offset, u32 bit_mask, bool state);
+unsigned long tegra210_emc_actual_osc_clocks(u32 in);
+u32 tegra210_emc_compensate(struct tegra210_emc_timing *next, u32 offset);
+void tegra210_emc_dll_disable(struct tegra210_emc *emc,
+			      unsigned int num_channels);
+void tegra210_emc_dll_enable(struct tegra210_emc *emc,
+			     unsigned int num_channels);
+u32 tegra210_emc_dll_prelock(struct tegra210_emc *emc, u32 clksrc);
+u32 tegra210_emc_dvfs_power_ramp_down(struct tegra210_emc *emc, u32 clk,
+				      bool flip_backward);
+u32 tegra210_emc_dvfs_power_ramp_up(struct tegra210_emc *emc, u32 clk,
+				    bool flip_backward);
+void tegra210_emc_reset_dram_clktree_values(struct tegra210_emc_timing *timing);
+void tegra210_emc_start_periodic_compensation(struct tegra210_emc *emc);
+
 #endif
-- 
2.24.1
