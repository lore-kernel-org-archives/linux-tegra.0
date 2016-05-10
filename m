From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 04/11] irqchip/gic: Don't unnecessarily write the IRQ configuration
Date: Tue, 10 May 2016 16:14:38 +0100
Message-ID: <1462893285-13515-5-git-send-email-jonathanh@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If the interrupt configuration matches the current configuration, then
don't bother writing the configuration again.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/irqchip/irq-gic-common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
index 2e9443be2b14..eeeefa244933 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -63,13 +63,17 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
 	else if (type & IRQ_TYPE_EDGE_BOTH)
 		val |= confmask;
 
+	/* If the current configuration is the same, then we are done */
+	if (val == oldval)
+		return 0;
+
 	/*
 	 * Write back the new configuration, and possibly re-enable
-	 * the interrupt. If we tried to write a new configuration and failed,
+	 * the interrupt. If we fail to write a new configuration,
 	 * return an error.
 	 */
 	writel_relaxed(val, base + GIC_DIST_CONFIG + confoff);
-	if (readl_relaxed(base + GIC_DIST_CONFIG + confoff) != val && val != oldval)
+	if (readl_relaxed(base + GIC_DIST_CONFIG + confoff) != val)
 		ret = -EINVAL;
 
 	if (sync_access)
-- 
2.1.4
