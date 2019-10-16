From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] iommu/tegra-smmu: Fix client enablement order
Date: Wed, 16 Oct 2019 13:50:25 +0200
Message-ID: <20191016115026.1768745-2-thierry.reding@gmail.com>
References: <20191016115026.1768745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20191016115026.1768745-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Navneet Kumar <navneetk-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Enable clients' translation only after setting up the swgroups.

Signed-off-by: Navneet Kumar <navneetk-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 03e667480ec6..9425d01a95ac 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -351,6 +351,20 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 	unsigned int i;
 	u32 value;
 
+	group = tegra_smmu_find_swgroup(smmu, swgroup);
+	if (group) {
+		value = smmu_readl(smmu, group->reg);
+		value &= ~SMMU_ASID_MASK;
+		value |= SMMU_ASID_VALUE(asid);
+		value |= SMMU_ASID_ENABLE;
+		smmu_writel(smmu, value, group->reg);
+	} else {
+		pr_warn("%s group from swgroup %u not found\n", __func__,
+				swgroup);
+		/* No point moving ahead if group was not found */
+		return;
+	}
+
 	for (i = 0; i < smmu->soc->num_clients; i++) {
 		const struct tegra_mc_client *client = &smmu->soc->clients[i];
 
@@ -361,15 +375,6 @@ static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgroup,
 		value |= BIT(client->smmu.bit);
 		smmu_writel(smmu, value, client->smmu.reg);
 	}
-
-	group = tegra_smmu_find_swgroup(smmu, swgroup);
-	if (group) {
-		value = smmu_readl(smmu, group->reg);
-		value &= ~SMMU_ASID_MASK;
-		value |= SMMU_ASID_VALUE(asid);
-		value |= SMMU_ASID_ENABLE;
-		smmu_writel(smmu, value, group->reg);
-	}
 }
 
 static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
-- 
2.23.0
