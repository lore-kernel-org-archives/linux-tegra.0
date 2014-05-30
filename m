From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 12/21] iommu/tegra: smmu: add SMMU to an global iommu list
Date: Fri, 30 May 2014 14:20:25 +0300
Message-ID: <1401448834-32659-13-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This allows to inquire if SMMU is populated or not.

Suggested by Thierry Reding and copied his example code.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 53 +++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 5cb0e2a2b267..4a326476c364 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -225,6 +225,8 @@ struct smmu_debugfs_info {
  * Per SMMU device - IOMMU device
  */
 struct smmu_device {
+	struct iommu	iommu;
+
 	void __iomem	*regbase;	/* register offset base */
 	void __iomem	**regs;		/* register block start address array */
 	void __iomem	**rege;		/* register block end address array */
@@ -234,7 +236,6 @@ struct smmu_device {
 	unsigned long	page_count;	/* total remappable size */
 	spinlock_t	lock;
 	char		*name;
-	struct device	*dev;
 	struct rb_root	clients;
 	struct page *avp_vector_page;	/* dummy page shared by all AS's */
 
@@ -371,7 +372,7 @@ static int register_smmu_client(struct smmu_device *smmu,
 		return -EBUSY;
 	}
 
-	client = devm_kzalloc(smmu->dev, sizeof(*client), GFP_KERNEL);
+	client = devm_kzalloc(smmu->iommu.dev, sizeof(*client), GFP_KERNEL);
 	if (!client)
 		return -ENOMEM;
 
@@ -526,7 +527,7 @@ static void free_ptbl(struct smmu_as *as, dma_addr_t iova)
 	unsigned long *pdir = (unsigned long *)page_address(as->pdir_page);
 
 	if (pdir[pdn] != _PDE_VACANT(pdn)) {
-		dev_dbg(as->smmu->dev, "pdn: %lx\n", pdn);
+		dev_dbg(as->smmu->iommu.dev, "pdn: %lx\n", pdn);
 
 		ClearPageReserved(SMMU_EX_PTBL_PAGE(pdir[pdn]));
 		__free_page(SMMU_EX_PTBL_PAGE(pdir[pdn]));
@@ -541,7 +542,7 @@ static void free_pdir(struct smmu_as *as)
 {
 	unsigned addr;
 	int count;
-	struct device *dev = as->smmu->dev;
+	struct device *dev = as->smmu->iommu.dev;
 
 	if (!as->pdir_page)
 		return;
@@ -584,11 +585,11 @@ static unsigned long *locate_pte(struct smmu_as *as,
 		unsigned long addr = SMMU_PDN_TO_ADDR(pdn);
 
 		/* Vacant - allocate a new page table */
-		dev_dbg(as->smmu->dev, "New PTBL pdn: %lx\n", pdn);
+		dev_dbg(as->smmu->iommu.dev, "New PTBL pdn: %lx\n", pdn);
 
 		*ptbl_page_p = alloc_page(GFP_ATOMIC);
 		if (!*ptbl_page_p) {
-			dev_err(as->smmu->dev,
+			dev_err(as->smmu->iommu.dev,
 				"failed to allocate smmu_device page table\n");
 			return NULL;
 		}
@@ -648,7 +649,7 @@ static int alloc_pdir(struct smmu_as *as)
 	/*
 	 * do the allocation, then grab as->lock
 	 */
-	cnt = devm_kzalloc(smmu->dev,
+	cnt = devm_kzalloc(smmu->iommu.dev,
 			   sizeof(cnt[0]) * SMMU_PDIR_COUNT,
 			   GFP_KERNEL);
 	page = alloc_page(GFP_KERNEL | __GFP_DMA);
@@ -662,7 +663,8 @@ static int alloc_pdir(struct smmu_as *as)
 	}
 
 	if (!page || !cnt) {
-		dev_err(smmu->dev, "failed to allocate at %s\n", __func__);
+		dev_err(smmu->iommu.dev,
+			"failed to allocate at %s\n", __func__);
 		err = -ENOMEM;
 		goto err_out;
 	}
@@ -692,7 +694,7 @@ static int alloc_pdir(struct smmu_as *as)
 err_out:
 	spin_unlock_irqrestore(&as->lock, flags);
 
-	devm_kfree(smmu->dev, cnt);
+	devm_kfree(smmu->iommu.dev, cnt);
 	if (page)
 		__free_page(page);
 	return err;
@@ -747,7 +749,7 @@ static int smmu_iommu_map(struct iommu_domain *domain, unsigned long iova,
 	unsigned long pfn = __phys_to_pfn(pa);
 	unsigned long flags;
 
-	dev_dbg(as->smmu->dev, "[%d] %08lx:%pa\n", as->asid, iova, &pa);
+	dev_dbg(as->smmu->iommu.dev, "[%d] %08lx:%pa\n", as->asid, iova, &pa);
 
 	if (!pfn_valid(pfn))
 		return -ENOMEM;
@@ -764,7 +766,7 @@ static size_t smmu_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 	struct smmu_as *as = domain->priv;
 	unsigned long flags;
 
-	dev_dbg(as->smmu->dev, "[%d] %08lx\n", as->asid, iova);
+	dev_dbg(as->smmu->iommu.dev, "[%d] %08lx\n", as->asid, iova);
 
 	spin_lock_irqsave(&as->lock, flags);
 	__smmu_iommu_unmap(as, iova);
@@ -787,7 +789,7 @@ static phys_addr_t smmu_iommu_iova_to_phys(struct iommu_domain *domain,
 	pte = locate_pte(as, iova, true, &page, &count);
 	pfn = *pte & SMMU_PFN_MASK;
 	WARN_ON(!pfn_valid(pfn));
-	dev_dbg(as->smmu->dev,
+	dev_dbg(as->smmu->iommu.dev,
 		"iova:%08llx pfn:%08lx asid:%d\n", (unsigned long long)iova,
 		 pfn, as->asid);
 
@@ -821,7 +823,7 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 	spin_lock(&as->client_lock);
 	list_for_each_entry(c, &as->client, list) {
 		if (c->dev == dev) {
-			dev_err(smmu->dev,
+			dev_err(smmu->iommu.dev,
 				"%s is already attached\n", dev_name(c->dev));
 			err = -EINVAL;
 			goto err_client;
@@ -843,7 +845,7 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 		pr_info("Reserve \"page zero\" for AVP vectors using a common dummy\n");
 	}
 
-	dev_dbg(smmu->dev, "%s is attached\n", dev_name(dev));
+	dev_dbg(smmu->iommu.dev, "%s is attached\n", dev_name(dev));
 	return 0;
 
 err_client:
@@ -866,12 +868,12 @@ static void smmu_iommu_detach_dev(struct iommu_domain *domain,
 			smmu_client_disable_swgroups(c);
 			list_del(&c->list);
 			c->as = NULL;
-			dev_dbg(smmu->dev,
+			dev_dbg(smmu->iommu.dev,
 				"%s is detached\n", dev_name(c->dev));
 			goto out;
 		}
 	}
-	dev_err(smmu->dev, "Couldn't find %s\n", dev_name(dev));
+	dev_err(smmu->iommu.dev, "Couldn't find %s\n", dev_name(dev));
 out:
 	spin_unlock(&as->client_lock);
 }
@@ -898,7 +900,7 @@ static int smmu_iommu_domain_init(struct iommu_domain *domain)
 			break;
 	}
 	if (i == smmu->num_as)
-		dev_err(smmu->dev,  "no free AS\n");
+		dev_err(smmu->iommu.dev,  "no free AS\n");
 	return err;
 
 found:
@@ -919,7 +921,7 @@ found:
 		smmu->page_count * SMMU_PAGE_SIZE - 1;
 	domain->geometry.force_aperture = true;
 
-	dev_dbg(smmu->dev, "smmu_as@%p\n", as);
+	dev_dbg(smmu->iommu.dev, "smmu_as@%p\n", as);
 
 	return 0;
 }
@@ -952,7 +954,7 @@ static void smmu_iommu_domain_destroy(struct iommu_domain *domain)
 	spin_unlock_irqrestore(&as->lock, flags);
 
 	domain->priv = NULL;
-	dev_dbg(smmu->dev, "smmu_as@%p\n", as);
+	dev_dbg(smmu->iommu.dev, "smmu_as@%p\n", as);
 }
 
 /*
@@ -1084,7 +1086,7 @@ static ssize_t smmu_debugfs_stats_write(struct file *file,
 		break;
 	}
 
-	dev_dbg(smmu->dev, "%s() %08x, %08x @%08x\n", __func__,
+	dev_dbg(smmu->iommu.dev, "%s() %08x, %08x @%08x\n", __func__,
 		val, smmu_read(smmu, offs), offs);
 
 	return count;
@@ -1106,7 +1108,7 @@ static int smmu_debugfs_stats_show(struct seq_file *s, void *v)
 		val = smmu_read(smmu, offs);
 		seq_printf(s, "%s:%08x ", stats[i], val);
 
-		dev_dbg(smmu->dev, "%s() %s %08x @%08x\n", __func__,
+		dev_dbg(smmu->iommu.dev, "%s() %s %08x @%08x\n", __func__,
 			stats[i], val, offs);
 	}
 	seq_printf(s, "\n");
@@ -1144,7 +1146,7 @@ static void smmu_debugfs_create(struct smmu_device *smmu)
 	if (!smmu->debugfs_info)
 		return;
 
-	root = debugfs_create_dir(dev_name(smmu->dev), NULL);
+	root = debugfs_create_dir(dev_name(smmu->iommu.dev), NULL);
 	if (!root)
 		goto err_out;
 	smmu->debugfs_root = root;
@@ -1216,7 +1218,7 @@ static void tegra_smmu_create_default_map(struct smmu_device *smmu)
 		smmu->map[i] = arm_iommu_create_mapping(&platform_bus_type,
 							base, size);
 		if (IS_ERR(smmu->map[i]))
-			dev_err(smmu->dev,
+			dev_err(smmu->iommu.dev,
 				"Couldn't create: asid=%d map=%p %pa-%pa\n",
 				i, smmu->map[i], &base, &base + size - 1);
 	}
@@ -1284,7 +1286,7 @@ static int tegra_smmu_probe(struct platform_device *pdev)
 	if (!smmu->ahb)
 		return -ENODEV;
 
-	smmu->dev = dev;
+	smmu->iommu.dev = dev;
 	smmu->num_as = asids;
 	smmu->iovmm_base = base;
 	smmu->page_count = size;
@@ -1321,6 +1323,8 @@ static int tegra_smmu_probe(struct platform_device *pdev)
 	smmu_handle = smmu;
 	bus_set_iommu(&platform_bus_type, &smmu_iommu_ops);
 	tegra_smmu_create_default_map(smmu);
+
+	iommu_add(&smmu->iommu);
 	return 0;
 }
 
@@ -1336,6 +1340,7 @@ static int tegra_smmu_remove(struct platform_device *pdev)
 		free_pdir(&smmu->as[i]);
 	__free_page(smmu->avp_vector_page);
 	smmu_handle = NULL;
+	iommu_del(&smmu->iommu);
 	return 0;
 }
 
-- 
2.0.0.rc1.15.g7e76a2f
