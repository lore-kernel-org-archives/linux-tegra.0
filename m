From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/3] net: rfkill-gpio: add device tree support
Date: Sun, 12 Feb 2012 20:13:06 +0100
Message-ID: <1ec0e63a7453072689618430ebc2bdd7b62542a2.1329073559.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds device tree support for rfkill-gpio. The optional platform
paramters gpio_runtime_close and gpio_runtime_setup are not implemented.

Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 include/linux/rfkill-gpio.h |    2 +-
 net/rfkill/rfkill-gpio.c    |   57 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletions(-)

diff --git a/include/linux/rfkill-gpio.h b/include/linux/rfkill-gpio.h
index 4d09f6e..76a9674 100644
--- a/include/linux/rfkill-gpio.h
+++ b/include/linux/rfkill-gpio.h
@@ -35,7 +35,7 @@
  */
 
 struct rfkill_gpio_platform_data {
-	char			*name;
+	const char		*name;
 	int			reset_gpio;
 	int			shutdown_gpio;
 	const char		*power_clk_name;
diff --git a/net/rfkill/rfkill-gpio.c b/net/rfkill/rfkill-gpio.c
index 865adb6..4db343d 100644
--- a/net/rfkill/rfkill-gpio.c
+++ b/net/rfkill/rfkill-gpio.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/rfkill.h>
+#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
@@ -77,13 +78,68 @@ static const struct rfkill_ops rfkill_gpio_ops = {
 	.set_block = rfkill_gpio_set_power,
 };
 
+#ifdef CONFIG_OF
+static struct rfkill_gpio_platform_data * __devinit
+			rfkill_gpio_parse_pdata(struct platform_device *pdev)
+{
+	struct rfkill_gpio_platform_data *pdata, *rfkill;
+	struct device_node *np = pdev->dev.of_node, *child;
+	int count = 0;
+
+	for_each_child_of_node(np, child)
+		count++;
+	if (!count)
+		return NULL;
+
+	pdata = devm_kzalloc(&pdev->dev,
+				sizeof(struct rfkill_gpio_platform_data) *
+				count, GFP_KERNEL);
+	if (!pdata)
+		return NULL;
+
+	rfkill = pdata;
+
+	for_each_child_of_node(np, child) {
+		of_property_read_string(child, "label", &rfkill->name);
+		if (!rfkill->name)
+			rfkill->name = child->name;
+		rfkill->reset_gpio = of_get_named_gpio(child, "reset-gpio", 0);
+		rfkill->shutdown_gpio = of_get_named_gpio(child,
+							  "shutdown-gpio", 0);
+		of_property_read_u32(child, "type", &rfkill->type);
+		of_property_read_string(child, "clock",
+					&rfkill->power_clk_name);
+
+		rfkill += sizeof(struct rfkill_gpio_platform_data);
+	}
+
+	return pdata;
+}
+
+static const struct of_device_id of_rfkill_gpio_match[] = {
+	{ .compatible = "rfkill-gpio", },
+	{},
+};
+
+#else
+static inline struct rfkill_gpio_platform_data
+			*rfkill_gpio_parse_pdata(struct platform_device *pdev)
+{
+	return NULL;
+}
+#endif
+
 static int rfkill_gpio_probe(struct platform_device *pdev)
 {
 	struct rfkill_gpio_data *rfkill;
 	struct rfkill_gpio_platform_data *pdata = pdev->dev.platform_data;
+	struct device_node *np = pdev->dev.of_node;
 	int ret = 0;
 	int len = 0;
 
+	if (np)
+		pdata = rfkill_gpio_parse_pdata(pdev);
+
 	if (!pdata) {
 		pr_warn("%s: No platform data specified\n", __func__);
 		return -EINVAL;
@@ -217,6 +273,7 @@ static struct platform_driver rfkill_gpio_driver = {
 	.driver = {
 		   .name = "rfkill_gpio",
 		   .owner = THIS_MODULE,
+		   .of_match_table = of_match_ptr(of_rfkill_gpio_match),
 	},
 };
 
-- 
1.7.5.4
