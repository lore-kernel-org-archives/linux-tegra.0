From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH V2 4/8] irqchip/gic: Don't initialise chip if mapping IO space fails
Date: Thu, 17 Dec 2015 10:48:25 +0000
Message-ID: <1450349309-8107-5-git-send-email-jonathanh@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If we fail to map the address space for the GIC distributor or CPU
interface, then don't attempt to initialise the chip, just WARN and
return.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index abf2ffaed392..561a5cb5b8bc 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1208,10 +1208,14 @@ gic_of_init(struct device_node *node, struct device_node *parent)
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
