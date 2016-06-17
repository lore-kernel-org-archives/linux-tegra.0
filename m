From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 08/13] i2c: core: Add support for 'i2c-bus' subnode
Date: Fri, 17 Jun 2016 13:03:42 +0100
Message-ID: <1466165027-17917-9-git-send-email-jonathanh@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If the 'i2c-bus' device-tree node is present for an I2C adapter then
parse this subnode for I2C slaves.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/i2c-core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 952d2f0c02c5..f552d97bad32 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -1452,7 +1452,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 
 static void of_i2c_register_devices(struct i2c_adapter *adap)
 {
-	struct device_node *node;
+	struct device_node *bus, *node;
 
 	/* Only register child devices if the adapter has a node pointer set */
 	if (!adap->dev.of_node)
@@ -1460,11 +1460,18 @@ static void of_i2c_register_devices(struct i2c_adapter *adap)
 
 	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
 
-	for_each_available_child_of_node(adap->dev.of_node, node) {
+	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
+	if (!bus)
+		bus = adap->dev.of_node;
+
+	for_each_available_child_of_node(bus, node) {
 		if (of_node_test_and_set_flag(node, OF_POPULATED))
 			continue;
 		of_i2c_register_device(adap, node);
 	}
+
+	if (bus != adap->dev.of_node)
+		of_node_put(bus);
 }
 
 static int of_dev_node_match(struct device *dev, void *data)
-- 
2.1.4
