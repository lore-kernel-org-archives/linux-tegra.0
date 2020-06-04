From: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dmaengine: tegra210-adma: handle pm_runtime_get_sync failure cases
Date: Thu,  4 Jun 2020 15:10:58 -0500
Message-ID: <20200604201058.86457-1-navid.emamdoost@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: emamd001-OJFnDUYgAso@public.gmane.org, wu000273-OJFnDUYgAso@public.gmane.org, kjlu-OJFnDUYgAso@public.gmane.org, mccamant-k0Ej6N9cQa43uPMLIKxrzw@public.gmane.org, Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count. Call pm_runtime_put if
pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra210-adma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index c4ce5dfb149b..899eaaf9fc48 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -659,6 +659,7 @@ static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
 	ret = pm_runtime_get_sync(tdc2dev(tdc));
 	if (ret < 0) {
 		free_irq(tdc->irq, tdc);
+		pm_runtime_put(tdc2dev(tdc));
 		return ret;
 	}
 
@@ -870,7 +871,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		goto rpm_disable;
+		goto rpm_put;
 
 	ret = tegra_adma_init(tdma);
 	if (ret)
-- 
2.17.1
