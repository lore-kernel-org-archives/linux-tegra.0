From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 2/2] gpu: host1x: Set DMA ops on device creation
Date: Fri, 26 Feb 2016 18:06:53 +0900
Message-ID: <1456477613-24995-2-git-send-email-acourbot@nvidia.com>
References: <1456477613-24995-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456477613-24995-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Currently host1x-instanciated devices have their dma_ops left to NULL,
which makes any DMA operation (like buffer import) on ARM64 fallback
to the dummy_dma_ops and fail with an error.

This patch calls of_dma_configure() with the host1x node when creating
such a device, so the proper DMA operations are set.

Suggested-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/bus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index c2e7fba370bb..c27858ae0552 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -18,6 +18,7 @@
 #include <linux/host1x.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/of_device.h>
 
 #include "bus.h"
 #include "dev.h"
@@ -396,6 +397,7 @@ static int host1x_device_add(struct host1x *host1x,
 	device->dev.coherent_dma_mask = host1x->dev->coherent_dma_mask;
 	device->dev.dma_mask = &device->dev.coherent_dma_mask;
 	dev_set_name(&device->dev, "%s", driver->driver.name);
+	of_dma_configure(&device->dev, host1x->dev->of_node);
 	device->dev.release = host1x_device_release;
 	device->dev.bus = &host1x_bus_type;
 	device->dev.parent = host1x->dev;
-- 
2.7.1
