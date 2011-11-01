From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/3] staging: nvec: add device tree support
Date: Tue,  1 Nov 2011 21:37:04 +0100
Message-ID: <95b67a12e2b6ea6a9c7e17b0069ec7c9fc6f719c.1320173573.git.marvin24@gmx.de>
References: <cover.1320173572.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1320173572.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1320173572.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1320173572.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds device tree support to the nvec driver. By using this method
it is no longer necessary to specify platform data through a board
file.

Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 .../devicetree/bindings/nvec/nvec_nvidia.txt       |    9 ++++++
 drivers/staging/nvec/nvec.c                        |   30 ++++++++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvec/nvec_nvidia.txt

diff --git a/Documentation/devicetree/bindings/nvec/nvec_nvidia.txt b/Documentation/devicetree/bindings/nvec/nvec_nvidia.txt
new file mode 100644
index 0000000..5aeee53
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvec/nvec_nvidia.txt
@@ -0,0 +1,9 @@
+NVIDIA compliant embedded controller
+
+Required properties:
+- compatible : should be "nvidia,nvec".
+- reg : the iomem of the i2c slave controller
+- interrupts : the interrupt line of the i2c slave controller
+- clock-frequency : the frequency of the i2c bus
+- gpios : the gpio used for ec request
+- slave-addr: the i2c address of the slave controller
diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e06b867..fafdfa2 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -27,6 +27,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/list.h>
 #include <linux/mfd/core.h>
 #include <linux/mutex.h>
@@ -727,8 +729,24 @@ static int __devinit tegra_nvec_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, nvec);
 	nvec->dev = &pdev->dev;
-	nvec->gpio = pdata->gpio;
-	nvec->i2c_addr = pdata->i2c_addr;
+
+	if (pdata) {
+		nvec->gpio = pdata->gpio;
+		nvec->i2c_addr = pdata->i2c_addr;
+	} else if (nvec->dev->of_node) {
+		nvec->gpio = of_get_named_gpio(nvec->dev->of_node, "request-gpios", 0);
+		if (nvec->gpio < 0) {
+			dev_err(&pdev->dev, "no gpio specified");
+			goto failed;
+		}
+		if (of_property_read_u32(nvec->dev->of_node, "slave-addr", &nvec->i2c_addr)) {
+			dev_err(&pdev->dev, "no i2c address specified");
+			goto failed;
+		}
+	} else {
+		dev_err(&pdev->dev, "no platform data\n");
+		goto failed;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -893,6 +911,13 @@ static int tegra_nvec_resume(struct platform_device *pdev)
 #define tegra_nvec_resume NULL
 #endif
 
+/* Match table for of_platform binding */
+static const struct of_device_id nvidia_nvec_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,nvec", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, nvidia_nvec_of_match);
+
 static struct platform_driver nvec_device_driver = {
 	.probe   = tegra_nvec_probe,
 	.remove  = __devexit_p(tegra_nvec_remove),
@@ -901,6 +926,7 @@ static struct platform_driver nvec_device_driver = {
 	.driver  = {
 		.name = "nvec",
 		.owner = THIS_MODULE,
+		.of_match_table = nvidia_nvec_of_match,
 	}
 };
 
-- 
1.7.5.4
