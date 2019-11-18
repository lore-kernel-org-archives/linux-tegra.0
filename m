From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 18/29] memory: tegra20-emc: Continue probing if timings/IRQ are missing in device-tree
Date: Mon, 18 Nov 2019 23:02:36 +0300
Message-ID: <20191118200247.3567-19-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

EMC driver will become mandatory after making it interconnect provider
because interconnect users like display controller driver will fail to
probe using newer device-trees that have interconnect properties. Thus
make driver to probe even if timings or IRQ are missing in device-tree,
the frequency scaling won't be available in this case because there will
be only one frequency available, the frequency that is left from
bootloader.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 61 +++++++++++++++---------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index d2efd0c658c0..28bd9fd4c3c9 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -381,6 +381,11 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 	u32 value, ram_code;
 	int err;
 
+	if (of_get_child_count(dev->of_node) == 0) {
+		dev_info(dev, "device-tree doesn't have memory timings\n");
+		return NULL;
+	}
+
 	if (!of_property_read_bool(dev->of_node, "nvidia,use-ram-code"))
 		return of_node_get(dev->of_node);
 
@@ -449,6 +454,9 @@ static long emc_round_rate(unsigned long rate,
 	struct tegra_emc *emc = arg;
 	unsigned int i;
 
+	if (!emc->num_timings)
+		return clk_get_rate(emc->clk);
+
 	min_rate = min(min_rate, emc->timings[emc->num_timings - 1].rate);
 
 	for (i = 0; i < emc->num_timings; i++) {
@@ -484,38 +492,21 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	struct tegra_emc *emc;
 	int irq, err;
 
-	/* driver has nothing to do in a case of memory timing absence */
-	if (of_get_child_count(pdev->dev.of_node) == 0) {
-		dev_info(&pdev->dev,
-			 "EMC device tree node doesn't have memory timings\n");
-		return 0;
-	}
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "interrupt not specified\n");
-		dev_err(&pdev->dev, "please update your device tree\n");
-		return irq;
-	}
-
-	np = tegra_emc_find_node_by_ram_code(&pdev->dev);
-	if (!np)
-		return -EINVAL;
-
 	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
-	if (!emc) {
-		of_node_put(np);
+	if (!emc)
 		return -ENOMEM;
-	}
 
 	init_completion(&emc->clk_handshake_complete);
 	emc->clk_nb.notifier_call = tegra_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
-	err = tegra_emc_load_timings_from_dt(emc, np);
-	of_node_put(np);
-	if (err)
-		return err;
+	np = tegra_emc_find_node_by_ram_code(&pdev->dev);
+	if (np) {
+		err = tegra_emc_load_timings_from_dt(emc, np);
+		of_node_put(np);
+		if (err)
+			return err;
+	}
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
@@ -525,11 +516,21 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = devm_request_irq(&pdev->dev, irq, tegra_emc_isr, 0,
-			       dev_name(&pdev->dev), emc);
-	if (err) {
-		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", irq, err);
-		return err;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "interrupt not specified\n");
+		dev_err(&pdev->dev, "please update your device tree\n");
+		dev_err(&pdev->dev, "frequency scaling disabled\n");
+
+		emc->num_timings = 0;
+	} else {
+		err = devm_request_irq(&pdev->dev, irq, tegra_emc_isr, 0,
+				       dev_name(&pdev->dev), emc);
+		if (err) {
+			dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n",
+				irq, err);
+			return err;
+		}
 	}
 
 	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
-- 
2.23.0
