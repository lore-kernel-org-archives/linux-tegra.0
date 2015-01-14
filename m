From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 2/9] memory: tegra: add mc flush support
Date: Wed, 14 Jan 2015 14:19:25 +0800
Message-ID: <1421216372-8025-3-git-send-email-vinceh@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The flush operation of memory clients is needed for various IP blocks in
the Tegra SoCs to perform a clean reset.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/tegra/mc.c       | 132 ++++++++++++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra114.c |   2 +-
 drivers/memory/tegra/tegra30.c  |   2 +-
 include/soc/tegra/mc.h          |  41 ++++++++++++-
 4 files changed, 173 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index fe3c44e7e1d1..35f769f9f1cd 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -62,6 +63,130 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+static struct tegra_mc_swgroup *find_swgroup(struct tegra_mc *mc,
+		unsigned int swgroup)
+{
+	struct tegra_mc_swgroup *sg;
+
+	list_for_each_entry(sg, &mc->swgroups, head) {
+		if (sg->id == swgroup)
+			return sg;
+	}
+
+	return NULL;
+}
+
+static struct tegra_mc_swgroup *add_swgroup(struct tegra_mc *mc,
+	unsigned int swgroup)
+{
+	struct tegra_mc_swgroup *sg;
+
+	sg = devm_kzalloc(mc->dev, sizeof(*sg), GFP_KERNEL);
+	if (!sg)
+		return ERR_PTR(-ENOMEM);
+
+	sg->id = swgroup;
+	sg->mc = mc;
+	list_add_tail(&sg->head, &mc->swgroups);
+	INIT_LIST_HEAD(&sg->clients);
+
+	return sg;
+}
+
+struct tegra_mc_swgroup *tegra_mc_find_swgroup(struct device_node *node,
+					int index)
+{
+	struct of_phandle_args args;
+	struct platform_device *pdev;
+	struct tegra_mc *mc;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(node, "nvidia,swgroup",
+				1, index, &args);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pdev = of_find_device_by_node(args.np);
+	if (!pdev)
+		return NULL;
+
+	mc = platform_get_drvdata(pdev);
+	if (!mc)
+		return NULL;
+
+	return find_swgroup(mc, args.args[0]);
+}
+EXPORT_SYMBOL(tegra_mc_find_swgroup);
+
+int tegra_mc_flush(struct tegra_mc_swgroup *sg)
+{
+	struct tegra_mc *mc;
+	const struct tegra_mc_hotreset *client;
+	int i;
+
+	if (!sg || !sg->mc)
+		return -EINVAL;;
+
+	mc = sg->mc;
+	if (!mc->soc->ops || !mc->soc->ops->flush)
+		return -EINVAL;;
+
+	client = mc->soc->hotresets;
+
+	for (i = 0; i < mc->soc->num_hotresets; i++, client++) {
+		if (sg->id == client->swgroup)
+			return mc->soc->ops->flush(mc, client);
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(tegra_mc_flush);
+
+int tegra_mc_flush_done(struct tegra_mc_swgroup *sg)
+{
+	struct tegra_mc *mc;
+	const struct tegra_mc_hotreset *client;
+	int i;
+
+	if (!sg || !sg->mc)
+		return -EINVAL;;
+
+	mc = sg->mc;
+	if (!mc->soc->ops || !mc->soc->ops->flush)
+		return -EINVAL;;
+
+	client = mc->soc->hotresets;
+
+	for (i = 0; i < mc->soc->num_hotresets; i++, client++) {
+		if (sg->id == client->swgroup)
+			return mc->soc->ops->flush_done(mc, client);
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(tegra_mc_flush_done);
+
+static int tegra_mc_build_swgroup(struct tegra_mc *mc)
+{
+	int i;
+
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		struct tegra_mc_swgroup *sg;
+
+		sg = find_swgroup(mc, mc->soc->clients[i].swgroup);
+
+		if (!sg) {
+			sg = add_swgroup(mc,  mc->soc->clients[i].swgroup);
+			if (IS_ERR(sg))
+				return PTR_ERR(sg);
+		}
+
+		list_add_tail(&mc->soc->clients[i].head, &sg->clients);
+	}
+
+	return 0;
+}
+
 static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 {
 	unsigned long long tick;
@@ -229,6 +354,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	/* length of MC tick in nanoseconds */
 	mc->tick = 30;
 
+	INIT_LIST_HEAD(&mc->swgroups);
+	err = tegra_mc_build_swgroup(mc);
+	if (err) {
+		dev_err(&pdev->dev, "failed to build swgroup: %d\n", err);
+		return err;
+	}
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mc->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mc->regs))
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 511e9a25c151..92ab5552fcee 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -15,7 +15,7 @@
 
 #include "mc.h"
 
-static const struct tegra_mc_client tegra114_mc_clients[] = {
+static struct tegra_mc_client tegra114_mc_clients[] = {
 	{
 		.id = 0x00,
 		.name = "ptcr",
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 71fe9376fe53..3ed4bf409a72 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -15,7 +15,7 @@
 
 #include "mc.h"
 
-static const struct tegra_mc_client tegra30_mc_clients[] = {
+static struct tegra_mc_client tegra30_mc_clients[] = {
 	{
 		.id = 0x00,
 		.name = "ptcr",
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 63deb8d9f82a..95db1ab1a8bd 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -37,6 +37,32 @@ struct tegra_mc_client {
 
 	struct tegra_smmu_enable smmu;
 	struct tegra_mc_la la;
+
+	struct list_head head;
+};
+
+struct tegra_mc;
+
+/* hot reset */
+struct tegra_mc_hotreset {
+	unsigned int swgroup;
+	unsigned int ctrl;
+	unsigned int status;
+	unsigned int bit;
+};
+
+struct tegra_mc_swgroup {
+	unsigned int id;
+	struct tegra_mc *mc;
+	struct list_head head;
+	struct list_head clients;
+};
+
+struct tegra_mc_ops {
+	int (*flush)(struct tegra_mc *mc,
+			const struct tegra_mc_hotreset *hotreset);
+	int (*flush_done)(struct tegra_mc *mc,
+			const struct tegra_mc_hotreset *hotreset);
 };
 
 struct tegra_smmu_swgroup {
@@ -64,7 +90,6 @@ struct tegra_smmu_soc {
 	const struct tegra_smmu_ops *ops;
 };
 
-struct tegra_mc;
 struct tegra_smmu;
 
 #ifdef CONFIG_TEGRA_IOMMU_SMMU
@@ -81,9 +106,14 @@ tegra_smmu_probe(struct device *dev, const struct tegra_smmu_soc *soc,
 #endif
 
 struct tegra_mc_soc {
-	const struct tegra_mc_client *clients;
+	struct tegra_mc_client *clients;
 	unsigned int num_clients;
 
+	const struct tegra_mc_hotreset *hotresets;
+	unsigned int num_hotresets;
+
+	const struct tegra_mc_ops *ops;
+
 	const unsigned int *emem_regs;
 	unsigned int num_emem_regs;
 
@@ -102,6 +132,13 @@ struct tegra_mc {
 
 	const struct tegra_mc_soc *soc;
 	unsigned long tick;
+
+	struct list_head swgroups;
 };
 
+struct tegra_mc_swgroup *tegra_mc_find_swgroup(struct device_node *node,
+					int index);
+int tegra_mc_flush(struct tegra_mc_swgroup *sg);
+int tegra_mc_flush_done(struct tegra_mc_swgroup *sg);
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
1.9.1
