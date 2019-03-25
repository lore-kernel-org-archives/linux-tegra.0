From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 4/8] memory: tegra: add EMC scaling support code for Tegra210
Date: Mon, 25 Mar 2019 15:45:19 +0800
Message-ID: <20190325074523.26456-5-josephl@nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325074523.26456-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob
 Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch adds the required APIs and variables for the EMC scaling
sequence code on Tegra210.

Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/memory/tegra/tegra210-emc-reg.h | 265 +++++++
 drivers/memory/tegra/tegra210-emc.c     | 923 ++++++++++++++++++++++++
 2 files changed, 1188 insertions(+)

diff --git a/drivers/memory/tegra/tegra210-emc-reg.h b/drivers/memory/tegra/tegra210-emc-reg.h
index 84fcc85f3b6d..31a69e718dbc 100644
--- a/drivers/memory/tegra/tegra210-emc-reg.h
+++ b/drivers/memory/tegra/tegra210-emc-reg.h
@@ -12,6 +12,13 @@
 
 #include "mc.h"
 
+#define DVFS_FGCG_HIGH_SPEED_THRESHOLD				1000
+#define IOBRICK_DCC_THRESHOLD					2400
+#define DVFS_FGCG_MID_SPEED_THRESHOLD				600
+
+#define EMC_STATUS_UPDATE_TIMEOUT				1000
+
+#define MC_EMEM_ADR_CFG						0x54
 #define MC_EMEM_ARB_CFG						0x90
 #define MC_EMEM_ARB_OUTSTANDING_REQ				0x94
 #define MC_EMEM_ARB_TIMING_RCD					0x98
@@ -75,12 +82,33 @@
 #define EMC_CLK_EMC_2X_CLK_SRC_SHIFT				29
 #define EMC_CLK_EMC_2X_CLK_SRC_MASK				\
 	(0x7 << EMC_CLK_EMC_2X_CLK_SRC_SHIFT)
+#define EMC_CLK_SOURCE_PLLM_LJ					0x4
+#define EMC_CLK_SOURCE_PLLMB_LJ					0x5
 #define	EMC_CLK_MC_EMC_SAME_FREQ				BIT(16)
 #define EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT			0
 #define EMC_CLK_EMC_2X_CLK_DIVISOR_MASK				\
 	(0xff << EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT)
 
+#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL			0x664
+#define DLL_CLK_EMC_DLL_CLK_SRC_SHIFT				29
+#define DLL_CLK_EMC_DLL_CLK_SRC_MASK				\
+	(0x7 << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT)
+#define DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT			10
+#define DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK			\
+	(0x3 << DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT)
+#define PLLM_VCOA						0
+#define PLLM_VCOB						1
+#define EMC_DLL_SWITCH_OUT					2
+#define DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT			0
+#define DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK			\
+	(0xff << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT)
+
+#define EMC_INTSTATUS						0x0
+#define EMC_INTSTATUS_CLKCHANGE_COMPLETE			BIT(4)
+#define EMC_DBG							0x8
+#define EMC_DBG_WRITE_MUX_ACTIVE				BIT(1)
 #define EMC_CFG							0xc
+#define EMC_TIMING_CONTROL					0x28
 #define EMC_RC							0x2c
 #define EMC_RFC							0x30
 #define EMC_RAS							0x34
@@ -125,16 +153,40 @@
 #define EMC_FBIO_CFG5_DRAM_TYPE_SHIFT				0
 #define EMC_FBIO_CFG5_DRAM_TYPE_MASK				\
 	(0x3 <<	EMC_FBIO_CFG5_DRAM_TYPE_SHIFT)
+#define EMC_FBIO_CFG5_CMD_TX_DIS				BIT(8)
+
 #define EMC_PDEX2CKE						0x118
 #define EMC_CKE2PDEN						0x11c
+#define EMC_MPC							0x128
 #define EMC_R2R							0x144
 #define EMC_EINPUT						0x14c
 #define EMC_EINPUT_DURATION					0x150
 #define EMC_PUTERM_EXTRA					0x154
 #define EMC_TCKESR						0x158
 #define EMC_TPD							0x15c
+#define EMC_EMC_STATUS						0x2b4
+#define EMC_EMC_STATUS_TIMING_UPDATE_STALLED			BIT(23)
 #define EMC_CFG_DIG_DLL						0x2bc
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
 #define EMC_CFG_DIG_DLL_PERIOD					0x2c0
+#define EMC_DIG_DLL_STATUS					0x2c4
+#define EMC_DIG_DLL_STATUS_DLL_LOCK				BIT(15)
+#define EMC_DIG_DLL_STATUS_DLL_PRIV_UPDATED			BIT(17)
+#define EMC_DIG_DLL_STATUS_DLL_OUT_SHIFT			0
+#define EMC_DIG_DLL_STATUS_DLL_OUT_MASK				\
+	(0x7ff << EMC_DIG_DLL_STATUS_DLL_OUT_SHIFT)
+
+#define EMC_CFG_DIG_DLL_1					0x2c8
 #define EMC_RDV_MASK						0x2cc
 #define EMC_WDV_MASK						0x2d0
 #define EMC_RDV_EARLY_MASK					0x2d4
@@ -153,6 +205,8 @@
 #define EMC_PRE_REFRESH_REQ_CNT					0x3dc
 #define EMC_DYN_SELF_REF_CONTROL				0x3e0
 #define EMC_TXSRDLL						0x3e4
+#define EMC_CCFIFO_ADDR						0x3e8
+#define EMC_CCFIFO_DATA						0x3ec
 #define EMC_TR_QPOP						0x3f4
 #define EMC_TR_RDV_MASK						0x3f8
 #define EMC_TR_QSAFE						0x3fc
@@ -185,8 +239,60 @@
 #define EMC_PUTERM_WIDTH					0x56c
 #define EMC_REFCTRL2						0x580
 #define EMC_FBIO_CFG7						0x584
+#define EMC_FBIO_CFG7_CH0_ENABLE				BIT(1)
+#define EMC_FBIO_CFG7_CH1_ENABLE				BIT(2)
 #define EMC_DATA_BRLSHFT_0					0x588
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
 #define EMC_DATA_BRLSHFT_1					0x58c
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
 #define EMC_RFCPB						0x590
 #define EMC_DQS_BRLSHFT_0					0x594
 #define EMC_DQS_BRLSHFT_1					0x598
@@ -201,6 +307,10 @@
 #define EMC_QUSE_BRLSHFT_3					0x5c4
 #define EMC_DLL_CFG_0						0x5e4
 #define EMC_DLL_CFG_1						0x5e8
+#define EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_SHIFT		10
+#define EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_MASK		\
+	(0x7ff << EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_SHIFT)
+
 #define EMC_CONFIG_SAMPLE_DELAY					0x5f0
 #define EMC_PMACRO_QUSE_DDLL_RANK0_0				0x600
 #define EMC_PMACRO_QUSE_DDLL_RANK0_1				0x604
@@ -215,15 +325,103 @@
 #define EMC_PMACRO_QUSE_DDLL_RANK1_4				0x630
 #define EMC_PMACRO_QUSE_DDLL_RANK1_5				0x634
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0			0x640
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
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1			0x644
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
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2			0x648
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
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3			0x64c
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
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4			0x650
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5			0x654
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0			0x660
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
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1			0x664
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
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2			0x668
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
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3			0x66c
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
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_4			0x670
 #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_5			0x674
 #define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_0			0x680
@@ -432,7 +630,18 @@
 #define EMC_PMACRO_CMD_RX_TERM_MODE				0xc58
 #define EMC_PMACRO_DATA_RX_TERM_MODE				0xc5c
 #define EMC_PMACRO_CMD_PAD_TX_CTRL				0xc60
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC		BIT(1)
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC		BIT(9)
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC		BIT(16)
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC		BIT(24)
+#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON		BIT(26)
+
 #define EMC_PMACRO_DATA_PAD_TX_CTRL				0xc64
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC		BIT(1)
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC		BIT(9)
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC		BIT(16)
+#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC		BIT(24)
+
 #define EMC_PMACRO_COMMON_PAD_TX_CTRL				0xc68
 #define EMC_PMACRO_AUTOCAL_CFG_COMMON				0xc78
 #define EMC_PMACRO_VTTGEN_CTRL_2				0xcf0
@@ -954,6 +1163,16 @@ enum {
 	DRAM_TYPE_DDR2 = 3,
 };
 
+enum {
+	SINGLE_CHANNEL = 0,
+	DUAL_CHANNEL
+};
+
+enum {
+	DLL_OFF,
+	DLL_ON
+};
+
 struct emc_table {
 	u32 rev;
 	char dvfs_ver[60];
@@ -1075,9 +1294,55 @@ struct supported_sequence {
 	char  *seq_rev;
 };
 
+extern u32 burst_mc_regs_off[];
+extern u32 burst_regs_off[];
+extern u32 burst_regs_per_ch_off[];
+extern u32 burst_regs_per_ch_type[];
+extern unsigned long dram_over_temp_state;
+extern u32 la_scale_regs_off[];
+extern u32 trim_regs_off[];
+extern u32 trim_regs_per_ch_off[];
+extern u32 trim_regs_per_ch_type[];
+extern u32 vref_regs_per_ch_off[];
+extern u32 vref_regs_per_ch_type[];
+
+void ccfifo_writel(struct tegra_emc *emc, u32 val, unsigned long addr,
+		   u32 delay);
+u32 div_o3(u32 a, u32 b);
+void emc_writel(struct tegra_emc *emc, u32 val, unsigned long offset);
+u32  emc_readl(struct tegra_emc *emc, unsigned long offset);
+void emc_writel_per_ch(struct tegra_emc *emc, u32 val, int type,
+		       unsigned long offset);
+u32  emc1_readl(struct tegra_emc *emc, unsigned long offset);
+
+void do_clock_change(struct tegra_emc *emc, u32 clksrc);
+void emc_set_shadow_bypass(struct tegra_emc *emc, int set);
+void emc_timing_update(struct tegra_emc *emc, int dual_chan);
+u32 get_dll_state(struct emc_table *next_timing);
+struct emc_table *get_timing_from_freq(struct tegra_emc *emc,
+				       unsigned long rate);
+void set_over_temp_timing(struct tegra_emc *emc, struct emc_table *timing,
+			  unsigned long state);
 int tegra_emc_dt_parse_pdata(struct platform_device *pdev,
 			     struct emc_table **tables,
 			     struct emc_table **derated_tables,
 			     int *num_entries);
+u32 tegra210_actual_osc_clocks(u32 in);
+u32 tegra210_apply_periodic_compensation_trimmer(struct emc_table *next_timing,
+						 u32 offset);
+void tegra210_dll_disable(struct tegra_emc *emc, int channel_mode);
+void tegra210_dll_enable(struct tegra_emc *emc, int channel_mode);
+u32 tegra210_dll_prelock(struct tegra_emc *emc, int dvfs_with_training,
+			 u32 clksrc);
+u32 tegra210_dvfs_power_ramp_down(struct tegra_emc *emc, u32 clk,
+				  int flip_backward);
+u32 tegra210_dvfs_power_ramp_up(struct tegra_emc *emc, u32 clk,
+				int flip_backward);
+void tegra210_update_emc_alt_timing(struct tegra_emc *emc,
+				    struct emc_table *current_timing);
+void tegra210_reset_dram_clktree_values(struct emc_table *table);
+void tegra210_start_periodic_compensation(struct tegra_emc *emc);
+int wait_for_update(struct tegra_emc *emc, u32 status_reg, u32 bit_mask,
+		    bool updated_state, int chan);
 
 #endif
diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/tegra210-emc.c
index 0c20bcd0e6de..26d0de0ab319 100644
--- a/drivers/memory/tegra/tegra210-emc.c
+++ b/drivers/memory/tegra/tegra210-emc.c
@@ -20,6 +20,37 @@
 #define TEGRA_EMC_TABLE_MAX_SIZE		16
 #define TEGRA210_EMC_SUSPEND_RATE		204000000
 
+#define EMC0_EMC_DATA_BRLSHFT_0_INDEX	2
+#define EMC1_EMC_DATA_BRLSHFT_0_INDEX	3
+#define EMC0_EMC_DATA_BRLSHFT_1_INDEX	4
+#define EMC1_EMC_DATA_BRLSHFT_1_INDEX	5
+
+#define TRIM_REG(chan, rank, reg, byte)					\
+	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
+	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
+	   next_timing->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##	\
+				 rank ## _ ## reg ## _INDEX]) >>	\
+	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
+	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
+	 +								\
+	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
+	    byte ## _DATA_BRLSHFT_MASK &				\
+	    next_timing->trim_perch_regs[EMC ## chan ##			\
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
+	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))	\
+
 enum TEGRA_EMC_SOURCE {
 	TEGRA_EMC_SRC_PLLM,
 	TEGRA_EMC_SRC_PLLC,
@@ -32,6 +63,14 @@ enum TEGRA_EMC_SOURCE {
 	TEGRA_EMC_SRC_COUNT,
 };
 
+enum {
+	TEGRA_DRAM_OVER_TEMP_NONE = 0,
+	TEGRA_DRAM_OVER_TEMP_REFRESH_X2,
+	TEGRA_DRAM_OVER_TEMP_REFRESH_X4,
+	TEGRA_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
+	TEGRA_DRAM_OVER_TEMP_MAX,
+};
+
 struct emc_sel {
 	struct clk *input;
 	u32 value;
@@ -76,6 +115,7 @@ static struct tegra_emc *tegra_emc;
 static DEFINE_SPINLOCK(emc_access_lock);
 static ktime_t clkchange_time;
 static int clkchange_delay = 100;
+unsigned long dram_over_temp_state = TEGRA_DRAM_OVER_TEMP_NONE;
 
 static void emc_train(struct timer_list *tmr);
 DEFINE_TIMER(emc_training_timer, emc_train);
@@ -102,11 +142,33 @@ static bool emc_suspend;
 static unsigned long emc_resume_rate;
 #endif
 
+inline void emc_writel(struct tegra_emc *emc, u32 val, unsigned long offset)
+{
+	writel(val, emc->emc_base + offset);
+}
+
 inline u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
 {
 	return readl(emc->emc_base + offset);
 }
 
+inline u32 emc1_readl(struct tegra_emc *emc, unsigned long offset)
+{
+	return readl(emc->emc1_base + offset);
+}
+
+inline void emc_writel_per_ch(struct tegra_emc *emc, u32 val, int type,
+			      unsigned long offset)
+{
+	switch (type) {
+	case REG_EMC:
+	case REG_EMC0:
+		return writel(val, emc->emc_base + offset);
+	case REG_EMC1:
+		return writel(val, emc->emc1_base + offset);
+	}
+}
+
 inline u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
 			    unsigned long offset)
 {
@@ -125,6 +187,14 @@ inline u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
 	return val;
 }
 
+inline void ccfifo_writel(struct tegra_emc *emc, u32 val, unsigned long addr,
+			  u32 delay)
+{
+	writel(val, emc->emc_base + EMC_CCFIFO_DATA);
+	writel((addr & 0xffff) | ((delay & 0x7fff) << 16) | (1 << 31),
+		emc->emc_base + EMC_CCFIFO_ADDR);
+}
+
 static inline u32 emc_src_val(u32 val)
 {
 	return (val & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
@@ -175,6 +245,16 @@ static void emc_set_clock(struct tegra_emc *emc, u32 clksrc)
 		emc_training_timer_stop();
 }
 
+static struct emc_table *emc_get_table(struct tegra_emc *emc,
+				unsigned long over_temp_state)
+{
+	if ((over_temp_state == TEGRA_DRAM_OVER_TEMP_THROTTLE) &&
+	    (emc->emc_table_derated != NULL))
+		return emc->emc_table_derated;
+	else
+		return emc->emc_table_normal;
+}
+
 static inline void emc_get_timing(struct tegra_emc *emc,
 				  struct emc_table *timing)
 {
@@ -223,6 +303,142 @@ static inline void emc_get_timing(struct tegra_emc *emc,
 	timing->rate = rate / 1000;
 }
 
+static void tegra210_change_dll_src(struct tegra_emc *emc,
+				    u32 clksrc)
+{
+
+	u32 out_enb_x;
+	u32 dll_setting = emc->next_timing->dll_clk_src;
+	u32 emc_clk_src;
+	u32 emc_clk_div;
+
+	out_enb_x = 0;
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
+	if (emc->next_timing->clk_out_enb_x_0_clk_enb_emc_dll)
+		tegra210_clk_emc_dll_enable(true);
+	else
+		tegra210_clk_emc_dll_enable(false);
+}
+
+void do_clock_change(struct tegra_emc *emc, u32 clksrc)
+{
+	int err;
+
+	mc_readl(emc->mc, MC_EMEM_ADR_CFG);
+	emc_readl(emc, EMC_INTSTATUS);
+
+	tegra210_clk_emc_update_setting(clksrc);
+
+	err = wait_for_update(emc, EMC_INTSTATUS,
+			      EMC_INTSTATUS_CLKCHANGE_COMPLETE, true, REG_EMC);
+	if (err) {
+		pr_err("%s: clock change completion error: %d", __func__, err);
+		WARN_ON(1);
+	}
+}
+
+struct emc_table *get_timing_from_freq(struct tegra_emc *emc,
+				       unsigned long rate)
+{
+	int i;
+
+	for (i = 0; i < emc->emc_table_size; i++)
+		if (emc->emc_table[i].rate == rate)
+			return &emc->emc_table[i];
+
+	return NULL;
+}
+
+int wait_for_update(struct tegra_emc *emc, u32 status_reg, u32 bit_mask,
+		    bool updated_state, int chan)
+{
+	int i, err = -ETIMEDOUT;
+	u32 reg;
+
+	for (i = 0; i < EMC_STATUS_UPDATE_TIMEOUT; i++) {
+		reg = emc_readl_per_ch(emc, chan, status_reg);
+		if (!!(reg & bit_mask) == updated_state) {
+			err = 0;
+			goto done;
+		}
+		udelay(1);
+	}
+
+done:
+	return err;
+}
+
+void emc_set_shadow_bypass(struct tegra_emc *emc, int set)
+{
+	u32 emc_dbg = emc_readl(emc, EMC_DBG);
+
+	if (set)
+		emc_writel(emc, emc_dbg | EMC_DBG_WRITE_MUX_ACTIVE, EMC_DBG);
+	else
+		emc_writel(emc, emc_dbg & ~EMC_DBG_WRITE_MUX_ACTIVE, EMC_DBG);
+}
+
+u32 get_dll_state(struct emc_table *next_timing)
+{
+	bool next_dll_enabled;
+
+	next_dll_enabled = !(next_timing->emc_emrs & 0x1);
+	if (next_dll_enabled)
+		return DLL_ON;
+	else
+		return DLL_OFF;
+}
+
+u32 div_o3(u32 a, u32 b)
+{
+	u32 result = a / b;
+
+	if ((b * result) < a)
+		return result + 1;
+	else
+		return result;
+}
+
+void emc_timing_update(struct tegra_emc *emc, int dual_chan)
+{
+	int err = 0;
+
+	emc_writel(emc, 0x1, EMC_TIMING_CONTROL);
+	err |= wait_for_update(emc, EMC_EMC_STATUS,
+			       EMC_EMC_STATUS_TIMING_UPDATE_STALLED, false,
+			       REG_EMC);
+	if (dual_chan)
+		err |= wait_for_update(emc, EMC_EMC_STATUS,
+				       EMC_EMC_STATUS_TIMING_UPDATE_STALLED,
+				       false, REG_EMC1);
+	if (err) {
+		pr_err("%s: timing update error: %d", __func__, err);
+		WARN_ON(1);
+	}
+}
+
 static void __emc_copy_table_params(struct emc_table *src,
 				    struct emc_table *dst, int flags)
 {
@@ -277,6 +493,29 @@ static void __emc_copy_table_params(struct emc_table *src,
 	}
 }
 
+void tegra210_update_emc_alt_timing(struct tegra_emc *emc,
+				    struct emc_table *current_timing)
+{
+	struct emc_table *current_table, *alt_timing;
+	int i;
+
+	if (!emc->emc_table_derated)
+		return;
+
+	current_table = emc_get_table(emc, dram_over_temp_state);
+	i = current_timing - current_table;
+
+	WARN_ON(i < 0);
+
+	if (dram_over_temp_state == TEGRA_DRAM_OVER_TEMP_THROTTLE)
+		alt_timing = &emc->emc_table_normal[i];
+	else
+		alt_timing = &emc->emc_table_derated[i];
+
+	__emc_copy_table_params(current_timing, alt_timing,
+				EMC_COPY_TABLE_PARAM_PERIODIC_FIELDS);
+}
+
 static void emc_copy_table_params(struct emc_table *src,
 				  struct emc_table *dst,
 				  int table_size,
@@ -288,6 +527,690 @@ static void emc_copy_table_params(struct emc_table *src,
 		__emc_copy_table_params(&src[i], &dst[i], flags);
 }
 
+u32 tegra210_actual_osc_clocks(u32 in)
+{
+	if (in < 0x40)
+		return in * 16;
+	else if (in < 0x80)
+		return 2048;
+	else if (in < 0xc0)
+		return 4096;
+	else
+		return 8192;
+}
+
+void tegra210_start_periodic_compensation(struct tegra_emc *emc)
+{
+	u32 mpc_req = 0x4b;
+
+	emc_writel(emc, mpc_req, EMC_MPC);
+	mpc_req = emc_readl(emc, EMC_MPC);
+}
+
+u32 tegra210_apply_periodic_compensation_trimmer(struct emc_table *next_timing,
+						 u32 offset)
+{
+	u32 i, temp = 0;
+	u32 next_timing_rate_mhz = next_timing->rate / 1000;
+	s32 tree_delta[4];
+	s32 tree_delta_taps[4];
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
+
+	switch (offset) {
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3:
+	case EMC_DATA_BRLSHFT_0:
+		tree_delta[0] = 128 *
+				(next_timing->current_dram_clktree_c0d0u0 -
+				 next_timing->trained_dram_clktree_c0d0u0);
+		tree_delta[1] = 128 *
+				(next_timing->current_dram_clktree_c0d0u1 -
+				 next_timing->trained_dram_clktree_c0d0u1);
+		tree_delta[2] = 128 *
+				(next_timing->current_dram_clktree_c1d0u0 -
+				 next_timing->trained_dram_clktree_c1d0u0);
+		tree_delta[3] = 128 *
+				(next_timing->current_dram_clktree_c1d0u1 -
+				 next_timing->trained_dram_clktree_c1d0u1);
+
+		tree_delta_taps[0] = (tree_delta[0] *
+				     (s32)next_timing_rate_mhz) / 1000000;
+		tree_delta_taps[1] = (tree_delta[1] *
+				     (s32)next_timing_rate_mhz) / 1000000;
+		tree_delta_taps[2] = (tree_delta[2] *
+				     (s32)next_timing_rate_mhz) / 1000000;
+		tree_delta_taps[3] = (tree_delta[3] *
+				     (s32)next_timing_rate_mhz) / 1000000;
+
+		for (i = 0; i < 4; i++) {
+			if ((tree_delta_taps[i] > next_timing->tree_margin) ||
+			    (tree_delta_taps[i] <
+			    (-1 * next_timing->tree_margin))) {
+				new[i * 2] = new[i * 2] + tree_delta_taps[i];
+				new[i * 2 + 1] = new[i * 2 + 1] +
+						 tree_delta_taps[i];
+			}
+		}
+
+		if (offset == EMC_DATA_BRLSHFT_0) {
+			for (i = 0; i < 8; i++)
+				new[i] = new[i] / 64;
+		} else {
+			for (i = 0; i < 8; i++)
+				new[i] = new[i] % 64;
+		}
+		break;
+
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2:
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3:
+	case EMC_DATA_BRLSHFT_1:
+		tree_delta[0] = 128 *
+				(next_timing->current_dram_clktree_c0d1u0 -
+				 next_timing->trained_dram_clktree_c0d1u0);
+		tree_delta[1] = 128 *
+				(next_timing->current_dram_clktree_c0d1u1 -
+				 next_timing->trained_dram_clktree_c0d1u1);
+		tree_delta[2] = 128 *
+				(next_timing->current_dram_clktree_c1d1u0 -
+				 next_timing->trained_dram_clktree_c1d1u0);
+		tree_delta[3] = 128 *
+				(next_timing->current_dram_clktree_c1d1u1 -
+				 next_timing->trained_dram_clktree_c1d1u1);
+
+		tree_delta_taps[0] = (tree_delta[0] *
+				     (s32)next_timing_rate_mhz) / 1000000;
+		tree_delta_taps[1] = (tree_delta[1] *
+				     (s32)next_timing_rate_mhz) / 1000000;
+		tree_delta_taps[2] = (tree_delta[2] *
+				     (s32)next_timing_rate_mhz) / 1000000;
+		tree_delta_taps[3] = (tree_delta[3] *
+				     (s32)next_timing_rate_mhz) / 1000000;
+
+		for (i = 0; i < 4; i++) {
+			if ((tree_delta_taps[i] > next_timing->tree_margin) ||
+			    (tree_delta_taps[i] <
+			     (-1 * next_timing->tree_margin))) {
+				new[8 + i * 2] = new[8 + i * 2] +
+						 tree_delta_taps[i];
+				new[8 + i * 2 + 1] = new[8 + i * 2 + 1] +
+						     tree_delta_taps[i];
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
+		break;
+	}
+
+	switch (offset) {
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0:
+		temp = CALC_TEMP(0, 0, 0, 1, 0);
+		break;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1:
+		temp = CALC_TEMP(0, 1, 2, 3, 2);
+		break;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2:
+		temp = CALC_TEMP(0, 2, 4, 5, 4);
+		break;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3:
+		temp = CALC_TEMP(0, 3, 6, 7, 6);
+		break;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0:
+		temp = CALC_TEMP(1, 0, 0, 1, 8);
+		break;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1:
+		temp = CALC_TEMP(1, 1, 2, 3, 10);
+		break;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2:
+		temp = CALC_TEMP(1, 2, 4, 5, 12);
+		break;
+	case EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3:
+		temp = CALC_TEMP(1, 3, 6, 7, 14);
+		break;
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
+	default:
+		break;
+	}
+
+	return temp;
+}
+
+u32 tegra210_dll_prelock(struct tegra_emc *emc, int dvfs_with_training,
+			 u32 clksrc)
+{
+	u32 emc_dig_dll_status;
+	u32 dll_locked;
+	u32 dll_out;
+	u32 emc_cfg_dig_dll;
+	u32 emc_dll_cfg_0;
+	u32 emc_dll_cfg_1;
+	u32 ddllcal_ctrl_start_trim_val;
+	u32 dll_en;
+	u32 dual_channel_lpddr4_case;
+	u32 dll_priv_updated;
+
+	dual_channel_lpddr4_case =
+	      !!(emc_readl(emc, EMC_FBIO_CFG7) & EMC_FBIO_CFG7_CH1_ENABLE) &
+	      !!(emc_readl(emc, EMC_FBIO_CFG7) & EMC_FBIO_CFG7_CH0_ENABLE);
+
+	emc_dig_dll_status = 0;
+	dll_locked = 0;
+	dll_out = 0;
+	emc_cfg_dig_dll = 0;
+	emc_dll_cfg_0 = 0;
+	emc_dll_cfg_1 = 0;
+	ddllcal_ctrl_start_trim_val = 0;
+	dll_en = 0;
+
+	emc_cfg_dig_dll = emc_readl(emc, EMC_CFG_DIG_DLL) &
+			  ~EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_MASK;
+	emc_cfg_dig_dll |= (3 << EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_SHIFT);
+	emc_cfg_dig_dll &= ~EMC_CFG_DIG_DLL_CFG_DLL_EN;
+	emc_cfg_dig_dll &= ~EMC_CFG_DIG_DLL_CFG_DLL_MODE_MASK;
+	emc_cfg_dig_dll |= (3 << EMC_CFG_DIG_DLL_CFG_DLL_MODE_SHIFT);
+	emc_cfg_dig_dll |= EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_TRAFFIC;
+	emc_cfg_dig_dll &= ~EMC_CFG_DIG_DLL_CFG_DLL_STALL_RW_UNTIL_LOCK;
+	emc_cfg_dig_dll &= ~EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_UNTIL_LOCK;
+
+	emc_writel(emc, emc_cfg_dig_dll, EMC_CFG_DIG_DLL);
+	emc_writel(emc, 1, EMC_TIMING_CONTROL);
+
+	wait_for_update(emc, EMC_EMC_STATUS,
+			EMC_EMC_STATUS_TIMING_UPDATE_STALLED, 0, REG_EMC);
+	if (dual_channel_lpddr4_case)
+		wait_for_update(emc, EMC_EMC_STATUS,
+				EMC_EMC_STATUS_TIMING_UPDATE_STALLED,
+				0, REG_EMC1);
+
+	do {
+		emc_cfg_dig_dll = emc_readl(emc, EMC_CFG_DIG_DLL);
+		dll_en = emc_cfg_dig_dll & EMC_CFG_DIG_DLL_CFG_DLL_EN;
+	} while (dll_en == 1);
+
+	if (dual_channel_lpddr4_case) {
+		do {
+			emc_cfg_dig_dll = emc1_readl(emc, EMC_CFG_DIG_DLL);
+			dll_en = emc_cfg_dig_dll & EMC_CFG_DIG_DLL_CFG_DLL_EN;
+		} while (dll_en == 1);
+	}
+
+	emc_dll_cfg_0 = emc->next_timing->burst_regs[EMC_DLL_CFG_0_INDEX];
+
+	emc_writel(emc, emc_dll_cfg_0, EMC_DLL_CFG_0);
+
+	if (emc->next_timing->rate >= 400000
+		&& emc->next_timing->rate < 600000)
+		ddllcal_ctrl_start_trim_val = 150;
+	else if (emc->next_timing->rate >= 600000
+		&& emc->next_timing->rate < 800000)
+		ddllcal_ctrl_start_trim_val = 100;
+	else if (emc->next_timing->rate >= 800000
+		&& emc->next_timing->rate < 1000000)
+		ddllcal_ctrl_start_trim_val = 70;
+	else if (emc->next_timing->rate >= 1000000
+		&& emc->next_timing->rate < 1200000)
+		ddllcal_ctrl_start_trim_val = 30;
+	else
+		ddllcal_ctrl_start_trim_val = 20;
+
+	emc_dll_cfg_1 = emc_readl(emc, EMC_DLL_CFG_1);
+	emc_dll_cfg_1 &= EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_MASK;
+	emc_dll_cfg_1 |= ddllcal_ctrl_start_trim_val;
+	emc_writel(emc, emc_dll_cfg_1, EMC_DLL_CFG_1);
+
+	tegra210_change_dll_src(emc, clksrc);
+
+	emc_cfg_dig_dll = emc_readl(emc, EMC_CFG_DIG_DLL);
+	emc_cfg_dig_dll |= EMC_CFG_DIG_DLL_CFG_DLL_EN;
+	emc_writel(emc, emc_cfg_dig_dll, EMC_CFG_DIG_DLL);
+
+	emc_timing_update(emc, dual_channel_lpddr4_case ?
+			  DUAL_CHANNEL : SINGLE_CHANNEL);
+
+	do {
+		emc_cfg_dig_dll = emc_readl(emc, EMC_CFG_DIG_DLL);
+		dll_en = emc_cfg_dig_dll & EMC_CFG_DIG_DLL_CFG_DLL_EN;
+	} while (dll_en == 0);
+
+	if (dual_channel_lpddr4_case) {
+		do {
+			emc_cfg_dig_dll = emc1_readl(emc, EMC_CFG_DIG_DLL);
+			dll_en = emc_cfg_dig_dll & EMC_CFG_DIG_DLL_CFG_DLL_EN;
+		} while (dll_en == 0);
+	}
+
+	do {
+		emc_dig_dll_status = emc_readl(emc, EMC_DIG_DLL_STATUS);
+		dll_locked = emc_dig_dll_status & EMC_DIG_DLL_STATUS_DLL_LOCK;
+		dll_priv_updated = emc_dig_dll_status &
+				   EMC_DIG_DLL_STATUS_DLL_PRIV_UPDATED;
+	} while (!dll_locked || !dll_priv_updated);
+
+	emc_dig_dll_status = emc_readl(emc, EMC_DIG_DLL_STATUS);
+	return emc_dig_dll_status & EMC_DIG_DLL_STATUS_DLL_OUT_MASK;
+}
+
+u32 tegra210_dvfs_power_ramp_up(struct tegra_emc *emc, u32 clk,
+				int flip_backward)
+{
+	u32 pmacro_cmd_pad;
+	u32 pmacro_dq_pad;
+	u32 pmacro_rfu1;
+	u32 pmacro_cfg5;
+	u32 pmacro_common_tx;
+	u32 ramp_up_wait = 0;
+
+	if (flip_backward) {
+		pmacro_cmd_pad   = emc->current_timing->burst_regs[
+					EMC_PMACRO_CMD_PAD_TX_CTRL_INDEX];
+		pmacro_dq_pad    = emc->current_timing->burst_regs[
+					EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
+		pmacro_rfu1      = emc->current_timing->burst_regs[
+					EMC_PMACRO_BRICK_CTRL_RFU1_INDEX];
+		pmacro_cfg5      = emc->current_timing->burst_regs[
+					EMC_FBIO_CFG5_INDEX];
+		pmacro_common_tx = emc->current_timing->burst_regs[
+					EMC_PMACRO_COMMON_PAD_TX_CTRL_INDEX];
+	} else {
+		pmacro_cmd_pad   = emc->next_timing->burst_regs[
+					EMC_PMACRO_CMD_PAD_TX_CTRL_INDEX];
+		pmacro_dq_pad    = emc->next_timing->burst_regs[
+					EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
+		pmacro_rfu1      = emc->next_timing->burst_regs[
+					EMC_PMACRO_BRICK_CTRL_RFU1_INDEX];
+		pmacro_cfg5      = emc->next_timing->burst_regs[
+					EMC_FBIO_CFG5_INDEX];
+		pmacro_common_tx = emc->next_timing->burst_regs[
+					EMC_PMACRO_COMMON_PAD_TX_CTRL_INDEX];
+	}
+	pmacro_cmd_pad |= EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON;
+
+	if (clk < 1000000 / DVFS_FGCG_MID_SPEED_THRESHOLD) {
+		ccfifo_writel(emc, pmacro_common_tx & 0xa,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, 0);
+		ccfifo_writel(emc, pmacro_common_tx & 0xf,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL,
+			      (100000 / clk) + 1);
+		ramp_up_wait += 100000;
+	} else {
+		ccfifo_writel(emc, pmacro_common_tx | 0x8,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, 0);
+	}
+
+	if (clk < 1000000 / DVFS_FGCG_HIGH_SPEED_THRESHOLD) {
+		if (clk < 1000000 / IOBRICK_DCC_THRESHOLD) {
+			pmacro_cmd_pad |=
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC;
+			pmacro_cmd_pad &=
+				~(EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC);
+			ccfifo_writel(emc, pmacro_cmd_pad,
+				      EMC_PMACRO_CMD_PAD_TX_CTRL,
+				      (100000 / clk) + 1);
+			ramp_up_wait += 100000;
+
+			pmacro_dq_pad |=
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC;
+			pmacro_dq_pad &=
+			       ~(EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+				 EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC);
+			ccfifo_writel(emc, pmacro_dq_pad,
+				      EMC_PMACRO_DATA_PAD_TX_CTRL, 0);
+			ccfifo_writel(emc, pmacro_rfu1 & 0xfe40fe40,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		} else {
+			ccfifo_writel(emc, pmacro_rfu1 & 0xfe40fe40,
+				      EMC_PMACRO_BRICK_CTRL_RFU1,
+				      (100000 / clk) + 1);
+			ramp_up_wait += 100000;
+		}
+
+		ccfifo_writel(emc, pmacro_rfu1 & 0xfeedfeed,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, (100000 / clk) + 1);
+		ramp_up_wait += 100000;
+
+		if (clk < 1000000 / IOBRICK_DCC_THRESHOLD) {
+			pmacro_cmd_pad |=
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC;
+			ccfifo_writel(emc, pmacro_cmd_pad,
+				      EMC_PMACRO_CMD_PAD_TX_CTRL,
+				      (100000 / clk) + 1);
+			ramp_up_wait += 100000;
+
+			pmacro_dq_pad |=
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC;
+			ccfifo_writel(emc, pmacro_dq_pad,
+				      EMC_PMACRO_DATA_PAD_TX_CTRL, 0);
+			ccfifo_writel(emc, pmacro_rfu1,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		} else {
+			ccfifo_writel(emc, pmacro_rfu1,
+				      EMC_PMACRO_BRICK_CTRL_RFU1,
+				      (100000 / clk) + 1);
+			ramp_up_wait += 100000;
+		}
+
+		ccfifo_writel(emc, pmacro_cfg5 & ~EMC_FBIO_CFG5_CMD_TX_DIS,
+			      EMC_FBIO_CFG5, (100000 / clk) + 10);
+		ramp_up_wait += 100000 + (10 * clk);
+	} else if (clk < 1000000 / DVFS_FGCG_MID_SPEED_THRESHOLD) {
+		ccfifo_writel(emc, pmacro_rfu1 | 0x06000600,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, (100000 / clk) + 1);
+		ccfifo_writel(emc, pmacro_cfg5 & ~EMC_FBIO_CFG5_CMD_TX_DIS,
+			      EMC_FBIO_CFG5, (100000 / clk) + 10);
+		ramp_up_wait += 100000 + 10 * clk;
+	} else {
+		ccfifo_writel(emc, pmacro_rfu1 | 0x00000600,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		ccfifo_writel(emc, pmacro_cfg5 & ~EMC_FBIO_CFG5_CMD_TX_DIS,
+			      EMC_FBIO_CFG5, 12);
+		ramp_up_wait += 12 * clk;
+	}
+
+	pmacro_cmd_pad &= ~EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON;
+	ccfifo_writel(emc, pmacro_cmd_pad, EMC_PMACRO_CMD_PAD_TX_CTRL, 5);
+
+	return ramp_up_wait;
+}
+
+u32 tegra210_dvfs_power_ramp_down(struct tegra_emc *emc, u32 clk,
+				  int flip_backward)
+{
+	u32 ramp_down_wait = 0;
+	u32 pmacro_cmd_pad;
+	u32 pmacro_dq_pad;
+	u32 pmacro_rfu1;
+	u32 pmacro_cfg5;
+	u32 pmacro_common_tx;
+	u32 seq_wait;
+
+	if (flip_backward) {
+		pmacro_cmd_pad   = emc->next_timing->burst_regs[
+					EMC_PMACRO_CMD_PAD_TX_CTRL_INDEX];
+		pmacro_dq_pad    = emc->next_timing->burst_regs[
+					EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
+		pmacro_rfu1      = emc->next_timing->burst_regs[
+					EMC_PMACRO_BRICK_CTRL_RFU1_INDEX];
+		pmacro_cfg5      = emc->next_timing->burst_regs[
+					EMC_FBIO_CFG5_INDEX];
+		pmacro_common_tx = emc->next_timing->burst_regs[
+					EMC_PMACRO_COMMON_PAD_TX_CTRL_INDEX];
+	} else {
+		pmacro_cmd_pad   = emc->current_timing->burst_regs[
+					EMC_PMACRO_CMD_PAD_TX_CTRL_INDEX];
+		pmacro_dq_pad    = emc->current_timing->burst_regs[
+					EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
+		pmacro_rfu1      = emc->current_timing->burst_regs[
+					EMC_PMACRO_BRICK_CTRL_RFU1_INDEX];
+		pmacro_cfg5      = emc->current_timing->burst_regs[
+					EMC_FBIO_CFG5_INDEX];
+		pmacro_common_tx = emc->current_timing->burst_regs[
+					EMC_PMACRO_COMMON_PAD_TX_CTRL_INDEX];
+	}
+
+	pmacro_cmd_pad |= EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON;
+
+	ccfifo_writel(emc, pmacro_cmd_pad, EMC_PMACRO_CMD_PAD_TX_CTRL, 0);
+	ccfifo_writel(emc, pmacro_cfg5 | EMC_FBIO_CFG5_CMD_TX_DIS,
+		      EMC_FBIO_CFG5, 12);
+	ramp_down_wait = 12 * clk;
+
+	seq_wait = (100000 / clk) + 1;
+
+	if (clk < (1000000 / DVFS_FGCG_HIGH_SPEED_THRESHOLD)) {
+		if (clk < (1000000 / IOBRICK_DCC_THRESHOLD)) {
+			pmacro_cmd_pad &=
+				~(EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC);
+			pmacro_cmd_pad |=
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC;
+			ccfifo_writel(emc, pmacro_cmd_pad,
+				      EMC_PMACRO_CMD_PAD_TX_CTRL, seq_wait);
+			ramp_down_wait += 100000;
+
+			pmacro_dq_pad &=
+			      ~(EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC);
+			pmacro_dq_pad |=
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC;
+			ccfifo_writel(emc, pmacro_dq_pad,
+				      EMC_PMACRO_DATA_PAD_TX_CTRL, 0);
+			ccfifo_writel(emc, pmacro_rfu1 & ~0x01120112,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		} else {
+			ccfifo_writel(emc, pmacro_rfu1 & ~0x01120112,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, seq_wait);
+			ramp_down_wait += 100000;
+		}
+
+		ccfifo_writel(emc, pmacro_rfu1 & ~0x01bf01bf,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, seq_wait);
+		ramp_down_wait += 100000;
+
+		if (clk < (1000000 / IOBRICK_DCC_THRESHOLD)) {
+			pmacro_cmd_pad &=
+				~(EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
+				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC);
+			ccfifo_writel(emc, pmacro_cmd_pad,
+				      EMC_PMACRO_CMD_PAD_TX_CTRL, seq_wait);
+			ramp_down_wait += 100000;
+
+			pmacro_dq_pad &=
+			      ~(EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
+				EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC);
+			ccfifo_writel(emc, pmacro_dq_pad,
+				      EMC_PMACRO_DATA_PAD_TX_CTRL, 0);
+			ccfifo_writel(emc, pmacro_rfu1 & ~0x07ff07ff,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, 0);
+		} else {
+			ccfifo_writel(emc, pmacro_rfu1 & ~0x07ff07ff,
+				      EMC_PMACRO_BRICK_CTRL_RFU1, seq_wait);
+			ramp_down_wait += 100000;
+		}
+	} else {
+		ccfifo_writel(emc, pmacro_rfu1 & ~0xffff07ff,
+			      EMC_PMACRO_BRICK_CTRL_RFU1, seq_wait + 19);
+		ramp_down_wait += 100000 + (20 * clk);
+	}
+
+	if (clk < (1000000 / DVFS_FGCG_MID_SPEED_THRESHOLD)) {
+		ramp_down_wait += 100000;
+		ccfifo_writel(emc, pmacro_common_tx & ~0x5,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, seq_wait);
+		ramp_down_wait += 100000;
+		ccfifo_writel(emc, pmacro_common_tx & ~0xf,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, seq_wait);
+		ramp_down_wait += 100000;
+		ccfifo_writel(emc, 0, 0, seq_wait);
+		ramp_down_wait += 100000;
+	} else {
+		ccfifo_writel(emc, pmacro_common_tx & ~0xf,
+			      EMC_PMACRO_COMMON_PAD_TX_CTRL, seq_wait);
+	}
+
+	return ramp_down_wait;
+}
+
+void tegra210_reset_dram_clktree_values(struct emc_table *table)
+{
+	#define __RESET_CLKTREE(TBL, C, D, U)				\
+	(TBL->current_dram_clktree_c ## C ## d ## D ## u ## U =		\
+	TBL->trained_dram_clktree_c ## C ## d ## D ## u ## U)
+
+	__RESET_CLKTREE(table, 0, 0, 0);
+	__RESET_CLKTREE(table, 0, 0, 1);
+	__RESET_CLKTREE(table, 1, 0, 0);
+	__RESET_CLKTREE(table, 1, 0, 1);
+	__RESET_CLKTREE(table, 1, 1, 0);
+	__RESET_CLKTREE(table, 1, 1, 1);
+}
+
+static void update_dll_control(struct tegra_emc *emc, u32 emc_cfg_dig_dll,
+			       int channel_mode, bool updated_state)
+{
+	emc_writel(emc, emc_cfg_dig_dll, EMC_CFG_DIG_DLL);
+	emc_timing_update(emc, channel_mode);
+
+	wait_for_update(emc, EMC_CFG_DIG_DLL, EMC_CFG_DIG_DLL_CFG_DLL_EN,
+			updated_state, REG_EMC);
+	if (channel_mode == DUAL_CHANNEL)
+		wait_for_update(emc, EMC_CFG_DIG_DLL,
+				EMC_CFG_DIG_DLL_CFG_DLL_EN,
+				updated_state, REG_EMC1);
+}
+
+void tegra210_dll_disable(struct tegra_emc *emc, int channel_mode)
+{
+	u32 emc_cfg_dig_dll;
+
+	emc_cfg_dig_dll = emc_readl(emc, EMC_CFG_DIG_DLL);
+	emc_cfg_dig_dll &= ~EMC_CFG_DIG_DLL_CFG_DLL_EN;
+
+	update_dll_control(emc, emc_cfg_dig_dll, channel_mode, false);
+}
+
+void tegra210_dll_enable(struct tegra_emc *emc, int channel_mode)
+{
+	u32 emc_cfg_dig_dll;
+
+	emc_cfg_dig_dll = emc_readl(emc, EMC_CFG_DIG_DLL);
+	emc_cfg_dig_dll |= EMC_CFG_DIG_DLL_CFG_DLL_EN;
+
+	update_dll_control(emc, emc_cfg_dig_dll, channel_mode, true);
+}
+
+void set_over_temp_timing(struct tegra_emc *emc, struct emc_table *timing,
+			  unsigned long state)
+{
+#define REFRESH_X2      1
+#define REFRESH_X4      2
+#define REFRESH_SPEEDUP(val, speedup)					\
+		(val = ((val) & 0xFFFF0000) | (((val) & 0xFFFF) >> (speedup)))
+
+	u32 ref = timing->burst_regs[EMC_REFRESH_INDEX];
+	u32 pre_ref = timing->burst_regs[EMC_PRE_REFRESH_REQ_CNT_INDEX];
+	u32 dsr_cntrl = timing->burst_regs[EMC_DYN_SELF_REF_CONTROL_INDEX];
+
+	switch (state) {
+	case TEGRA_DRAM_OVER_TEMP_NONE:
+	case TEGRA_DRAM_OVER_TEMP_THROTTLE:
+		break;
+	case TEGRA_DRAM_OVER_TEMP_REFRESH_X2:
+		REFRESH_SPEEDUP(ref, REFRESH_X2);
+		REFRESH_SPEEDUP(pre_ref, REFRESH_X2);
+		REFRESH_SPEEDUP(dsr_cntrl, REFRESH_X2);
+		break;
+	case TEGRA_DRAM_OVER_TEMP_REFRESH_X4:
+		REFRESH_SPEEDUP(ref, REFRESH_X4);
+		REFRESH_SPEEDUP(pre_ref, REFRESH_X4);
+		REFRESH_SPEEDUP(dsr_cntrl, REFRESH_X4);
+		break;
+	default:
+	WARN(1, "%s: Failed to set dram over temp state %lu\n",
+		__func__, state);
+	return;
+	}
+
+	emc_writel(emc, ref, burst_regs_off[EMC_REFRESH_INDEX]);
+	emc_writel(emc, pre_ref, burst_regs_off[EMC_PRE_REFRESH_REQ_CNT_INDEX]);
+	emc_writel(emc, dsr_cntrl,
+		   burst_regs_off[EMC_DYN_SELF_REF_CONTROL_INDEX]);
+}
+
 static void emc_last_stats_update(int last_sel)
 {
 	unsigned long flags;
-- 
2.21.0
