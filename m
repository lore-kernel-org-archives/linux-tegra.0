From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v2 3/3] staging: nvec: add device tree support
Date: Wed, 26 Oct 2011 21:59:22 +0200
Message-ID: <48050ec08d248a2a10b4f5faf6cac6b214041ebe.1319658296.git.marvin24@gmx.de>
References: <cover.1319658296.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds device tree support to the nvec driver. By using this method
it is no longer necessary to specify platform data through a board
file.

Cc: devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org
Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 drivers/staging/nvec/nvec.c |   39 +++++++++++++++++++++++++++++++++++++--
 1 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index fb0f095..731eeeb 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -26,6 +26,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/list.h>
 #include <linux/mfd/core.h>
 #include <linux/mutex.h>
@@ -35,6 +37,8 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
+#include <asm/byteorder.h>
+
 #include <mach/clk.h>
 #include <mach/iomap.h>
 
@@ -718,6 +722,7 @@ static int __devinit tegra_nvec_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct resource *iomem;
 	void __iomem *base;
+	const unsigned int *prop;
 
 	nvec = kzalloc(sizeof(struct nvec_chip), GFP_KERNEL);
 	if (nvec == NULL) {
@@ -726,8 +731,26 @@ static int __devinit tegra_nvec_probe(struct platform_device *pdev)
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
+		prop = of_get_property(nvec->dev->of_node, "slave-addr", NULL);
+		if (!prop) {
+			dev_err(&pdev->dev, "no i2c address specified");
+			goto failed;
+		}
+		nvec->i2c_addr = be32_to_cpup(prop);
+	} else {
+		dev_err(&pdev->dev, "no platform data\n");
+		goto failed;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -892,6 +915,17 @@ static int tegra_nvec_resume(struct platform_device *pdev)
 #define tegra_nvec_resume NULL
 #endif
 
+#if defined(CONFIG_OF)
+/* Match table for of_platform binding */
+static const struct of_device_id nvidia_nvec_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,nvec", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, nvidia_nvec_of_match);
+#else
+#define nvidia_nvec_of_match NULL
+#endif
+
 static struct platform_driver nvec_device_driver = {
 	.probe   = tegra_nvec_probe,
 	.remove  = __devexit_p(tegra_nvec_remove),
@@ -900,6 +934,7 @@ static struct platform_driver nvec_device_driver = {
 	.driver  = {
 		.name = "nvec",
 		.owner = THIS_MODULE,
+		.of_match_table = nvidia_nvec_of_match,
 	}
 };
 
-- 
1.7.5.4
