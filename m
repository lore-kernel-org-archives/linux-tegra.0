From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 11/21] iommu/tegra: smmu: Rename hwgrp -> swgroups
Date: Fri, 30 May 2014 14:20:24 +0300
Message-ID: <1401448834-32659-12-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use the correct term for SWGROUP related variables and macros.

The term "swgroup" is the collection of "memory client". A "memory
client" usually represents a HardWare Accelerator(HWA) like
GPU. Sometimes a strut device can belong to multiple "swgroup" so that
"swgroup's'" is used here. This "swgroups" is the term used in Tegra
TRM. Rename along with TRM.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index caa531cb1c50..5cb0e2a2b267 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -179,12 +179,12 @@ enum {
 
 #define NUM_SMMU_REG_BANKS	3
 
-#define smmu_client_enable_hwgrp(c, m)	smmu_client_set_hwgrp(c, m, 1)
-#define smmu_client_disable_hwgrp(c)	smmu_client_set_hwgrp(c, 0, 0)
-#define __smmu_client_enable_hwgrp(c, m) __smmu_client_set_hwgrp(c, m, 1)
-#define __smmu_client_disable_hwgrp(c)	__smmu_client_set_hwgrp(c, 0, 0)
+#define smmu_client_enable_swgroups(c, m) smmu_client_set_swgroups(c, m, 1)
+#define smmu_client_disable_swgroups(c) smmu_client_set_swgroups(c, 0, 0)
+#define __smmu_client_enable_swgroups(c, m) __smmu_client_set_swgroups(c, m, 1)
+#define __smmu_client_disable_swgroups(c) __smmu_client_set_swgroups(c, 0, 0)
 
-#define HWGRP_ASID_REG(x) ((x) * sizeof(u32) + SMMU_ASID_BASE)
+#define SWGROUPS_ASID_REG(x) ((x) * sizeof(u32) + SMMU_ASID_BASE)
 
 /*
  * Per client for address space
@@ -195,7 +195,7 @@ struct smmu_client {
 	struct device		*dev;
 	struct list_head	list;
 	struct smmu_as		*as;
-	unsigned long		hwgrp[2];
+	unsigned long		swgroups[2];
 };
 
 /*
@@ -377,7 +377,7 @@ static int register_smmu_client(struct smmu_device *smmu,
 
 	client->dev = dev;
 	client->of_node = dev->of_node;
-	memcpy(client->hwgrp, swgroups, sizeof(u64));
+	memcpy(client->swgroups, swgroups, sizeof(u64));
 	return insert_smmu_client(smmu, client);
 }
 
@@ -402,7 +402,7 @@ static int smmu_of_get_swgroups(struct device *dev, unsigned long *swgroups)
 	return -ENODEV;
 }
 
-static int __smmu_client_set_hwgrp(struct smmu_client *c,
+static int __smmu_client_set_swgroups(struct smmu_client *c,
 				   unsigned long *map, int on)
 {
 	int i;
@@ -411,10 +411,10 @@ static int __smmu_client_set_hwgrp(struct smmu_client *c,
 	struct smmu_device *smmu = as->smmu;
 
 	if (!on)
-		map = c->hwgrp;
+		map = c->swgroups;
 
 	for_each_set_bit(i, map, TEGRA_SWGROUP_MAX) {
-		offs = HWGRP_ASID_REG(i);
+		offs = SWGROUPS_ASID_REG(i);
 		val = smmu_read(smmu, offs);
 		if (on) {
 			if (val) {
@@ -424,7 +424,7 @@ static int __smmu_client_set_hwgrp(struct smmu_client *c,
 			}
 
 			val = mask;
-			memcpy(c->hwgrp, map, sizeof(u64));
+			memcpy(c->swgroups, map, sizeof(u64));
 		} else {
 			WARN_ON((val & mask) == mask);
 			val &= ~mask;
@@ -437,7 +437,7 @@ skip:
 	return 0;
 }
 
-static int smmu_client_set_hwgrp(struct smmu_client *c,
+static int smmu_client_set_swgroups(struct smmu_client *c,
 				 unsigned long *map, int on)
 {
 	int err;
@@ -446,7 +446,7 @@ static int smmu_client_set_hwgrp(struct smmu_client *c,
 	struct smmu_device *smmu = as->smmu;
 
 	spin_lock_irqsave(&smmu->lock, flags);
-	err = __smmu_client_set_hwgrp(c, map, on);
+	err = __smmu_client_set_swgroups(c, map, on);
 	spin_unlock_irqrestore(&smmu->lock, flags);
 	return err;
 }
@@ -486,7 +486,7 @@ static int smmu_setup_regs(struct smmu_device *smmu)
 		smmu_write(smmu, val, SMMU_PTB_DATA);
 
 		list_for_each_entry(c, &as->client, list)
-			__smmu_client_set_hwgrp(c, c->hwgrp, 1);
+			__smmu_client_set_swgroups(c, c->swgroups, 1);
 	}
 
 	smmu_write(smmu, smmu->translation_enable_0, SMMU_TRANSLATION_ENABLE_0);
@@ -814,7 +814,7 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 		return -ENOMEM;
 
 	client->as = as;
-	err = smmu_client_enable_hwgrp(client, client->hwgrp);
+	err = smmu_client_enable_swgroups(client, client->swgroups);
 	if (err)
 		return -EINVAL;
 
@@ -834,7 +834,7 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 	 * Reserve "page zero" for AVP vectors using a common dummy
 	 * page.
 	 */
-	if (test_bit(TEGRA_SWGROUP_AVPC, client->hwgrp)) {
+	if (test_bit(TEGRA_SWGROUP_AVPC, client->swgroups)) {
 		struct page *page;
 
 		page = as->smmu->avp_vector_page;
@@ -847,7 +847,7 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 	return 0;
 
 err_client:
-	smmu_client_disable_hwgrp(client);
+	smmu_client_disable_swgroups(client);
 	spin_unlock(&as->client_lock);
 	return err;
 }
@@ -863,7 +863,7 @@ static void smmu_iommu_detach_dev(struct iommu_domain *domain,
 
 	list_for_each_entry(c, &as->client, list) {
 		if (c->dev == dev) {
-			smmu_client_disable_hwgrp(c);
+			smmu_client_disable_swgroups(c);
 			list_del(&c->list);
 			c->as = NULL;
 			dev_dbg(smmu->dev,
-- 
2.0.0.rc1.15.g7e76a2f
