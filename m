From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/3] media: staging: tegra-vde: Select IOVA unconditionally in Kconfig
Date: Sun, 15 Dec 2019 21:07:50 +0300
Message-ID: <20191215180752.5408-2-digetx@gmail.com>
References: <20191215180752.5408-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215180752.5408-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There were several reports of building failures due to IOVA being selected
inconsistently by different drivers. All drivers that are using IOVA API
should select it unconditionally in order to avoid the compilation
problems, tegra-vde is one of those drivers.

Link: https://patchwork.kernel.org/patch/11057831/
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index ba49ea50b8c0..0dc78afd09e0 100644
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ b/drivers/staging/media/tegra-vde/Kconfig
@@ -3,7 +3,7 @@ config TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	select DMA_SHARED_BUFFER
-	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
+	select IOMMU_IOVA
 	select SRAM
 	help
 	    Say Y here to enable support for the NVIDIA Tegra video decoder
-- 
2.24.0
