From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] gpu: host1x: Fix compile test failure
Date: Wed, 30 Oct 2019 21:54:58 +0800
Message-ID: <20191030135458.27960-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, mperttunen@nvidia.com, arnd@arndb.de, seanpaul@chromium.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

If IOMMU_SUPPORT is not set, but IOMMU_IOVA is m and
COMPILE_TEST is y, building fails:

drivers/gpu/host1x/dev.o: In function `host1x_remove':
dev.c:(.text+0x624): undefined reference to `put_iova_domain'
dev.c:(.text+0x624): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `put_iova_domain'
dev.c:(.text+0x62c): undefined reference to `iova_cache_put'
dev.c:(.text+0x62c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `iova_cache_put'

Select IOMMU_IOVA while COMPILE_TEST is set to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 52499a6ad2ae ("gpu: host1x: select IOMMU_IOVA")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/host1x/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index cf987a3..354232d 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -2,7 +2,7 @@
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
 	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
-	select IOMMU_IOVA if IOMMU_SUPPORT
+	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
 
-- 
2.7.4
