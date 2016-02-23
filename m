From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] drm/tegra: Set the DMA mask
Date: Tue, 23 Feb 2016 15:25:54 +0900
Message-ID: <1456208754-12362-2-git-send-email-acourbot@nvidia.com>
References: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456208754-12362-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The default DMA mask covers a 32 bits address range, but tegradrm can
address more than that. Set the DMA mask to the actual addressable range
to avoid the use of unneeded bounce buffers.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Thierry, I am not absolutely sure whether the size is correct and applies
to all Tegra generations - please let me know if this needs to be
reworked.

 drivers/gpu/drm/tegra/drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bc0555adecaf..503fc9e73521 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -992,6 +992,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	dev_set_drvdata(&dev->dev, drm);
 	of_dma_configure(drm->dev, NULL);
+	dma_set_mask(drm->dev, DMA_BIT_MASK(34));
 
 	err = drm_dev_register(drm, 0);
 	if (err < 0)
-- 
2.7.1
