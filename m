From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 6/7] pwm: Add Tegra2 SoC support
Date: Tue, 20 Dec 2011 11:32:17 +0100
Message-ID: <1324377138-32129-7-git-send-email-thierry.reding@avionic-design.de>
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

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |    6 +
 arch/arm/mach-tegra/board-dt.c |    1 +
 arch/arm/mach-tegra/devices.c  |   15 +++
 arch/arm/mach-tegra/devices.h  |    1 +
 drivers/pwm/Kconfig            |    5 +
 drivers/pwm/Makefile           |    1 +
 drivers/pwm/pwm-tegra.c        |  274 ++++++++++++++++++++++++++++++++++++++++
 7 files changed, 303 insertions(+), 0 deletions(-)
 create mode 100644 drivers/pwm/pwm-tegra.c

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 168545e..1c58dce 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -122,6 +122,12 @@
 		interrupts = < 0 91 0x04 >;
 	};
 
+	pwm: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x100>;
+		#pwm-cells = <2>;
+	};
+
 	sdhci@c8000000 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000000 0x200>;
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index 2fa599d..387146c 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -81,6 +81,7 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 		       &tegra_ehci2_device.dev.platform_data),
 	OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB3_BASE, "tegra-ehci.2",
 		       &tegra_ehci3_device.dev.platform_data),
+	OF_DEV_AUXDATA("nvidia,tegra20-pwm", TEGRA_PWFM_BASE, "tegra-pwm", NULL),
 	{}
 };
 
diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devices.c
index 7a2a02d..c67d85d 100644
--- a/arch/arm/mach-tegra/devices.c
+++ b/arch/arm/mach-tegra/devices.c
@@ -704,3 +704,18 @@ struct platform_device tegra_pcm_device = {
 	.name = "tegra-pcm-audio",
 	.id = -1,
 };
+
+static struct resource tegra_pwm_resources[] = {
+	[0] = {
+		.start = TEGRA_PWFM_BASE,
+		.end = TEGRA_PWFM_BASE + TEGRA_PWFM_SIZE - 1,
+		.flags = IORESOURCE_MEM,
+	},
+};
+
+struct platform_device tegra_pwm_device = {
+	.name = "tegra-pwm",
+	.id = -1,
+	.num_resources = ARRAY_SIZE(tegra_pwm_resources),
+	.resource = tegra_pwm_resources,
+};
diff --git a/arch/arm/mach-tegra/devices.h b/arch/arm/mach-tegra/devices.h
index 873ecb2..a8a5e25 100644
--- a/arch/arm/mach-tegra/devices.h
+++ b/arch/arm/mach-tegra/devices.h
@@ -48,5 +48,6 @@ extern struct platform_device tegra_i2s_device1;
 extern struct platform_device tegra_i2s_device2;
 extern struct platform_device tegra_das_device;
 extern struct platform_device tegra_pcm_device;
+extern struct platform_device tegra_pwm_device;
 
 #endif
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 93c1052..7c6a137 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -9,4 +9,9 @@ menuconfig PWM
 
 if PWM
 
+config PWM_TEGRA
+	tristate "NVIDIA Tegra PWM support"
+	depends on ARCH_TEGRA
+	default n
+
 endif
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 3469c3d..12300f5 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_PWM)		+= core.o
+obj-$(CONFIG_PWM_TEGRA)		+= pwm-tegra.o
diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
new file mode 100644
index 0000000..fd2f075
--- /dev/null
+++ b/drivers/pwm/pwm-tegra.c
@@ -0,0 +1,274 @@
+/*
+ * drivers/pwm/pwm-tegra.c
+ *
+ * Tegra pulse-width-modulation controller driver
+ *
+ * Copyright (c) 2010, NVIDIA Corporation.
+ * Based on arch/arm/plat-mxc/pwm.c by Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pwm.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define PWM_ENABLE	(1 << 31)
+#define PWM_DUTY_WIDTH	8
+#define PWM_DUTY_SHIFT	16
+#define PWM_SCALE_WIDTH	13
+#define PWM_SCALE_SHIFT	0
+
+struct tegra_pwm_chip {
+	struct pwm_chip		chip;
+	struct device		*dev;
+
+	struct clk		*clk;
+
+	int			clk_enb[4];
+	void __iomem		*mmio_base;
+};
+
+static inline struct tegra_pwm_chip *to_tegra_pwm_chip(struct pwm_chip *chip)
+{
+	return container_of(chip, struct tegra_pwm_chip, chip);
+}
+
+static inline int pwm_writel(struct tegra_pwm_chip *chip, unsigned int pwm,
+		unsigned long val)
+{
+	unsigned long offset = pwm << 4;
+	int rc;
+
+	rc = clk_enable(chip->clk);
+	if (WARN_ON(rc))
+		return rc;
+
+	writel(val, chip->mmio_base + offset);
+	clk_disable(chip->clk);
+
+	return 0;
+}
+
+static int tegra_pwm_config(struct pwm_chip *chip, unsigned int pwm,
+		int duty_ns, int period_ns)
+{
+	struct tegra_pwm_chip *pc = to_tegra_pwm_chip(chip);
+	unsigned int num = pwm - chip->base;
+	unsigned long long c;
+	unsigned long rate, hz;
+	u32 val = 0;
+
+	/* convert from duty_ns / period_ns to a fixed number of duty
+	 * ticks per (1 << PWM_DUTY_WIDTH) cycles.
+	 */
+	c = duty_ns * ((1 << PWM_DUTY_WIDTH) - 1);
+	do_div(c, period_ns);
+
+	val = (u32)c << PWM_DUTY_SHIFT;
+
+	/* compute the prescaler value for which (1 << PWM_DUTY_WIDTH)
+	 * cycles at the PWM clock rate will take period_ns nanoseconds.
+	 */
+	rate = clk_get_rate(pc->clk) >> PWM_DUTY_WIDTH;
+	hz = 1000000000ul / period_ns;
+
+	rate = (rate + (hz / 2)) / hz;
+
+	/* Since the actual PWM divider is the register's frequency divider
+	 * field minus 1, we need to decrement to get the correct value to write
+	 * to the register.
+	 */
+	if (rate > 0)
+		rate--;
+
+	/* Make sure that the rate will fit in the register's frequency divider
+	 * field.
+	 */
+	if (rate >> PWM_SCALE_WIDTH)
+		return -EINVAL;
+
+	val |= (rate << PWM_SCALE_SHIFT);
+
+	/* the struct clk may be shared across multiple PWM devices, so
+	 * only enable the PWM if this device has been enabled
+	 */
+	if (pc->clk_enb[num])
+		val |= PWM_ENABLE;
+
+	return pwm_writel(pc, num, val);
+}
+
+static int tegra_pwm_enable(struct pwm_chip *chip, unsigned int pwm)
+{
+	struct tegra_pwm_chip *pc = to_tegra_pwm_chip(chip);
+	unsigned int num = pwm - chip->base;
+	int rc = 0;
+
+	if (!pc->clk_enb[num]) {
+		rc = clk_enable(pc->clk);
+		if (!rc) {
+			unsigned long offset = num << 4;
+			u32 val;
+
+			val = readl(pc->mmio_base + offset);
+			val |= PWM_ENABLE;
+			writel(val, pc->mmio_base + offset);
+
+			pc->clk_enb[num] = 1;
+		}
+	}
+
+	return 0;
+}
+
+static void tegra_pwm_disable(struct pwm_chip *chip, unsigned int pwm)
+{
+	struct tegra_pwm_chip *pc = to_tegra_pwm_chip(chip);
+	unsigned int num = pwm - chip->base;
+
+	if (pc->clk_enb[num]) {
+		unsigned long offset = num << 4;
+		u32 val;
+
+		val = readl(pc->mmio_base + offset);
+		val &= ~PWM_ENABLE;
+		writel(val, pc->mmio_base + offset);
+
+		clk_disable(pc->clk);
+		pc->clk_enb[num] = 0;
+	}
+}
+
+static struct pwm_ops tegra_pwm_ops = {
+	.config = tegra_pwm_config,
+	.enable = tegra_pwm_enable,
+	.disable = tegra_pwm_disable,
+	.owner = THIS_MODULE,
+};
+
+static int tegra_pwm_probe(struct platform_device *pdev)
+{
+	struct tegra_pwm_chip *pwm;
+	struct resource *r;
+	int ret;
+
+	pwm = devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm) {
+		dev_err(&pdev->dev, "failed to allocate memory\n");
+		return -ENOMEM;
+	}
+
+	pwm->dev = &pdev->dev;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(&pdev->dev, "no memory resources defined\n");
+		return -ENODEV;
+	}
+
+	r = devm_request_mem_region(&pdev->dev, r->start, resource_size(r),
+			pdev->name);
+	if (!r) {
+		dev_err(&pdev->dev, "failed to request memory\n");
+		return -EBUSY;
+	}
+
+	pwm->mmio_base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
+	if (!pwm->mmio_base) {
+		dev_err(&pdev->dev, "failed to ioremap() region\n");
+		return -ENODEV;
+	}
+
+	platform_set_drvdata(pdev, pwm);
+
+	pwm->clk = clk_get(&pdev->dev, NULL);
+	if (IS_ERR(pwm->clk))
+		return PTR_ERR(pwm->clk);
+
+	pwm->chip.label = "tegra-pwm";
+	pwm->chip.ops = &tegra_pwm_ops;
+	pwm->chip.base = -1;
+	pwm->chip.npwm = 4;
+
+#ifdef CONFIG_OF_PWM
+	pwm->chip.of_node = pdev->dev.of_node;
+#endif
+
+	ret = pwmchip_add(&pwm->chip);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
+		clk_put(pwm->clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __devexit tegra_pwm_remove(struct platform_device *pdev)
+{
+	struct tegra_pwm_chip *pwm = platform_get_drvdata(pdev);
+	int i;
+
+	if (WARN_ON(!pwm))
+		return -ENODEV;
+
+	for (i = 0; i < 4; i++) {
+		pwm_writel(pwm, i, 0);
+
+		if (pwm->clk_enb[i])
+			clk_disable(pwm->clk);
+	}
+
+	clk_put(pwm->clk);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static struct of_device_id tegra_pwm_of_match[] = {
+	{ .compatible = "nvidia,tegra20-pwm" },
+	{ }
+};
+#endif
+
+static struct platform_driver tegra_pwm_driver = {
+	.driver		= {
+		.name		= "tegra-pwm",
+		.of_match_table	= of_match_ptr(tegra_pwm_of_match),
+	},
+	.probe		= tegra_pwm_probe,
+	.remove		= __devexit_p(tegra_pwm_remove),
+};
+
+static int __init tegra_pwm_init(void)
+{
+	return platform_driver_register(&tegra_pwm_driver);
+}
+subsys_initcall(tegra_pwm_init);
+
+static void __exit tegra_pwm_exit(void)
+{
+	platform_driver_unregister(&tegra_pwm_driver);
+}
+module_exit(tegra_pwm_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("NVIDIA Corporation");
-- 
1.7.8
