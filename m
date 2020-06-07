From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 28/39] memory: tegra: Register as interconnect provider
Date: Sun,  7 Jun 2020 21:55:19 +0300
Message-ID: <20200607185530.18113-29-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200607185530.18113-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Now memory controller is a memory interconnection provider. This allows us
to use interconnect API in order to change memory configuration.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/memory/tegra/mc.c | 118 ++++++++++++++++++++++++++++++++++++++
 drivers/memory/tegra/mc.h |   8 +++
 include/soc/tegra/mc.h    |   3 +
 3 files changed, 129 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 772aa021b5f6..645b5fd1e14b 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -594,6 +594,117 @@ static __maybe_unused irqreturn_t tegra20_mc_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int tegra_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	return 0;
+}
+
+static int tegra_mc_icc_aggregate(struct icc_node *node,
+				  u32 tag, u32 avg_bw, u32 peak_bw,
+				  u32 *agg_avg, u32 *agg_peak)
+{
+	*agg_avg = min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+/*
+ * Memory Controller (MC) has few Memory Clients that are issuing memory
+ * bandwidth allocation requests to the MC interconnect provider. The MC
+ * provider aggregates the requests and then sends the aggregated request
+ * up to the External Memory Controller (EMC) interconnect provider which
+ * re-configures hardware interface to External Memory (EMEM) in accordance
+ * to the required bandwidth. Each MC interconnect node represents an
+ * individual Memory Client.
+ *
+ * Memory interconnect topology:
+ *
+ *               +----+
+ * +--------+    |    |
+ * | TEXSRD +--->+    |
+ * +--------+    |    |
+ *               |    |    +-----+    +------+
+ *    ...        | MC +--->+ EMC +--->+ EMEM |
+ *               |    |    +-----+    +------+
+ * +--------+    |    |
+ * | DISP.. +--->+    |
+ * +--------+    |    |
+ *               +----+
+ */
+static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
+{
+	struct icc_onecell_data *data;
+	struct icc_node *node;
+	unsigned int num_nodes;
+	unsigned int i;
+	int err;
+
+	/* older device-trees don't have interconnect properties */
+	if (!of_find_property(mc->dev->of_node, "#interconnect-cells", NULL))
+		return 0;
+
+	num_nodes = mc->soc->num_clients;
+
+	data = devm_kzalloc(mc->dev, struct_size(data, nodes, num_nodes),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mc->provider.dev = mc->dev;
+	mc->provider.set = tegra_mc_icc_set;
+	mc->provider.data = data;
+	mc->provider.xlate = of_icc_xlate_onecell;
+	mc->provider.aggregate = tegra_mc_icc_aggregate;
+
+	err = icc_provider_add(&mc->provider);
+	if (err)
+		return err;
+
+	/* create Memory Controller node */
+	node = icc_node_create(TEGRA_ICC_MC);
+	err = PTR_ERR_OR_ZERO(node);
+	if (err)
+		goto del_provider;
+
+	node->name = "Memory Controller";
+	icc_node_add(node, &mc->provider);
+
+	/* link Memory Controller to External Memory Controller */
+	err = icc_link_create(node, TEGRA_ICC_EMC);
+	if (err)
+		goto remove_nodes;
+
+	for (i = 0; i < num_nodes; i++) {
+		/* create MC client node */
+		node = icc_node_create(mc->soc->clients[i].id);
+		err = PTR_ERR_OR_ZERO(node);
+		if (err)
+			goto remove_nodes;
+
+		node->name = mc->soc->clients[i].name;
+		icc_node_add(node, &mc->provider);
+
+		/* link Memory Client to Memory Controller */
+		err = icc_link_create(node, TEGRA_ICC_MC);
+		if (err)
+			goto remove_nodes;
+
+		data->nodes[i] = node;
+	}
+	data->num_nodes = num_nodes;
+
+	return 0;
+
+remove_nodes:
+	icc_nodes_remove(&mc->provider);
+
+del_provider:
+	icc_provider_del(&mc->provider);
+
+	return err;
+}
+
 static int tegra_mc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -702,6 +813,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (IS_ENABLED(CONFIG_INTERCONNECT)) {
+		err = tegra_mc_interconnect_setup(mc);
+		if (err)
+			dev_err(&pdev->dev, "failed to initialize ICC: %d\n",
+				err);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index afa3ba45c9e6..abeb6a2cc36a 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -115,4 +115,12 @@ extern const struct tegra_mc_soc tegra132_mc_soc;
 extern const struct tegra_mc_soc tegra210_mc_soc;
 #endif
 
+/*
+ * These IDs are for internal use of Tegra's ICC, the values are chosen
+ * such that they don't conflict with the device-tree ICC node IDs.
+ */
+#define TEGRA_ICC_EMC		1000
+#define TEGRA_ICC_EMEM		2000
+#define TEGRA_ICC_MC		3000
+
 #endif /* MEMORY_TEGRA_MC_H */
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1238e35653d1..71de023f9f47 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -7,6 +7,7 @@
 #define __SOC_TEGRA_MC_H__
 
 #include <linux/err.h>
+#include <linux/interconnect-provider.h>
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 
@@ -178,6 +179,8 @@ struct tegra_mc {
 
 	struct reset_controller_dev reset;
 
+	struct icc_provider provider;
+
 	spinlock_t lock;
 };
 
-- 
2.26.0
