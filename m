From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] media: staging: tegra-vde: Disable building with COMPILE_TEST
Date: Mon, 26 Aug 2019 21:31:40 +0800
Message-ID: <20190826133140.13456-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: digetx@gmail.com, mchehab@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, robin.murphy@arm.com, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
to m will set IOMMU_IOVA to m, this fails the building of
TEGRA_HOST1X and DRM_TEGRA which is y like this:

drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
cdma.c:(.text+0x698): undefined reference to `__free_iova'

drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/media/tegra-vde/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index ba49ea5..a41d30c 100644
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ b/drivers/staging/media/tegra-vde/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 config TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
-	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on ARCH_TEGRA
 	select DMA_SHARED_BUFFER
-	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
+	select IOMMU_IOVA if IOMMU_SUPPORT
 	select SRAM
 	help
 	    Say Y here to enable support for the NVIDIA Tegra video decoder
-- 
2.7.4
