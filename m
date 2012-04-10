From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v6 15/17] pwm: add pwm-mxs support
Date: Tue, 10 Apr 2012 17:06:38 +0200
Message-ID: <1334070400-25013-16-git-send-email-thierry.reding@avionic-design.de>
References: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334070400-25013-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add generic PWM framework driver (DT only) for Freescale MXS.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v6:
- adopt patch by Shawn Guo

 Documentation/devicetree/bindings/pwm/mxs-pwm.txt |   17 ++
 drivers/pwm/Kconfig                               |    9 +
 drivers/pwm/Makefile                              |    1 +
 drivers/pwm/pwm-mxs.c                             |  207 +++++++++++++++++++++
 4 files changed, 234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/mxs-pwm.txt
 create mode 100644 drivers/pwm/pwm-mxs.c

diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.txt b/Documentation/devicetree/bindings/pwm/mxs-pwm.txt
new file mode 100644
index 0000000..48ead0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.txt
@@ -0,0 +1,17 @@
+Freescale MXS PWM controller
+
+Required properties:
+- compatible: should be "fsl,mxs-pwm"
+- reg: physical base address and length of the controller's registers
+- #pwm-cells: should be 2.  The first cell specifies the per-chip index
+  of the PWM to use and the second cell is the duty cycle in nanoseconds.
+- fsl,pwm-number: the number of PWM devices
+
+Example:
+
+pwm: pwm@80064000 {
+	compatible = "fsl,imx28-pwm", "fsl,mxs-pwm";
+	reg = <0x80064000 2000>;
+	#pwm-cells = <2>;
+	fsl,pwm-number = <8>;
+};
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index a93feff..39bdebc 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -27,6 +27,15 @@ config PWM_IMX
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-imx.
 
+config PWM_MXS
+	tristate "Freescale MXS PWM support"
+	depends on ARCH_MXS && OF
+	help
+	  Generic PWM framework driver for Freescale MXS.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-mxs.
+
 config PWM_PXA
 	tristate "PXA PWM support"
 	depends on ARCH_PXA
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index b7c0fcf..cec2500 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_PWM)		+= core.o
 obj-$(CONFIG_PWM_BFIN)		+= pwm-bfin.o
 obj-$(CONFIG_PWM_IMX)		+= pwm-imx.o
+obj-$(CONFIG_PWM_MXS)		+= pwm-mxs.o
 obj-$(CONFIG_PWM_PXA)		+= pwm-pxa.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_TEGRA)		+= pwm-tegra.o
diff --git a/drivers/pwm/pwm-mxs.c b/drivers/pwm/pwm-mxs.c
new file mode 100644
index 0000000..ebf91da
--- /dev/null
+++ b/drivers/pwm/pwm-mxs.c
@@ -0,0 +1,207 @@
+/*
+ * Copyright 2012 Freescale Semiconductor, Inc.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/slab.h>
+#include <mach/common.h>
+
+#define SET	0x4
+#define CLR	0x8
+#define TOG	0xc
+
+#define PWM_CTRL		0x0
+#define PWM_ACTIVE0		0x10
+#define PWM_PERIOD0		0x20
+#define  PERIOD_PERIOD(p)	((p) & 0xffff)
+#define  PERIOD_PERIOD_MAX	0x10000
+#define  PERIOD_ACTIVE_HIGH	(3 << 16)
+#define  PERIOD_INACTIVE_LOW	(2 << 18)
+#define  PERIOD_CDIV(div)	(((div) & 0x7) << 20)
+#define  PERIOD_CDIV_MAX	8
+
+struct mxs_pwm_chip {
+	struct pwm_chip chip;
+	struct device *dev;
+	struct clk *clk;
+	void __iomem *base;
+};
+
+#define to_mxs_pwm_chip(_chip) container_of(_chip, struct mxs_pwm_chip, chip)
+
+static int mxs_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
+			  int duty_ns, int period_ns)
+{
+	struct mxs_pwm_chip *mxs = to_mxs_pwm_chip(chip);
+	int ret, div = 0;
+	unsigned int period_cycles, duty_cycles;
+	unsigned long rate;
+	unsigned long long c;
+
+	rate = clk_get_rate(mxs->clk);
+	while (1) {
+		c = rate / (1 << div);
+		c = c * period_ns;
+		do_div(c, 1000000000);
+		if (c < PERIOD_PERIOD_MAX)
+			break;
+		div++;
+		if (div > PERIOD_CDIV_MAX)
+			return -EINVAL;
+	}
+
+	period_cycles = c;
+	c *= duty_ns;
+	do_div(c, period_ns);
+	duty_cycles = c;
+
+	/*
+	 * If the PWM channel is disabled, make sure to turn on the clock
+	 * before writing the register. Otherwise, keep it enabled.
+	 */
+	if (!test_bit(PWMF_ENABLED, &pwm->flags)) {
+		ret = clk_prepare_enable(mxs->clk);
+		if (ret)
+			return ret;
+	}
+
+	writel(duty_cycles << 16,
+			mxs->base + PWM_ACTIVE0 + pwm->hwpwm * 0x20);
+	writel(PERIOD_PERIOD(period_cycles) | PERIOD_ACTIVE_HIGH |
+	       PERIOD_INACTIVE_LOW | PERIOD_CDIV(div),
+			mxs->base + PWM_PERIOD0 + pwm->hwpwm * 0x20);
+
+	/*
+	 * If the PWM is not enabled, turn the clock off again to save power.
+	 */
+	if (!test_bit(PWMF_ENABLED, &pwm->flags))
+		clk_disable_unprepare(mxs->clk);
+
+	return 0;
+}
+
+static int mxs_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct mxs_pwm_chip *mxs = to_mxs_pwm_chip(chip);
+	int ret;
+
+	ret = clk_prepare_enable(mxs->clk);
+	if (ret)
+		return ret;
+
+	writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + SET);
+
+	return 0;
+}
+
+static void mxs_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct mxs_pwm_chip *mxs = to_mxs_pwm_chip(chip);
+
+	writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + CLR);
+
+	clk_disable_unprepare(mxs->clk);
+}
+
+static const struct pwm_ops mxs_pwm_ops = {
+	.config = mxs_pwm_config,
+	.enable = mxs_pwm_enable,
+	.disable = mxs_pwm_disable,
+	.owner = THIS_MODULE,
+};
+
+static int mxs_pwm_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct mxs_pwm_chip *mxs;
+	int ret;
+
+	mxs = devm_kzalloc(&pdev->dev, sizeof(*mxs), GFP_KERNEL);
+	if (!mxs)
+		return -ENOMEM;
+
+	mxs->base = of_iomap(np, 0);
+	if (!mxs->base)
+		return -EADDRNOTAVAIL;
+
+	mxs->clk = clk_get(&pdev->dev, NULL);
+	if (IS_ERR(mxs->clk)) {
+		ret = PTR_ERR(mxs->clk);
+		goto iounmap;
+	}
+
+	mxs->chip.dev = &pdev->dev;
+	mxs->chip.ops = &mxs_pwm_ops;
+	mxs->chip.base = -1;
+	ret = of_property_read_u32(np, "fsl,pwm-number", &mxs->chip.npwm);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to get pwm number: %d\n", ret);
+		goto clk_put;
+	}
+
+	ret = pwmchip_add(&mxs->chip);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to add pwm chip %d\n", ret);
+		goto clk_put;
+	}
+
+	mxs->dev = &pdev->dev;
+	platform_set_drvdata(pdev, mxs);
+
+	mxs_reset_block(mxs->base);
+
+	return 0;
+
+clk_put:
+	clk_put(mxs->clk);
+iounmap:
+	iounmap(mxs->base);
+	return ret;
+}
+
+static int __devexit mxs_pwm_remove(struct platform_device *pdev)
+{
+	struct mxs_pwm_chip *mxs = platform_get_drvdata(pdev);
+
+	pwmchip_remove(&mxs->chip);
+	clk_put(mxs->clk);
+	iounmap(mxs->base);
+
+	return 0;
+}
+
+static struct of_device_id mxs_pwm_dt_ids[] = {
+	{ .compatible = "fsl,mxs-pwm", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mxs_pwm_of_match);
+
+static struct platform_driver mxs_pwm_driver = {
+	.driver = {
+		.name = "mxs-pwm",
+		.of_match_table = of_match_ptr(mxs_pwm_dt_ids),
+	},
+	.probe = mxs_pwm_probe,
+	.remove = __devexit_p(mxs_pwm_remove),
+};
+module_platform_driver(mxs_pwm_driver);
+
+MODULE_ALIAS("platform:mxs-pwm");
+MODULE_AUTHOR("Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>");
+MODULE_DESCRIPTION("Freescale MXS PWM Driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.6
