From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 13/14] dmaengine: tegra-apb: Allow to compile as a loadable kernel module
Date: Fri, 24 Jan 2020 02:03:24 +0300
Message-ID: <20200123230325.3037-14-digetx@gmail.com>
References: <20200123230325.3037-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200123230325.3037-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The driver's removal was fixed by a recent commit and module load/unload
is working well now, tested on Tegra30.

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 312a6cc36c78..d765db9b7b21 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -595,7 +595,7 @@ config TXX9_DMAC
 	  integrated in chips such as the Toshiba TX4927/38/39.
 
 config TEGRA20_APB_DMA
-	bool "NVIDIA Tegra20 APB DMA support"
+	tristate "NVIDIA Tegra20 APB DMA support"
 	depends on ARCH_TEGRA
 	select DMA_ENGINE
 	help
-- 
2.24.0
