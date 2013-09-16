From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/9] of/irq: Introduce of_irq_get()
Date: Mon, 16 Sep 2013 10:32:01 +0200
Message-ID: <1379320326-13241-5-git-send-email-treding@nvidia.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379320326-13241-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This is a version of irq_of_parse_and_map() that propagates the precise
error code instead of returning 0 for all errors. It will be used in
subsequent patches to allow further propagation of error codes.

To avoid code duplication, implement irq_of_parse_and_map() as a wrapper
around the new of_irq_get().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/irq.c       | 21 +++++++++++++++++----
 include/linux/of_irq.h |  3 +++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 5f44388..8225289 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -26,6 +26,20 @@
 #include <linux/string.h>
 #include <linux/slab.h>
 
+int of_irq_get(struct device_node *dev, unsigned int index, unsigned int *virqp)
+{
+	struct of_irq oirq;
+	int ret;
+
+	ret = of_irq_map_one(dev, index, &oirq);
+	if (ret)
+		return ret;
+
+	return __irq_create_of_mapping(oirq.controller, oirq.specifier,
+				       oirq.size, virqp);
+}
+EXPORT_SYMBOL_GPL(of_irq_get);
+
 /**
  * irq_of_parse_and_map - Parse and map an interrupt into linux virq space
  * @dev: Device node of the device whose interrupt is to be mapped
@@ -36,13 +50,12 @@
  */
 unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 {
-	struct of_irq oirq;
+	unsigned int virq;
 
-	if (of_irq_map_one(dev, index, &oirq))
+	if (of_irq_get(dev, index, &virq))
 		return 0;
 
-	return irq_create_of_mapping(oirq.controller, oirq.specifier,
-				     oirq.size);
+	return virq;
 }
 EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
 
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index c383dd1..cac15d7 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -17,6 +17,9 @@ struct of_irq;
  */
 extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
 
+extern int of_irq_get(struct device_node *node, unsigned int index,
+		      unsigned int *virqp);
+
 #if defined(CONFIG_OF_IRQ)
 /**
  * of_irq - container for device_node/irq_specifier pair for an irq controller
-- 
1.8.4
