From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 1/2] memory: tegra20-emc: Poll EMC-CaR handshake instead of waiting for interrupt
Date: Thu, 19 Mar 2020 22:36:47 +0300
Message-ID: <20200319193648.8810-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The memory clock-rate change could be running on a non-boot CPU, while the
boot CPU handles the EMC interrupt. This introduces an unnecessary latency
since boot CPU should handle the interrupt and then notify the sibling CPU
about clock-rate change completion. In some rare cases boot CPU could be
in uninterruptible state for a significant time (like in a case of KASAN +
NFS root), it could get to the point that completion timeouts before boot
CPU gets a chance to handle interrupt. The solution is to get rid of the
completion and replace it with interrupt-status polling.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/memory/tegra/tegra20-emc.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index f74dd417c874..60b048ae9982 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -7,11 +7,11 @@
 
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
-#include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -144,7 +144,6 @@ struct emc_timing {
 
 struct tegra_emc {
 	struct device *dev;
-	struct completion clk_handshake_complete;
 	struct notifier_block clk_nb;
 	struct clk *clk;
 	void __iomem *regs;
@@ -162,17 +161,13 @@ struct tegra_emc {
 static irqreturn_t tegra_emc_isr(int irq, void *data)
 {
 	struct tegra_emc *emc = data;
-	u32 intmask = EMC_REFRESH_OVERFLOW_INT | EMC_CLKCHANGE_COMPLETE_INT;
+	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
 	u32 status;
 
 	status = readl_relaxed(emc->regs + EMC_INTSTATUS) & intmask;
 	if (!status)
 		return IRQ_NONE;
 
-	/* notify about EMC-CAR handshake completion */
-	if (status & EMC_CLKCHANGE_COMPLETE_INT)
-		complete(&emc->clk_handshake_complete);
-
 	/* notify about HW problem */
 	if (status & EMC_REFRESH_OVERFLOW_INT)
 		dev_err_ratelimited(emc->dev,
@@ -224,14 +219,13 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 	/* wait until programming has settled */
 	readl_relaxed(emc->regs + emc_timing_registers[i - 1]);
 
-	reinit_completion(&emc->clk_handshake_complete);
-
 	return 0;
 }
 
 static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 {
-	unsigned long timeout;
+	u32 val;
+	int err;
 
 	dev_dbg(emc->dev, "%s: flush %d\n", __func__, flush);
 
@@ -242,11 +236,12 @@ static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 		return 0;
 	}
 
-	timeout = wait_for_completion_timeout(&emc->clk_handshake_complete,
-					      msecs_to_jiffies(100));
-	if (timeout == 0) {
-		dev_err(emc->dev, "EMC-CAR handshake failed\n");
-		return -EIO;
+	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_INTSTATUS, val,
+						val & EMC_CLKCHANGE_COMPLETE_INT,
+						1, 100);
+	if (err) {
+		dev_err(emc->dev, "emc-car handshake timeout: %d\n", err);
+		return err;
 	}
 
 	return 0;
@@ -412,7 +407,7 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 
 static int emc_setup_hw(struct tegra_emc *emc)
 {
-	u32 intmask = EMC_REFRESH_OVERFLOW_INT | EMC_CLKCHANGE_COMPLETE_INT;
+	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
 	u32 emc_cfg, emc_dbg;
 
 	emc_cfg = readl_relaxed(emc->regs + EMC_CFG_2);
@@ -686,7 +681,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	init_completion(&emc->clk_handshake_complete);
 	emc->clk_nb.notifier_call = tegra_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
-- 
2.25.1
