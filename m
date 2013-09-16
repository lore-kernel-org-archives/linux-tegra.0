From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/9] of/irq: Introduce __of_irq_to_resource()
Date: Mon, 16 Sep 2013 10:32:02 +0200
Message-ID: <1379320326-13241-6-git-send-email-treding@nvidia.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379320326-13241-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This is a version of of_irq_to_resource() that propagates the precise
error code instead of returning 0 for all errors. It will be used in
subsequent patches to allow further propagation of error codes.

To avoid code duplication, implement of_irq_to_resource() as a wrapper
around the new __of_irq_to_resource().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/irq.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 8225289..57396fd 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -343,15 +343,15 @@ int of_irq_map_one(struct device_node *device, int index, struct of_irq *out_irq
 }
 EXPORT_SYMBOL_GPL(of_irq_map_one);
 
-/**
- * of_irq_to_resource - Decode a node's IRQ and return it as a resource
- * @dev: pointer to device tree node
- * @index: zero-based index of the irq
- * @r: pointer to resource structure to return result into.
- */
-int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
+static int __of_irq_to_resource(struct device_node *dev, unsigned int index,
+				struct resource *r)
 {
-	int irq = irq_of_parse_and_map(dev, index);
+	unsigned int irq;
+	int ret;
+
+	ret = of_irq_get(dev, index, &irq);
+	if (ret)
+		return ret;
 
 	/* Only dereference the resource if both the
 	 * resource and the irq are valid. */
@@ -373,6 +373,23 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
 
 	return irq;
 }
+
+/**
+ * of_irq_to_resource - Decode a node's IRQ and return it as a resource
+ * @dev: pointer to device tree node
+ * @index: zero-based index of the irq
+ * @r: pointer to resource structure to return result into.
+ */
+int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
+{
+	int ret;
+
+	ret = __of_irq_to_resource(dev, index, r);
+	if (ret < 0)
+		return 0;
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(of_irq_to_resource);
 
 /**
-- 
1.8.4
