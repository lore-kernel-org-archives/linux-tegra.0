From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 14/21] iommu/tegra124: smmu: convert swgroup ID to asid offset
Date: Fri, 30 May 2014 14:20:27 +0300
Message-ID: <1401448834-32659-15-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Provide a conversion table from swgroup ID to MC_SMMU_<swgroup
name>_ASID_0 register offset to support non-linear conversion. This
conversion used to be exactly linear but after T124 we need a
conversion table to support non-linear cases. We would also need
another table to convert swgroup ID to HOTRESET bit.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 20dddc305fb2..080dbda874e5 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -184,8 +184,6 @@ enum {
 #define __smmu_client_enable_swgroups(c, m) __smmu_client_set_swgroups(c, m, 1)
 #define __smmu_client_disable_swgroups(c) __smmu_client_set_swgroups(c, 0, 0)
 
-#define SWGROUPS_ASID_REG(x) ((x) * sizeof(u32) + SMMU_ASID_BASE)
-
 /*
  * Per client for address space
  */
@@ -314,6 +312,23 @@ static inline void smmu_write(struct smmu_device *smmu, u32 val, size_t offs)
  */
 #define FLUSH_SMMU_REGS(smmu)	smmu_read(smmu, SMMU_CONFIG)
 
+static size_t smmu_get_asid_offset(int id)
+{
+	switch (id) {
+	case TEGRA_SWGROUP_DC14:
+		return 0x490;
+	case TEGRA_SWGROUP_DC12:
+		return 0xa88;
+	case TEGRA_SWGROUP_AFI...TEGRA_SWGROUP_ISP:
+	case TEGRA_SWGROUP_MPE...TEGRA_SWGROUP_PPCS1:
+		return (id - TEGRA_SWGROUP_AFI) * sizeof(u32) + SMMU_ASID_BASE;
+	case TEGRA_SWGROUP_SDMMC1A...63:
+		return (id - TEGRA_SWGROUP_SDMMC1A) * sizeof(u32) + 0xa94;
+	};
+
+	BUG();
+}
+
 static struct smmu_client *find_smmu_client(struct smmu_device *smmu,
 					    struct device_node *dev_node)
 {
@@ -415,7 +430,7 @@ static int __smmu_client_set_swgroups(struct smmu_client *c,
 		map = c->swgroups;
 
 	for_each_set_bit(i, map, TEGRA_SWGROUP_MAX) {
-		offs = SWGROUPS_ASID_REG(i);
+		offs = smmu_get_asid_offset(i);
 		val = smmu_read(smmu, offs);
 		if (on) {
 			if (val) {
-- 
2.0.0.rc1.15.g7e76a2f
