From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 7/7] pwm-backlight: Add rudimentary device-tree support
Date: Tue, 20 Dec 2011 11:32:18 +0100
Message-ID: <1324377138-32129-8-git-send-email-thierry.reding@avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324377138-32129-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This commit adds very basic support for device-tree probing. Currently,
only a PWM and maximum and default brightness values can be specified.
Enabling or disabling backlight power via GPIOs is not yet supported.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 .../bindings/video/backlight/pwm-backlight         |   16 +++++
 drivers/video/backlight/Kconfig                    |    2 +-
 drivers/video/backlight/pwm_bl.c                   |   70 ++++++++++++++++++-
 3 files changed, 83 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/pwm-backlight

diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight b/Documentation/devicetree/bindings/video/backlight/pwm-backlight
new file mode 100644
index 0000000..ce65280
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight
@@ -0,0 +1,16 @@
+pwm-backlight bindings
+
+Required properties:
+  - compatible: "pwm-backlight"
+  - default-brightness: the default brightness setting
+  - max-brightness: the maximum brightness setting
+  - pwm: OF device-tree PWM specification
+
+Example:
+
+	backlight {
+		compatible = "pwm-backlight";
+		default-brightness = <224>;
+		max-brightness = <255>;
+		pwm = <&pwm 0 5000000>;
+	};
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 278aeaa..51c3642 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -233,7 +233,7 @@ config BACKLIGHT_CARILLO_RANCH
 
 config BACKLIGHT_PWM
 	tristate "Generic PWM based Backlight Driver"
-	depends on HAVE_PWM
+	depends on HAVE_PWM || PWM
 	help
 	  If you have a LCD backlight adjustable by PWM, say Y to enable
 	  this driver.
diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 8b5b2a4..742934c 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -17,6 +17,7 @@
 #include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/err.h>
+#include <linux/of_pwm.h>
 #include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/slab.h>
@@ -83,17 +84,77 @@ static const struct backlight_ops pwm_backlight_ops = {
 	.check_fb	= pwm_backlight_check_fb,
 };
 
+#ifdef CONFIG_OF
+static int pwm_backlight_parse_dt(struct device *dev,
+				  struct platform_pwm_backlight_data *data)
+{
+	struct device_node *node = dev->of_node;
+	u32 value;
+	int ret;
+
+	if (!node)
+		return -ENODEV;
+
+	memset(data, 0, sizeof(*data));
+
+	ret = of_get_named_pwm(node, "pwm", 0, &data->pwm_period_ns);
+	if (ret < 0)
+		return ret;
+
+	data->pwm_id = ret;
+
+	ret = of_property_read_u32(node, "default-brightness", &value);
+	if (ret < 0)
+		return ret;
+
+	data->dft_brightness = value;
+
+	ret = of_property_read_u32(node, "max-brightness", &value);
+	if (ret < 0)
+		return ret;
+
+	data->max_brightness = value;
+
+	/*
+	 * TODO: Most users of this driver use a number of GPIOs to control
+	 *       backlight power. Support for specifying these needs to be
+	 *       added.
+	 */
+
+	return 0;
+}
+
+static struct of_device_id pwm_backlight_of_match[] = {
+	{ .compatible = "pwm-backlight" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, pwm_backlight_of_match);
+#else
+static int pwm_backlight_parse_dt(struct device *dev,
+				  struct platform_pwm_backlight_data *data)
+{
+	return -ENODEV;
+}
+#endif
+
 static int pwm_backlight_probe(struct platform_device *pdev)
 {
 	struct backlight_properties props;
 	struct platform_pwm_backlight_data *data = pdev->dev.platform_data;
+	struct platform_pwm_backlight_data defdata;
 	struct backlight_device *bl;
 	struct pwm_bl_data *pb;
 	int ret;
 
 	if (!data) {
-		dev_err(&pdev->dev, "failed to find platform data\n");
-		return -EINVAL;
+		ret = pwm_backlight_parse_dt(&pdev->dev, &defdata);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to find platform data\n");
+			return ret;
+		}
+
+		data = &defdata;
 	}
 
 	if (data->init) {
@@ -198,8 +259,9 @@ static int pwm_backlight_resume(struct platform_device *pdev)
 
 static struct platform_driver pwm_backlight_driver = {
 	.driver		= {
-		.name	= "pwm-backlight",
-		.owner	= THIS_MODULE,
+		.name		= "pwm-backlight",
+		.owner		= THIS_MODULE,
+		.of_match_table	= of_match_ptr(pwm_backlight_of_match),
 	},
 	.probe		= pwm_backlight_probe,
 	.remove		= pwm_backlight_remove,
-- 
1.7.8
