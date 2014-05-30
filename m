From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 09/21] iommu/tegra: smmu: get swgroups from DT "iommus="
Date: Fri, 30 May 2014 14:20:22 +0300
Message-ID: <1401448834-32659-10-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This provides the info about which swgroups a device belongs to. This
info is passed from DT. This is necessary for the unified SMMU driver
among Tegra SoCs since each has different H/W accelerators.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 134 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 116 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index fe351cdd5c05..1d3f695d3c66 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -190,6 +190,8 @@ enum {
  * Per client for address space
  */
 struct smmu_client {
+	struct device_node	*of_node;
+	struct rb_node		node;
 	struct device		*dev;
 	struct list_head	list;
 	struct smmu_as		*as;
@@ -233,6 +235,7 @@ struct smmu_device {
 	spinlock_t	lock;
 	char		*name;
 	struct device	*dev;
+	struct rb_root	clients;
 	struct page *avp_vector_page;	/* dummy page shared by all AS's */
 
 	/*
@@ -310,6 +313,95 @@ static inline void smmu_write(struct smmu_device *smmu, u32 val, size_t offs)
  */
 #define FLUSH_SMMU_REGS(smmu)	smmu_read(smmu, SMMU_CONFIG)
 
+static struct smmu_client *find_smmu_client(struct smmu_device *smmu,
+					    struct device_node *dev_node)
+{
+	struct rb_node *node = smmu->clients.rb_node;
+
+	while (node) {
+		struct smmu_client *client;
+
+		client = container_of(node, struct smmu_client, node);
+		if (dev_node < client->of_node)
+			node = node->rb_left;
+		else if (dev_node > client->of_node)
+			node = node->rb_right;
+		else
+			return client;
+	}
+
+	return NULL;
+}
+
+static int insert_smmu_client(struct smmu_device *smmu,
+			      struct smmu_client *client)
+{
+	struct rb_node **new, *parent;
+
+	new = &smmu->clients.rb_node;
+	parent = NULL;
+	while (*new) {
+		struct smmu_client *this;
+
+		this = container_of(*new, struct smmu_client, node);
+		parent = *new;
+		if (client->of_node < this->of_node)
+			new = &((*new)->rb_left);
+		else if (client->of_node > this->of_node)
+			new = &((*new)->rb_right);
+		else
+			return -EEXIST;
+	}
+
+	rb_link_node(&client->node, parent, new);
+	rb_insert_color(&client->node, &smmu->clients);
+	return 0;
+}
+
+static int register_smmu_client(struct smmu_device *smmu,
+				struct device *dev, unsigned long *swgroups)
+{
+	struct smmu_client *client;
+
+	client = find_smmu_client(smmu, dev->of_node);
+	if (client) {
+		dev_err(dev,
+			"rejecting multiple registrations for client device %s\n",
+			dev->of_node->full_name);
+		return -EBUSY;
+	}
+
+	client = devm_kzalloc(smmu->dev, sizeof(*client), GFP_KERNEL);
+	if (!client)
+		return -ENOMEM;
+
+	client->dev = dev;
+	client->of_node = dev->of_node;
+	memcpy(client->hwgrp, swgroups, sizeof(u64));
+	return insert_smmu_client(smmu, client);
+}
+
+static int smmu_of_get_swgroups(struct device *dev, unsigned long *swgroups)
+{
+	struct of_phandle_iter iter;
+
+	of_property_for_each_phandle_with_args(iter, dev->of_node, "iommus",
+					       "iommu-cells", 0) {
+		if (iter.out_args.np != smmu_handle->iommu.dev->of_node)
+			continue;
+
+		BUG_ON(iter.out_args.args_count != 2);
+
+		memcpy(swgroups, iter.out_args.args, sizeof(u64));
+		pr_debug("swgroups=%08lx %08lx ops=%p %s\n",
+			 swgroups[0], swgroups[1],
+			 dev->bus->iommu_ops, dev_name(dev));
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 static int __smmu_client_set_hwgrp(struct smmu_client *c,
 				   unsigned long *map, int on)
 {
@@ -719,21 +811,16 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 	struct smmu_as *as = domain->priv;
 	struct smmu_device *smmu = as->smmu;
 	struct smmu_client *client, *c;
-	unsigned long *map;
 	int err;
 
-	client = devm_kzalloc(smmu->dev, sizeof(*c), GFP_KERNEL);
+	client = find_smmu_client(smmu, dev->of_node);
 	if (!client)
 		return -ENOMEM;
-	client->dev = dev;
-	client->as = as;
-	map = (unsigned long *)dev->platform_data;
-	if (!map)
-		return -EINVAL;
 
-	err = smmu_client_enable_hwgrp(client, map);
+	client->as = as;
+	err = smmu_client_enable_hwgrp(client, client->hwgrp);
 	if (err)
-		goto err_hwgrp;
+		return -EINVAL;
 
 	spin_lock(&as->client_lock);
 	list_for_each_entry(c, &as->client, list) {
@@ -751,7 +838,7 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 	 * Reserve "page zero" for AVP vectors using a common dummy
 	 * page.
 	 */
-	if (test_bit(TEGRA_SWGROUP_AVPC, map)) {
+	if (test_bit(TEGRA_SWGROUP_AVPC, client->hwgrp)) {
 		struct page *page;
 
 		page = as->smmu->avp_vector_page;
@@ -766,8 +853,6 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 err_client:
 	smmu_client_disable_hwgrp(client);
 	spin_unlock(&as->client_lock);
-err_hwgrp:
-	devm_kfree(smmu->dev, client);
 	return err;
 }
 
@@ -784,7 +869,6 @@ static void smmu_iommu_detach_dev(struct iommu_domain *domain,
 		if (c->dev == dev) {
 			smmu_client_disable_hwgrp(c);
 			list_del(&c->list);
-			devm_kfree(smmu->dev, c);
 			c->as = NULL;
 			dev_dbg(smmu->dev,
 				"%s is detached\n", dev_name(c->dev));
@@ -888,10 +972,23 @@ enum {
 
 static int smmu_iommu_bound_driver(struct device *dev)
 {
-	int err = -EPROBE_DEFER;
-	u32 swgroups = dev->platform_data;
+	int err;
+	unsigned long swgroups[2];
 	struct dma_iommu_mapping *map = NULL;
 
+	err = smmu_of_get_swgroups(dev, swgroups);
+	if (err)
+		return -ENODEV;
+
+	if (!find_smmu_client(smmu_handle, dev->of_node)) {
+		err = register_smmu_client(smmu_handle, dev, swgroups);
+		if (err) {
+			dev_err(dev, "failed to add client %s\n",
+				dev_name(dev));
+			return -EINVAL;
+		}
+	}
+
 	if (test_bit(TEGRA_SWGROUP_PPCS, swgroups))
 		map = smmu_handle->map[SYSTEM_PROTECTED];
 	else
@@ -900,10 +997,10 @@ static int smmu_iommu_bound_driver(struct device *dev)
 	if (map)
 		err = arm_iommu_attach_device(dev, map);
 	else
-		return -EPROBE_DEFER;
+		return -ENODEV;
 
-	pr_debug("swgroups=%08lx map=%p err=%d %s\n",
-		 swgroups, map, err, dev_name(dev));
+	pr_debug("swgroups=%08lx %08lx map=%p err=%d %s\n",
+		 swgroups[0], swgroups[1], map, err, dev_name(dev));
 	return err;
 }
 
@@ -1156,6 +1253,7 @@ static int tegra_smmu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	smmu->clients = RB_ROOT;
 	smmu->map = (struct dma_iommu_mapping **)(smmu->as + asids);
 	smmu->nregs = pdev->num_resources;
 	smmu->regs = devm_kzalloc(dev, 2 * smmu->nregs * sizeof(*smmu->regs),
-- 
2.0.0.rc1.15.g7e76a2f
