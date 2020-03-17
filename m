From: laurentiu.tudor-3arQi8VN3Tc@public.gmane.org
Subject: [RFC PATCH v2 2/2] iommu: arm-smmu: Add support for early direct mappings
Date: Tue, 17 Mar 2020 16:21:07 +0200
Message-ID: <20200317142107.28776-3-laurentiu.tudor@nxp.com>
References: <20200317142107.28776-1-laurentiu.tudor@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200317142107.28776-1-laurentiu.tudor-3arQi8VN3Tc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: pdaly-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, diana.craciun-3arQi8VN3Tc@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laurentiu Tudor <laurentiu.tudor-3arQi8VN3Tc@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On platforms, the firmware will setup hardware to read from a given
region of memory. One such example is a display controller that is
scanning out a splash screen from physical memory.

During Linux's boot process, the ARM SMMU will configure all contexts to
fault by default. This means that memory accesses that happen by an SMMU
master before its driver has had a chance to properly set up the IOMMU
will cause a fault. This is especially annoying for something like the
display controller scanning out a splash screen because the faults will
result in the display controller getting bogus data (all-ones on Tegra)
and since it repeatedly scans that framebuffer, it will keep triggering
such faults and spam the boot log with them.

In order to work around such problems, scan the device tree for IOMMU
masters and set up a special identity domain that will map 1:1 all of
the reserved regions associated with them. This happens before the SMMU
is enabled, so that the mappings are already set up before translations
begin.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Laurentiu Tudor <laurentiu.tudor-3arQi8VN3Tc@public.gmane.org>
---
 drivers/iommu/arm-smmu.c | 257 ++++++++++++++++++++++++++++++++++++++-
 drivers/iommu/arm-smmu.h |   3 +
 2 files changed, 259 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 8a238d5a4b51..083566a27eef 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1158,6 +1158,135 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	return 0;
 }
 
+static int arm_smmu_identity_map_regions(struct iommu_domain *dom,
+					 struct arm_smmu_device *smmu,
+					 struct device_node *np)
+{
+	struct device *dev = smmu->dev;
+	struct of_phandle_iterator it;
+	unsigned long page_size;
+	unsigned int count = 0;
+	int ret;
+
+	page_size = 1UL << __ffs(dom->pgsize_bitmap);
+
+	/* parse memory regions and add them to the identity mapping */
+	of_for_each_phandle(&it, ret, np, "memory-region", NULL, 0) {
+		int prot = IOMMU_READ | IOMMU_WRITE;
+		dma_addr_t start, limit, iova;
+		struct resource res;
+
+		ret = of_address_to_resource(it.node, 0, &res);
+		if (ret < 0) {
+			dev_err(dev, "failed to parse memory region %pOF: %d\n",
+				it.node, ret);
+			continue;
+		}
+
+		/* check that region is not empty */
+		if (resource_size(&res) == 0) {
+			dev_dbg(dev, "skipping empty memory region %pOF\n",
+				it.node);
+			continue;
+		}
+
+		start = ALIGN(res.start, page_size);
+		limit = ALIGN(res.start + resource_size(&res), page_size);
+
+		for (iova = start; iova < limit; iova += page_size) {
+			phys_addr_t phys;
+
+			/* check that this IOVA isn't already mapped */
+			phys = iommu_iova_to_phys(dom, iova);
+			if (phys)
+				continue;
+
+			ret = iommu_map(dom, iova, iova, page_size,
+					prot);
+			if (ret < 0) {
+				dev_err(dev, "failed to map %pad for %pOF: %d\n",
+					&iova, it.node, ret);
+				continue;
+			}
+		}
+
+		dev_dbg(dev, "identity mapped memory region %pR\n", &res);
+		count++;
+	}
+
+	return count;
+}
+
+static bool arm_smmu_identity_unmap_regions(struct arm_smmu_device *smmu,
+					    struct device_node *np)
+{
+	struct device *dev = smmu->dev;
+	struct of_phandle_iterator it;
+	unsigned long page_size;
+	int ret;
+	bool unmapped = false;
+
+	page_size = 1UL << __ffs(smmu->identity->pgsize_bitmap);
+
+	/* parse memory regions and add them to the identity mapping */
+	of_for_each_phandle(&it, ret, np, "memory-region", NULL, 0) {
+		dma_addr_t start, limit, iova;
+		struct resource res;
+
+		ret = of_address_to_resource(it.node, 0, &res);
+		if (ret < 0) {
+			dev_err(dev, "failed to parse memory region %pOF: %d\n",
+				it.node, ret);
+			continue;
+		}
+
+		/* check that region is not empty */
+		if (resource_size(&res) == 0) {
+			dev_dbg(dev, "skipping empty memory region %pOF\n",
+				it.node);
+			continue;
+		}
+
+		start = ALIGN(res.start, page_size);
+		limit = ALIGN(res.start + resource_size(&res), page_size);
+
+		for (iova = start; iova < limit; iova += page_size) {
+			if (!iommu_unmap(smmu->identity, iova, page_size)) {
+				dev_err(dev,
+					"failed to unmap %pad for %pOF\n",
+					&iova, it.node);
+				continue;
+			}
+		}
+
+		dev_dbg(dev, "identity unmapped memory region %pR\n", &res);
+		unmapped = true;
+	}
+
+	return unmapped;
+}
+
+static void arm_smmu_identity_free_master(struct arm_smmu_device *smmu,
+					  u32 fwid)
+{
+	u16 sid, mask;
+	int ret;
+
+	sid = FIELD_GET(ARM_SMMU_SMR_ID, fwid);
+	mask = FIELD_GET(ARM_SMMU_SMR_MASK, fwid);
+
+	ret = arm_smmu_find_sme(smmu, sid, mask);
+	if (ret >= 0) {
+		arm_smmu_free_sme(smmu, ret);
+		if (--smmu->num_identity_masters)
+			arm_smmu_domain_free(smmu->identity);
+		return;
+	}
+
+	pr_err("failed to free identity mapped master: no SME for fwid 0x%x: %d\n",
+	       fwid, ret);
+}
+
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
 	int ret;
@@ -1203,9 +1332,20 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		goto rpm_put;
 	}
 
+	/* Recreate indentity mappings in the device's freshly created group */
+	ret = arm_smmu_identity_map_regions(domain, smmu, dev->of_node);
+	if (ret < 0) {
+		dev_err(dev, "failed to map identity regions (err=%d)\n", ret);
+		goto rpm_put;
+	}
+
 	/* Looks ok, so add the device to the domain */
 	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
 
+	/* Remove identity mappings from the original identity domain */
+	if (arm_smmu_identity_unmap_regions(smmu, dev->of_node))
+		arm_smmu_identity_free_master(smmu, fwspec->ids[0]);
+
 	/*
 	 * Setup an autosuspend delay to avoid bouncing runpm state.
 	 * Otherwise, if a driver for a suspended consumer device
@@ -1928,6 +2068,117 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static int arm_smmu_identity_add_master(struct arm_smmu_device *smmu,
+					struct of_phandle_args *args)
+{
+	struct arm_smmu_domain *identity = to_smmu_domain(smmu->identity);
+	struct arm_smmu_smr *smrs = smmu->smrs;
+	struct device *dev = smmu->dev;
+	unsigned int index;
+	u16 sid, mask;
+	u32 fwid;
+	int ret;
+
+	/* skip masters that aren't ours */
+	if (args->np != dev->of_node)
+		return 0;
+
+	fwid = arm_smmu_of_parse(args->np, args->args, args->args_count);
+	sid = FIELD_GET(ARM_SMMU_SMR_ID, fwid);
+	mask = FIELD_GET(ARM_SMMU_SMR_MASK, fwid);
+
+	ret = arm_smmu_find_sme(smmu, sid, mask);
+	if (ret < 0) {
+		dev_err(dev, "failed to find SME: %d\n", ret);
+		return ret;
+	}
+
+	index = ret;
+
+	if (smrs && smmu->s2crs[index].count == 0) {
+		smrs[index].id = sid;
+		smrs[index].mask = mask;
+		smrs[index].valid = true;
+	}
+
+	smmu->s2crs[index].type = S2CR_TYPE_TRANS;
+	smmu->s2crs[index].privcfg = S2CR_PRIVCFG_DEFAULT;
+	smmu->s2crs[index].cbndx = identity->cfg.cbndx;
+	smmu->s2crs[index].count++;
+
+	smmu->num_identity_masters++;
+
+	return 0;
+}
+
+static int arm_smmu_identity_add_device(struct arm_smmu_device *smmu,
+					struct device_node *np)
+{
+	struct of_phandle_args args;
+	unsigned int index = 0;
+	int ret;
+
+	/* add stream IDs to the identity mapping */
+	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells",
+					   index, &args)) {
+		ret = arm_smmu_identity_add_master(smmu, &args);
+		if (ret < 0)
+			return ret;
+
+		index++;
+	}
+
+	return 0;
+}
+
+static int arm_smmu_setup_identity(struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_domain *identity;
+	struct device *dev = smmu->dev;
+	struct device_node *np;
+	int ret;
+
+	/* create early identity mapping */
+	smmu->identity = arm_smmu_domain_alloc(IOMMU_DOMAIN_UNMANAGED);
+	if (!smmu->identity) {
+		dev_err(dev, "failed to create identity domain\n");
+		return -ENOMEM;
+	}
+
+	smmu->identity->pgsize_bitmap = smmu->pgsize_bitmap;
+	smmu->identity->type = IOMMU_DOMAIN_UNMANAGED;
+	smmu->identity->ops = &arm_smmu_ops;
+
+	ret = arm_smmu_init_domain_context(smmu->identity, smmu);
+	if (ret < 0) {
+		dev_err(dev, "failed to initialize identity domain: %d\n", ret);
+		return ret;
+	}
+
+	smmu->num_identity_masters = 0;
+
+	identity = to_smmu_domain(smmu->identity);
+
+	for_each_node_with_property(np, "iommus") {
+		ret = arm_smmu_identity_map_regions(smmu->identity, smmu, np);
+		if (ret < 0)
+			continue;
+
+		/*
+		 * Do not add devices to the early identity mapping if they
+		 * do not define any memory-regions.
+		 */
+		if (ret == 0)
+			continue;
+
+		ret = arm_smmu_identity_add_device(smmu, np);
+		if (ret < 0)
+			continue;
+	}
+
+	return 0;
+}
+
 struct arm_smmu_match_data {
 	enum arm_smmu_arch_version version;
 	enum arm_smmu_implementation model;
@@ -2185,6 +2436,10 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = arm_smmu_setup_identity(smmu);
+	if (err)
+		return err;
+
 	if (smmu->version == ARM_SMMU_V2) {
 		if (smmu->num_context_banks > smmu->num_context_irqs) {
 			dev_err(dev,
@@ -2227,8 +2482,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, smmu);
-	arm_smmu_device_reset(smmu);
 	arm_smmu_test_smr_masks(smmu);
+	arm_smmu_device_reset(smmu);
 
 	/*
 	 * We want to avoid touching dev->power.lock in fastpaths unless
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 8d1cd54d82a6..607a637cf948 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -305,6 +305,9 @@ struct arm_smmu_device {
 
 	/* IOMMU core code handle */
 	struct iommu_device		iommu;
+
+	struct iommu_domain		*identity;
+	int				num_identity_masters;
 };
 
 enum arm_smmu_context_fmt {
-- 
2.17.1
