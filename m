From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] media: staging: tegra-vde: select DMA_SHARED_BUFFER
Date: Fri,  5 Jan 2018 10:43:27 +0100
Message-ID: <20180105094343.2813148-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Without CONFIG_DMA_SHARED_BUFFER we run into a link error for the
dma_buf_* APIs:

ERROR: "dma_buf_map_attachment" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
ERROR: "dma_buf_attach" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
ERROR: "dma_buf_get" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
ERROR: "dma_buf_put" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
ERROR: "dma_buf_detach" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
ERROR: "dma_buf_unmap_attachment" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/tegra-vde/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index ec3ddddebdaa..5c4914674468 100644
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ b/drivers/staging/media/tegra-vde/Kconfig
@@ -1,6 +1,7 @@
 config TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
+	select DMA_SHARED_BUFFER
 	select SRAM
 	help
 	    Say Y here to enable support for the NVIDIA Tegra video decoder
-- 
2.9.0
