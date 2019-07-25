From: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] media: staging: tegra-vde: Fix build error
Date: Thu, 25 Jul 2019 10:41:29 +0800
Message-ID: <20190725024129.22664-1-yuehaibing@huawei.com>
References: <dc354ede-5963-cd7f-ee53-f3df3061d39a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <dc354ede-5963-cd7f-ee53-f3df3061d39a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

If IOMMU_SUPPORT is not set, and COMPILE_TEST is y,
IOMMU_IOVA may be set to m. So building will fails:

drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
iommu.c:(.text+0x41): undefined reference to `alloc_iova'
iommu.c:(.text+0x56): undefined reference to `__free_iova'

Select IOMMU_IOVA while COMPILE_TEST is set to fix this.

Reported-by: Hulk Robot <hulkci-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Suggested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
Signed-off-by: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/staging/media/tegra-vde/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index 2e7f644..ba49ea5 100644
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
2.7.4
