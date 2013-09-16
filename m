From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/9] of/irq: Rework of_irq_count()
Date: Mon, 16 Sep 2013 10:31:58 +0200
Message-ID: <1379320326-13241-2-git-send-email-treding@nvidia.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379320326-13241-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The of_irq_to_resource() helper that is used to implement of_irq_count()
tries to resolve interrupts and in fact creates a mapping for resolved
interrupts. That's pretty heavy lifting for something that claims to
just return the number of interrupts requested by a given device node.

Instead, use the more lightweight of_irq_map_one(), which, despite the
name, doesn't create an actual mapping. Perhaps a better name would be
of_irq_translate_one().

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/irq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 1752988..5f44388 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -368,9 +368,10 @@ EXPORT_SYMBOL_GPL(of_irq_to_resource);
  */
 int of_irq_count(struct device_node *dev)
 {
+	struct of_irq irq;
 	int nr = 0;
 
-	while (of_irq_to_resource(dev, nr, NULL))
+	while (of_irq_map_one(dev, nr, &irq) == 0)
 		nr++;
 
 	return nr;
-- 
1.8.4
