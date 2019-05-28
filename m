From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V2 01/12] irqchip: tegra: do not disable COP IRQ during suspend
Date: Tue, 28 May 2019 16:08:45 -0700
Message-ID: <1559084936-4610-2-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
sequence and sc7 entry firmware is run from COP/BPMP-Lite.

So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
for Tegra210.

This patch has fix for leaving the COP IRQ enabled for Tegra210 during
interrupt controller suspend operation.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/irqchip/irq-tegra.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index 0abc0cd1c32e..deab3ba606e2 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -53,18 +53,22 @@ static unsigned int num_ictlrs;
 
 struct tegra_ictlr_soc {
 	unsigned int num_ictlrs;
+	bool has_bpmp_fw;
 };
 
 static const struct tegra_ictlr_soc tegra20_ictlr_soc = {
 	.num_ictlrs = 4,
+	.has_bpmp_fw = false,
 };
 
 static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
 	.num_ictlrs = 5,
+	.has_bpmp_fw = false,
 };
 
 static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
 	.num_ictlrs = 6,
+	.has_bpmp_fw = true,
 };
 
 static const struct of_device_id ictlr_matches[] = {
@@ -76,6 +80,7 @@ static const struct of_device_id ictlr_matches[] = {
 
 struct tegra_ictlr_info {
 	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
+	struct tegra_ictlr_soc *soc;
 #ifdef CONFIG_PM_SLEEP
 	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
 	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
@@ -156,8 +161,20 @@ static int tegra_ictlr_suspend(void)
 		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
 		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
 
-		/* Disable COP interrupts */
-		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
+		/*
+		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
+		 *
+		 * Tegra210 system suspend flow uses sc7entry firmware which
+		 * is executed by COP/BPMP and it includes disabling COP IRQ,
+		 * clamping CPU rail, turning off VDD_CPU, and preparing the
+		 * system to go to LP0.
+		 *
+		 * COP/BPMP wakes up when COP IRQ is triggered and runs
+		 * sc7entry-firmware. So need to keep COP interrupt enabled
+		 * for Tegra210.
+		 */
+		if (!lic->soc->has_bpmp_fw)
+			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
 
 		/* Disable CPU interrupts */
 		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
@@ -348,6 +365,7 @@ static int __init tegra_ictlr_init(struct device_node *node,
 		goto out_unmap;
 	}
 
+	lic->soc = soc;
 	tegra_ictlr_syscore_init();
 
 	pr_info("%pOF: %d interrupts forwarded to %pOF\n",
-- 
2.7.4
