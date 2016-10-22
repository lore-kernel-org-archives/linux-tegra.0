From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH] dma: tegra210-adma: convert TEGRA210_ADMA from bool to tristate
Date: Sat, 22 Oct 2016 18:25:10 -0400
Message-ID: <20161022222510.11373-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This driver currently uses modular infrastructure but is controlled
by a bool Kconfig.

There is a general consensus from the DMA reviewers and maintainers
that "if it can be modular, it should be modular" in order to keep
the bzImage size under control for multi platform kernels.

Build tested only.  Also needed some new pm_clk symbols exported
before this commit is applied to tree in order to avoid modpost
errors like:

  ERROR: "pm_clk_add_clk" [drivers/dma/tegra210-adma.ko] undefined!
  ERROR: "pm_clk_create" [drivers/dma/tegra210-adma.ko] undefined!
  ERROR: "pm_clk_destroy" [drivers/dma/tegra210-adma.ko] undefined!
  ERROR: "pm_clk_suspend" [drivers/dma/tegra210-adma.ko] undefined!
  ERROR: "pm_clk_resume" [drivers/dma/tegra210-adma.ko] undefined!

These were added as exports in the v4.8-rc1 merge window.

Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index af63a6bcf564..4595f5009244 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -479,7 +479,7 @@ config TEGRA20_APB_DMA
 	  or vice versa. It does not support memory to memory data transfer.
 
 config TEGRA210_ADMA
-	bool "NVIDIA Tegra210 ADMA support"
+	tristate "NVIDIA Tegra210 ADMA support"
 	depends on (ARCH_TEGRA_210_SOC || COMPILE_TEST) && PM_CLK
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
-- 
2.10.0
