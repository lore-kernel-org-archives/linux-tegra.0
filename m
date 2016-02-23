From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/2] drm/tegra: Set DMA ops
Date: Tue, 23 Feb 2016 15:25:53 +0900
Message-ID: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The current settings leaves the DRM device's dma_ops field NULL, which
makes it use the dummy DMA ops on arm64 and return an error whenever we
try to import a buffer. Call of_dma_configure() with a NULL node (since
the device is not spawn from the device tree) so that
arch_setup_dma_ops() is called and sets the default ioswtlb DMA ops.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index d347188bf8f4..bc0555adecaf 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -9,6 +9,7 @@
 
 #include <linux/host1x.h>
 #include <linux/iommu.h>
+#include <linux/of_device.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -990,6 +991,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		return -ENOMEM;
 
 	dev_set_drvdata(&dev->dev, drm);
+	of_dma_configure(drm->dev, NULL);
 
 	err = drm_dev_register(drm, 0);
 	if (err < 0)
-- 
2.7.1
