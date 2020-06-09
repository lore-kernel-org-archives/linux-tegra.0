From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 34/37] memory: tegra30-emc: Register as interconnect provider
Date: Tue,  9 Jun 2020 16:14:01 +0300
Message-ID: <20200609131404.17523-35-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Now external memory controller is a memory interconnection provider.
This allows us to use interconnect API to change memory configuration.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index f6c688bfe41f..37cea4435d55 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -14,6 +14,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/interconnect-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -327,6 +328,7 @@ struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
 	struct notifier_block clk_nb;
+	struct icc_provider provider;
 	struct clk *clk;
 	void __iomem *regs;
 	unsigned int irq;
@@ -1264,6 +1266,113 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
+static inline struct tegra_emc *
+to_tegra_emc_provider(struct icc_provider *provider)
+{
+	return container_of(provider, struct tegra_emc, provider);
+}
+
+static struct icc_node *
+emc_of_icc_xlate(struct of_phandle_args *spec, void *data)
+{
+	struct icc_provider *provider = data;
+	struct icc_node *node;
+
+	/* External Memory is the only possible ICC route */
+	list_for_each_entry(node, &provider->nodes, node_list) {
+		if (node->id == TEGRA_ICC_EMEM)
+			return node;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct tegra_emc *emc = to_tegra_emc_provider(dst->provider);
+	unsigned long long rate = icc_units_to_bps(dst->avg_bw);
+	unsigned int dram_data_bus_width_bytes = 4;
+	unsigned int ddr = 2;
+	int err;
+
+	do_div(rate, ddr * dram_data_bus_width_bytes);
+	rate = min_t(u64, rate, U32_MAX);
+
+	err = clk_set_min_rate(emc->clk, rate);
+	if (err)
+		return err;
+
+	err = clk_set_rate(emc->clk, rate);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int emc_icc_aggregate(struct icc_node *node,
+			     u32 tag, u32 avg_bw, u32 peak_bw,
+			     u32 *agg_avg, u32 *agg_peak)
+{
+	*agg_avg = min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static int tegra_emc_interconnect_init(struct tegra_emc *emc)
+{
+	struct icc_node *node;
+	int err;
+
+	/* older device-trees don't have interconnect properties */
+	if (!of_find_property(emc->dev->of_node, "#interconnect-cells", NULL))
+		return 0;
+
+	emc->provider.dev = emc->dev;
+	emc->provider.set = emc_icc_set;
+	emc->provider.data = &emc->provider;
+	emc->provider.xlate = emc_of_icc_xlate;
+	emc->provider.aggregate = emc_icc_aggregate;
+
+	err = icc_provider_add(&emc->provider);
+	if (err)
+		goto err_msg;
+
+	/* create External Memory Controller node */
+	node = icc_node_create(TEGRA_ICC_EMC);
+	err = PTR_ERR_OR_ZERO(node);
+	if (err)
+		goto del_provider;
+
+	node->name = "External Memory Controller";
+	icc_node_add(node, &emc->provider);
+
+	/* link External Memory Controller to External Memory (DRAM) */
+	err = icc_link_create(node, TEGRA_ICC_EMEM);
+	if (err)
+		goto remove_nodes;
+
+	/* create External Memory node */
+	node = icc_node_create(TEGRA_ICC_EMEM);
+	err = PTR_ERR_OR_ZERO(node);
+	if (err)
+		goto remove_nodes;
+
+	node->name = "External Memory (DRAM)";
+	icc_node_add(node, &emc->provider);
+
+	return 0;
+
+remove_nodes:
+	icc_nodes_remove(&emc->provider);
+del_provider:
+	icc_provider_del(&emc->provider);
+err_msg:
+	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
+
+	return err;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct platform_device *mc;
@@ -1343,6 +1452,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, emc);
 	tegra_emc_debugfs_init(emc);
+	tegra_emc_interconnect_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
-- 
2.26.0
