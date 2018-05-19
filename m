From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] gpu: host1x: Skip IOMMU initialization if firewall is enabled
Date: Sat, 19 May 2018 04:07:10 +0300
Message-ID: <20180519010710.11693-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Host1x's CDMA can't access the command buffers if IOMMU and Host1x
firewall are enabled in the kernels config because firewall doesn't map
the copied buffer into IOVA space. Fix this by skipping IOMMU
initialization if firewall is enabled as firewall merges sparse cmdbufs
into a single contiguous buffer and hence IOMMU isn't needed in this case.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index f1d5f76e9c33..d88073e7d22d 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -218,6 +218,9 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		goto skip_iommu;
+
 	host->group = iommu_group_get(&pdev->dev);
 	if (host->group) {
 		struct iommu_domain_geometry *geometry;
-- 
2.17.0
