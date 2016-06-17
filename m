From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V8 1/3] soc/tegra: pmc: Use BIT macro for register field definition
Date: Fri, 17 Jun 2016 18:36:12 +0530
Message-ID: <1466168774-13707-2-git-send-email-ldewangan@nvidia.com>
References: <1466168774-13707-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466168774-13707-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use BIT macro for register field definition and make constant as U
when using in shift operator like (3 << 30) to (3U << 30)

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Changes from V1:
- Remove the indenting of line which is not for BIT macro usage.
Changes from V2:
- None

Changes from V3:
- None

Changes from V4:
- Collected ack from Jon.

Changes from V5/V6:
- None

Changes from V7:
- Rebase on next-20160617
---
 drivers/soc/tegra/pmc.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index d135169..6b61ec6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -45,29 +45,29 @@
 #include <soc/tegra/pmc.h>
 
 #define PMC_CNTRL			0x0
-#define  PMC_CNTRL_SYSCLK_POLARITY	(1 << 10)  /* sys clk polarity */
-#define  PMC_CNTRL_SYSCLK_OE		(1 << 11)  /* system clock enable */
-#define  PMC_CNTRL_SIDE_EFFECT_LP0	(1 << 14)  /* LP0 when CPU pwr gated */
-#define  PMC_CNTRL_CPU_PWRREQ_POLARITY	(1 << 15)  /* CPU pwr req polarity */
-#define  PMC_CNTRL_CPU_PWRREQ_OE	(1 << 16)  /* CPU pwr req enable */
-#define  PMC_CNTRL_INTR_POLARITY	(1 << 17)  /* inverts INTR polarity */
-#define  PMC_CNTRL_MAIN_RST		(1 <<  4)
+#define PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
+#define PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
+#define PMC_CNTRL_SIDE_EFFECT_LP0	BIT(14) /* LP0 when CPU pwr gated */
+#define PMC_CNTRL_CPU_PWRREQ_POLARITY	BIT(15) /* CPU pwr req polarity */
+#define PMC_CNTRL_CPU_PWRREQ_OE		BIT(16) /* CPU pwr req enable */
+#define PMC_CNTRL_INTR_POLARITY		BIT(17)/* inverts INTR polarity */
+#define  PMC_CNTRL_MAIN_RST		BIT(4)
 
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
@@ -78,8 +78,8 @@
 #define PMC_SCRATCH41			0x140
 
 #define PMC_SENSOR_CTRL			0x1b0
-#define PMC_SENSOR_CTRL_SCRATCH_WRITE	(1 << 2)
-#define PMC_SENSOR_CTRL_ENABLE_RST	(1 << 1)
+#define PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
+#define PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
 
 #define PMC_RST_STATUS			0x1b4
 #define  PMC_RST_STATUS_POR		0
@@ -90,10 +90,10 @@
 #define  PMC_RST_STATUS_AOTAG		5
 
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
@@ -105,10 +105,10 @@
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
