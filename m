From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/9] of/irq: Propagate errors in of_irq_to_resource_table()
Date: Mon, 16 Sep 2013 10:32:03 +0200
Message-ID: <1379320326-13241-7-git-send-email-treding@nvidia.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379320326-13241-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Now that all helpers return precise error codes, this function can
propagate these errors to the caller properly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/irq.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 57396fd..c33a7fd 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -418,11 +418,17 @@ int of_irq_count(struct device_node *dev)
 int of_irq_to_resource_table(struct device_node *dev, struct resource *res,
 		int nr_irqs)
 {
-	int i;
+	int i, ret;
+
+	for (i = 0; i < nr_irqs; i++, res++) {
+		ret = __of_irq_to_resource(dev, i, res);
+		if (ret <= 0) {
+			if (ret < 0)
+				return ret;
 
-	for (i = 0; i < nr_irqs; i++, res++)
-		if (!of_irq_to_resource(dev, i, res))
 			break;
+		}
+	}
 
 	return i;
 }
-- 
1.8.4
