From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] memory: tegra_ahb_enable_smmu() depends on TEGRA_IOMMU_SMMU
Date: Wed, 6 Feb 2013 20:34:26 +0200
Message-ID: <1360175666-8377-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

New SoC, Tegra114 also uses SMMU. Change tegra_ahb_enable_smmu()'s
dependency from ARCH_TEGRA_3x_SOC to TEGRA_IOMMU_SMMU. No need to edit
whenever a new Tegra SoC comes.

The following combination caused build error, which this patch fixes.

CONFIG_ARCH_TEGRA_2x_SOC=y
\# CONFIG_ARCH_TEGRA_3x_SOC is not set
CONFIG_ARCH_TEGRA_114_SOC=y

drivers/iommu/tegra-smmu.c:485: undefined reference to 'tegra_ahb_enable_smmu'

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/amba/tegra-ahb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index ab92785..093c435 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -130,7 +130,7 @@ static inline void gizmo_writel(struct tegra_ahb *ahb, u32 value, u32 offset)
 	writel(value, ahb->regs + offset);
 }
 
-#ifdef CONFIG_ARCH_TEGRA_3x_SOC
+#ifdef CONFIG_TEGRA_IOMMU_SMMU
 static int tegra_ahb_match_by_smmu(struct device *dev, void *data)
 {
 	struct tegra_ahb *ahb = dev_get_drvdata(dev);
-- 
1.7.9.5
