From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC 2/3] ARM: Tegra: Device Tree Support: Add i2c devices
Date: Wed, 11 May 2011 16:27:03 -0700
Message-ID: <20110511232659.10362.45811.stgit@riker>
References: <20110511231905.10362.12844.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110511231905.10362.12844.stgit@riker>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch initializes i2c controller devices in board-dt.c. The i2c controller
is added to tegra250.dtsi so later on-board i2c devices can be found and
initialized based on the device tree information.

Board specific i2c parameters are placed in tegra-harmony.dts.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/arm/boot/dts/tegra-harmony.dts |   20 +++++++++++++++++++
 arch/arm/boot/dts/tegra250.dtsi     |   37 +++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-dt.c      |    8 ++++++++
 drivers/i2c/busses/i2c-tegra.c      |   16 ++++++++++++++-
 4 files changed, 80 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index 23592b2..af169aa 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -16,6 +16,26 @@
 		reg = < 0x00000000 0x40000000 >;
 	};
 
+	i2c@7000c000 {
+		status = "ok";
+		clock-frequency = <400000>;
+	};
+
+	i2c@7000c400 {
+		status = "ok";
+		clock-frequency = <400000>;
+	};
+
+	i2c@7000c500 {
+		status = "ok";
+		clock-frequency = <400000>;
+	};
+
+	i2c@7000d000 {
+		status = "ok";
+		clock-frequency = <400000>;
+	};
+
 	serial@70006300 {
 		status = "ok";
 		clock-frequency = < 216000000 >;
diff --git a/arch/arm/boot/dts/tegra250.dtsi b/arch/arm/boot/dts/tegra250.dtsi
index f1801b8..0a056a2 100644
--- a/arch/arm/boot/dts/tegra250.dtsi
+++ b/arch/arm/boot/dts/tegra250.dtsi
@@ -20,6 +20,43 @@
 		};
 	};
 
+
+	i2c@7000c000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra250-i2c";
+		reg = <0x7000C000 0x100>;
+		interrupts = < 70 >;
+		status = "disabled";
+	};
+
+	i2c@7000c400 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra250-i2c";
+		reg = <0x7000C400 0x100>;
+		interrupts = < 116 >;
+		status = "disabled";
+	};
+
+	i2c@7000c500 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra250-i2c";
+		reg = <0x7000C500 0x100>;
+		interrupts = < 124 >;
+		status = "disabled";
+	};
+
+	i2c@7000d000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra250-i2c";
+		reg = <0x7000D000 0x200>;
+		interrupts = < 85 >;
+		status = "disabled";
+	};
+
 	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra250-gpio";
 		reg = < 0x6000d000 0x1000 >;
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index 50ab328..c498e84 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -28,6 +28,8 @@
 #include <linux/of_platform.h>
 #include <linux/pda_power.h>
 #include <linux/io.h>
+#include <linux/i2c.h>
+#include <linux/i2c-tegra.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -43,11 +45,17 @@
 #include "devices.h"
 #include "gpio-names.h"
 
+void harmony_pinmux_init(void);
+
 static struct platform_device *tegra250_devices[] __initdata = {
 	&tegra_sdhci_device1,
 	&tegra_sdhci_device2,
 	&tegra_sdhci_device3,
 	&tegra_sdhci_device4,
+	&tegra_i2c_device1,
+	&tegra_i2c_device2,
+	&tegra_i2c_device3,
+	&tegra_i2c_device4,
 };
 
 static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b4ab39b..1693c6a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -26,6 +26,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/i2c-tegra.h>
+#include <linux/of_i2c.h>
 
 #include <asm/unaligned.h>
 
@@ -511,6 +512,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	struct resource *iomem;
 	struct clk *clk;
 	struct clk *i2c_clk;
+	const unsigned int *prop;
 	void *base;
 	int irq;
 	int ret = 0;
@@ -568,7 +570,16 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->irq = irq;
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
-	i2c_dev->bus_clk_rate = pdata ? pdata->bus_clk_rate : 100000;
+
+	i2c_dev->bus_clk_rate = 100000; /* default clock rate */
+	if (i2c_dev->dev->of_node) {    /* if there is a device tree node ... */
+		prop = of_get_property(i2c_dev->dev->of_node,
+				"clock-frequency", NULL);
+		if (prop)
+			i2c_dev->bus_clk_rate = be32_to_cpup(prop);
+
+	} else if (pdata)
+		i2c_dev->bus_clk_rate = pdata->bus_clk_rate;
 
 	if (pdev->id == 3)
 		i2c_dev->is_dvc = 1;
@@ -598,6 +609,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->adapter.algo = &tegra_i2c_algo;
 	i2c_dev->adapter.dev.parent = &pdev->dev;
 	i2c_dev->adapter.nr = pdev->id;
+	i2c_dev->adapter.dev.of_node = of_node_get(pdev->dev.of_node);
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
 	if (ret) {
@@ -605,6 +617,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto err_free_irq;
 	}
 
+	of_i2c_register_devices(&i2c_dev->adapter);
+
 	return 0;
 err_free_irq:
 	free_irq(i2c_dev->irq, i2c_dev);
