From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V6 1/3] soc/tegra: pmc: Use BIT macro for register field definition
Date: Fri, 20 May 2016 17:29:22 +0530
Message-ID: <1463745564-19297-2-git-send-email-ldewangan@nvidia.com>
References: <1463745564-19297-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463745564-19297-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, jonathanh@nvidia.com
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use BIT macro for register field definition and make constant as U
when using in shift operator like (3 << 30) to (3U << 30)

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

---
Changes from V1:
- Remove the indenting of line which is not for BIT macro usage.
Changes from V2:
- None

Changes from V3:
- None

Changes from V4:
- Collected ack from Jon.

Changes from V3:
- None
---
 drivers/soc/tegra/pmc.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index bb17345..2c3f1f9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -45,28 +45,28 @@
 #include <soc/tegra/pmc.h>
 
 #define PMC_CNTRL			0x0
-#define  PMC_CNTRL_SYSCLK_POLARITY	(1 << 10)  /* sys clk polarity */
-#define  PMC_CNTRL_SYSCLK_OE		(1 << 11)  /* system clock enable */
-#define  PMC_CNTRL_SIDE_EFFECT_LP0	(1 << 14)  /* LP0 when CPU pwr gated */
-#define  PMC_CNTRL_CPU_PWRREQ_POLARITY	(1 << 15)  /* CPU pwr req polarity */
-#define  PMC_CNTRL_CPU_PWRREQ_OE	(1 << 16)  /* CPU pwr req enable */
-#define  PMC_CNTRL_INTR_POLARITY	(1 << 17)  /* inverts INTR polarity */
+#define PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
+#define PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
+#define PMC_CNTRL_SIDE_EFFECT_LP0	BIT(14) /* LP0 when CPU pwr gated */
+#define PMC_CNTRL_CPU_PWRREQ_POLARITY	BIT(15) /* CPU pwr req polarity */
+#define PMC_CNTRL_CPU_PWRREQ_OE		BIT(16) /* CPU pwr req enable */
+#define PMC_CNTRL_INTR_POLARITY		BIT(17)/* inverts INTR polarity */
 
 #define DPD_SAMPLE			0x020
-#define  DPD_SAMPLE_ENABLE		(1 << 0)
-#define  DPD_SAMPLE_DISABLE		(0 << 0)
+#define DPD_SAMPLE_ENABLE		BIT(0)
+#define DPD_SAMPLE_DISABLE		(0 << 0)
 
 #define PWRGATE_TOGGLE			0x30
-#define  PWRGATE_TOGGLE_START		(1 << 8)
+#define PWRGATE_TOGGLE_START		BIT(8)
 
 #define REMOVE_CLAMPING			0x34
 
 #define PWRGATE_STATUS			0x38
 
 #define PMC_SCRATCH0			0x50
-#define  PMC_SCRATCH0_MODE_RECOVERY	(1 << 31)
-#define  PMC_SCRATCH0_MODE_BOOTLOADER	(1 << 30)
-#define  PMC_SCRATCH0_MODE_RCM		(1 << 1)
+#define PMC_SCRATCH0_MODE_RECOVERY	BIT(31)
+#define PMC_SCRATCH0_MODE_BOOTLOADER	BIT(30)
+#define PMC_SCRATCH0_MODE_RCM		BIT(1)
 #define  PMC_SCRATCH0_MODE_MASK		(PMC_SCRATCH0_MODE_RECOVERY | \
 					 PMC_SCRATCH0_MODE_BOOTLOADER | \
 					 PMC_SCRATCH0_MODE_RCM)
@@ -77,14 +77,14 @@
 #define PMC_SCRATCH41			0x140
 
 #define PMC_SENSOR_CTRL			0x1b0
-#define PMC_SENSOR_CTRL_SCRATCH_WRITE	(1 << 2)
-#define PMC_SENSOR_CTRL_ENABLE_RST	(1 << 1)
+#define PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
+#define PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
 
 #define IO_DPD_REQ			0x1b8
-#define  IO_DPD_REQ_CODE_IDLE		(0 << 30)
-#define  IO_DPD_REQ_CODE_OFF		(1 << 30)
-#define  IO_DPD_REQ_CODE_ON		(2 << 30)
-#define  IO_DPD_REQ_CODE_MASK		(3 << 30)
+#define IO_DPD_REQ_CODE_IDLE		(0 << 30)
+#define IO_DPD_REQ_CODE_OFF		(1U << 30)
+#define IO_DPD_REQ_CODE_ON		(2U << 30)
+#define IO_DPD_REQ_CODE_MASK		(3U << 30)
 
 #define IO_DPD_STATUS			0x1bc
 #define IO_DPD2_REQ			0x1c0
@@ -96,10 +96,10 @@
 #define PMC_SCRATCH54_ADDR_SHIFT	0
 
 #define PMC_SCRATCH55			0x25c
-#define PMC_SCRATCH55_RESET_TEGRA	(1 << 31)
+#define PMC_SCRATCH55_RESET_TEGRA	BIT(31)
 #define PMC_SCRATCH55_CNTRL_ID_SHIFT	27
 #define PMC_SCRATCH55_PINMUX_SHIFT	24
-#define PMC_SCRATCH55_16BITOP		(1 << 15)
+#define PMC_SCRATCH55_16BITOP		BIT(15)
 #define PMC_SCRATCH55_CHECKSUM_SHIFT	16
 #define PMC_SCRATCH55_I2CSLV1_SHIFT	0
 
-- 
2.1.4
