From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/2] irqchip/tegra: Remove everything related to COP
Date: Sun, 11 Aug 2019 21:30:43 +0300
Message-ID: <20190811183044.13925-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no point in touching of the COP (ARM7TDMI auxiliary boot/firmware
CPU) because COP's interrupts should be related only to an old multimedia
firmware that is not applicable to the upstream kernel. Hence let's remove
everything related to the COP, for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/irqchip/irq-tegra.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index e1f771c72fc4..14dcacc2ad38 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -33,11 +33,6 @@
 #define ICTLR_CPU_IER_CLR	0x28
 #define ICTLR_CPU_IEP_CLASS	0x2C
 
-#define ICTLR_COP_IER		0x30
-#define ICTLR_COP_IER_SET	0x34
-#define ICTLR_COP_IER_CLR	0x38
-#define ICTLR_COP_IEP_CLASS	0x3c
-
 #define TEGRA_MAX_NUM_ICTLRS	6
 
 static unsigned int num_ictlrs;
@@ -68,8 +63,6 @@ static const struct of_device_id ictlr_matches[] = {
 struct tegra_ictlr_info {
 	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
 #ifdef CONFIG_PM_SLEEP
-	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
-	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
 	u32 cpu_ier[TEGRA_MAX_NUM_ICTLRS];
 	u32 cpu_iep[TEGRA_MAX_NUM_ICTLRS];
 
@@ -144,11 +137,6 @@ static int tegra_ictlr_suspend(void)
 		/* Save interrupt state */
 		lic->cpu_ier[i] = readl_relaxed(ictlr + ICTLR_CPU_IER);
 		lic->cpu_iep[i] = readl_relaxed(ictlr + ICTLR_CPU_IEP_CLASS);
-		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
-		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
-
-		/* Disable COP interrupts */
-		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
 
 		/* Disable CPU interrupts */
 		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
@@ -175,11 +163,6 @@ static void tegra_ictlr_resume(void)
 		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
 		writel_relaxed(lic->cpu_ier[i],
 			       ictlr + ICTLR_CPU_IER_SET);
-		writel_relaxed(lic->cop_iep[i],
-			       ictlr + ICTLR_COP_IEP_CLASS);
-		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
-		writel_relaxed(lic->cop_ier[i],
-			       ictlr + ICTLR_COP_IER_SET);
 	}
 	local_irq_restore(flags);
 }
-- 
2.22.0
