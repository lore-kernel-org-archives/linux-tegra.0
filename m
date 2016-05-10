From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 05/11] irqchip/gic: WARN if setting the interrupt type for a PPI fails
Date: Tue, 10 May 2016 16:14:39 +0100
Message-ID: <1462893285-13515-6-git-send-email-jonathanh@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462893285-13515-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Setting the interrupt type for private peripheral interrupts (PPIs) may
not be supported by a given GIC because it is IMPLEMENTATION DEFINED
whether this is allowed. There is no way to know if setting the type is
supported for a given GIC and so the value written is read back to
verify it matches the desired configuration. If it does not match then
an error is return.

There are cases where the interrupt configuration read from firmware
(such as a device-tree blob), has been incorrect and hence
gic_configure_irq() has returned an error. This error has gone
undetected because the error code returned was ignored but the interrupt
still worked fine because the configuration for the interrupt could not
be overwritten.

Given that this has done undetected and that failing to set the
configuration for a PPI may not be a catastrophic, don't return an error
but WARN if we fail to configure a PPI. This will allows us to fix up
any places in the kernel where we should be checking the return status
and maintain backward compatibility with firmware images that may have
incorrect PPI configurations.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 drivers/irqchip/irq-gic-common.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
index eeeefa244933..89e7423f0ebb 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -69,12 +69,20 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
 
 	/*
 	 * Write back the new configuration, and possibly re-enable
-	 * the interrupt. If we fail to write a new configuration,
-	 * return an error.
+	 * the interrupt. If we fail to write a new configuration for
+	 * an SPI then WARN and return an error. If we fail to write the
+	 * configuration for a PPI this is most likely because the GIC
+	 * does not allow us to set the configuration or we are in a
+	 * non-secure mode, and hence it may not be catastrophic.
 	 */
 	writel_relaxed(val, base + GIC_DIST_CONFIG + confoff);
-	if (readl_relaxed(base + GIC_DIST_CONFIG + confoff) != val)
-		ret = -EINVAL;
+	if (readl_relaxed(base + GIC_DIST_CONFIG + confoff) != val) {
+		if (WARN_ON(irq >= 32))
+			ret = -EINVAL;
+		else
+			pr_warn("GIC: PPI%d is secure or misconfigured\n",
+				irq - 16);
+	}
 
 	if (sync_access)
 		sync_access();
-- 
2.1.4
