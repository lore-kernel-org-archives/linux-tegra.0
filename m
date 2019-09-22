From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.3 054/203] media: staging: tegra-vde: Fix build error
Date: Sun, 22 Sep 2019 14:41:20 -0400
Message-ID: <20190922184350.30563-54-sashal@kernel.org>
References: <20190922184350.30563-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190922184350.30563-1-sashal@kernel.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, devel@driverdev.osuosl.org, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, YueHaibing <yuehaibing@huawei.com>, Hulk Robot <hulkci@huawei.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>

[ Upstream commit 6b2265975239ab655069d796b822835a593e1cc7 ]

If IOMMU_SUPPORT is not set, and COMPILE_TEST is y,
IOMMU_IOVA may be set to m. So building will fails:

drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
iommu.c:(.text+0x41): undefined reference to `alloc_iova'
iommu.c:(.text+0x56): undefined reference to `__free_iova'

Select IOMMU_IOVA while COMPILE_TEST is set to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Suggested-by: Dmitry Osipenko <digetx@gmail.com>
Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/tegra-vde/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index 2e7f644ae5911..ba49ea50b8c0b 100644
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ b/drivers/staging/media/tegra-vde/Kconfig
@@ -3,7 +3,7 @@ config TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	select DMA_SHARED_BUFFER
-	select IOMMU_IOVA if IOMMU_SUPPORT
+	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
 	select SRAM
 	help
 	    Say Y here to enable support for the NVIDIA Tegra video decoder
-- 
2.20.1
