From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] iommu/tegra-smmu: Prevent race condition between map and
 unmap
Date: Thu, 19 Dec 2019 16:29:14 -0800
Message-ID: <20191220002914.19043-5-nicoleotsuka@gmail.com>
References: <20191220002914.19043-1-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20191220002914.19043-1-nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When testing with ethernet downloading, "EMEM address decode error"
happens due to race condition between map() and unmap() functions.

This patch adds a spin lock to protect content within as->[count]
and as->pts[pde] references, since a function call might be atomic.

Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 3999ecb63cfa..236bc6d6d238 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -37,6 +37,7 @@ struct tegra_smmu {
 
 	unsigned long *asids;
 	struct mutex lock;
+	spinlock_t as_lock;
 
 	struct list_head list;
 
@@ -664,17 +665,23 @@ static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
 			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
+	struct tegra_smmu *smmu = as->smmu;
+	unsigned long flags;
 	dma_addr_t pte_dma;
 	u32 pte_attrs;
 	u32 *pte;
 
+	spin_lock_irqsave(&smmu->as_lock, flags);
 	pte = as_get_pte(as, iova, &pte_dma);
-	if (!pte)
+	if (!pte) {
+		spin_unlock_irqrestore(&smmu->as_lock, flags);
 		return -ENOMEM;
+	}
 
 	/* If we aren't overwriting a pre-existing entry, increment use */
 	if (*pte == 0)
 		tegra_smmu_pte_get_use(as, iova);
+	spin_unlock_irqrestore(&smmu->as_lock, flags);
 
 	pte_attrs = SMMU_PTE_NONSECURE;
 
@@ -694,6 +701,8 @@ static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 			       size_t size, struct iommu_iotlb_gather *gather)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
+	struct tegra_smmu *smmu = as->smmu;
+	unsigned long flags;
 	dma_addr_t pte_dma;
 	u32 *pte;
 
@@ -702,7 +711,10 @@ static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 		return 0;
 
 	tegra_smmu_set_pte(as, iova, pte, pte_dma, 0);
+
+	spin_lock_irqsave(&smmu->as_lock, flags);
 	tegra_smmu_pte_put_use(as, iova);
+	spin_unlock_irqrestore(&smmu->as_lock, flags);
 
 	return size;
 }
@@ -1033,6 +1045,7 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 
 	INIT_LIST_HEAD(&smmu->groups);
 	mutex_init(&smmu->lock);
+	spin_lock_init(&smmu->as_lock);
 
 	smmu->regs = mc->regs;
 	smmu->soc = soc;
-- 
2.17.1
