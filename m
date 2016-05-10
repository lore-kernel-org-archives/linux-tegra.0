From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 06/11] irqchip/gic: Don't initialise chip if mapping IO space fails
Date: Tue, 10 May 2016 16:14:40 +0100
Message-ID: <1462893285-13515-7-git-send-email-jonathanh@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If we fail to map the address space for the GIC distributor or CPU
interface, then don't attempt to initialise the chip, just WARN and
return.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/irqchip/irq-gic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 30d05a4639e4..070c87bbfce8 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1225,10 +1225,14 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 		return -ENODEV;
 
 	dist_base = of_iomap(node, 0);
-	WARN(!dist_base, "unable to map gic dist registers\n");
+	if (WARN(!dist_base, "unable to map gic dist registers\n"))
+		return -ENOMEM;
 
 	cpu_base = of_iomap(node, 1);
-	WARN(!cpu_base, "unable to map gic cpu registers\n");
+	if (WARN(!cpu_base, "unable to map gic cpu registers\n")) {
+		iounmap(dist_base);
+		return -ENOMEM;
+	}
 
 	/*
 	 * Disable split EOI/Deactivate if either HYP is not available
-- 
2.1.4
