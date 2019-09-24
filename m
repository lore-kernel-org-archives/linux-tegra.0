From: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 09/11] of: device: remove comment in of_dma_configure()
Date: Tue, 24 Sep 2019 20:12:40 +0200
Message-ID: <20190924181244.7159-10-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mbrugger-IBi9RG/b67k@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, james.quinlan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, wahrenst-hi6Y0CQ0nG0@public.gmane.org, Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It's not longer advised to use notifiers in order to setup custom DMA
ops.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
---

 drivers/of/device.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 267b509df517..018c52688546 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -81,10 +81,6 @@ int of_device_add(struct platform_device *ofdev)
  *
  * Try to get devices's DMA configuration from DT and update it
  * accordingly.
- *
- * If platform code needs to use its own special DMA configuration, it
- * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE events
- * to fix up DMA configuration.
  */
 int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
 {
-- 
2.23.0
