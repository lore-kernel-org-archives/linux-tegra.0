From: Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] drm/tegra: vic: fix implicit function declaration warning
Date: Mon, 18 Feb 2019 12:00:50 +0100
Message-ID: <20190218110050.10589-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>
List-Id: linux-tegra@vger.kernel.org

When CONFIG_IOMMU_API isn't set the following warnings pops up:

drivers/gpu/drm/tegra/vic.c: In function ‘vic_boot’:
drivers/gpu/drm/tegra/vic.c:110:31: error: implicit declaration of function ‘dev_iommu_fwspec_get’; did you mean ‘iommu_fwspec_free’? [-Werror=implicit-function-declaration]
   struct iommu_fwspec *spec = dev_iommu_fwspec_get(vic->dev);
                               ^~~~~~~~~~~~~~~~~~~~
                               iommu_fwspec_free
drivers/gpu/drm/tegra/vic.c:110:31: warning: initialization of ‘struct iommu_fwspec *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
drivers/gpu/drm/tegra/vic.c:117:19: error: ‘struct iommu_fwspec’ has no member named ‘num_ids’
   if (spec && spec->num_ids > 0) {
                   ^~
drivers/gpu/drm/tegra/vic.c:118:16: error: ‘struct iommu_fwspec’ has no member named ‘ids’
    value = spec->ids[0] & 0xffff;
                ^~

Rework so that its inside a '#ifdef CONFIG_IOMMU_API' block.

Fixes: f3779cb190a5 ("drm/tegra: vic: Support stream ID register programming")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/gpu/drm/tegra/vic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 39bfed9623de..982ce37ecde1 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -106,6 +106,7 @@ static int vic_boot(struct vic *vic)
 	if (vic->booted)
 		return 0;
 
+#ifdef CONFIG_IOMMU_API
 	if (vic->config->supports_sid) {
 		struct iommu_fwspec *spec = dev_iommu_fwspec_get(vic->dev);
 		u32 value;
@@ -121,6 +122,7 @@ static int vic_boot(struct vic *vic)
 			vic_writel(vic, value, VIC_THI_STREAMID1);
 		}
 	}
+#endif
 
 	/* setup clockgating registers */
 	vic_writel(vic, CG_IDLE_CG_DLY_CNT(4) |
-- 
2.19.2
