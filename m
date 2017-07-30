From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] dmaengine: tegra210-adma: fix of_irq_get() error check
Date: Sun, 30 Jul 2017 21:10:44 +0300
Message-ID: <20170730181051.733168837@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=dmaengine-tegra210-adma-fix-of_irq_get-error-check.patch
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

of_irq_get() may return 0 as well as negative error number on failure,
while the driver only checks for the negative values. The driver would then
call request_irq(0, ...) in tegra_adma_alloc_chan_resources() and never get
valid channel interrupt.

Check for 'tdc->irq <= 0' instead and return -ENXIO from the driver's probe
iff of_irq_get() returned 0.

Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra210 ADMA")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/dma/tegra210-adma.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: slave-dma/drivers/dma/tegra210-adma.c
===================================================================
--- slave-dma.orig/drivers/dma/tegra210-adma.c
+++ slave-dma/drivers/dma/tegra210-adma.c
@@ -717,8 +717,8 @@ static int tegra_adma_probe(struct platf
 		tdc->chan_addr = tdma->base_addr + ADMA_CH_REG_OFFSET(i);
 
 		tdc->irq = of_irq_get(pdev->dev.of_node, i);
-		if (tdc->irq < 0) {
-			ret = tdc->irq;
+		if (tdc->irq <= 0) {
+			ret = tdc->irq ?: -ENXIO;
 			goto irq_dispose;
 		}
 
