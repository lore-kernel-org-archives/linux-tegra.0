From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 10/21] iommu/tegra: smmu: allow duplicate ASID wirte
Date: Fri, 30 May 2014 14:20:23 +0300
Message-ID: <1401448834-32659-11-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The device, which belongs to the same ASID, can try to enable the same
ASID as the other swgroup devices. This should be allowed but just
skip the actual register write. If the write value is different, it
will return -EINVAL.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1d3f695d3c66..caa531cb1c50 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -417,9 +417,13 @@ static int __smmu_client_set_hwgrp(struct smmu_client *c,
 		offs = HWGRP_ASID_REG(i);
 		val = smmu_read(smmu, offs);
 		if (on) {
-			if (WARN_ON(val & mask))
-				goto err_hw_busy;
-			val |= mask;
+			if (val) {
+				if (WARN_ON(val != mask))
+					return -EINVAL;
+				goto skip;
+			}
+
+			val = mask;
 			memcpy(c->hwgrp, map, sizeof(u64));
 		} else {
 			WARN_ON((val & mask) == mask);
@@ -429,16 +433,8 @@ static int __smmu_client_set_hwgrp(struct smmu_client *c,
 	}
 
 	FLUSH_SMMU_REGS(smmu);
+skip:
 	return 0;
-
-err_hw_busy:
-	for_each_set_bit(i, map, TEGRA_SWGROUP_MAX) {
-		offs = HWGRP_ASID_REG(i);
-		val = smmu_read(smmu, offs);
-		val &= ~mask;
-		smmu_write(smmu, val, offs);
-	}
-	return -EBUSY;
 }
 
 static int smmu_client_set_hwgrp(struct smmu_client *c,
-- 
2.0.0.rc1.15.g7e76a2f
