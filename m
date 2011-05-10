From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC 2/2] ARM: Tegra: Device Tree Support: Add i2c devices
Date: Tue, 10 May 2011 13:14:38 -0700
Message-ID: <20110510201430.22693.66151.stgit@riker>
References: <20110510201108.22693.50319.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110510201108.22693.50319.stgit@riker>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch initializes i2c controller devices in board-dt.c. The i2c controller
is added to tegra250.dtsi so later on-board i2c devices can be found and
initialized based on the device tree information.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/arm/boot/dts/tegra250.dtsi |   33 +++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-dt.c  |   32 ++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-tegra.c  |    4 ++++
 3 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra250.dtsi b/arch/arm/boot/dts/tegra250.dtsi
index f1801b8..7d8fc51 100644
--- a/arch/arm/boot/dts/tegra250.dtsi
+++ b/arch/arm/boot/dts/tegra250.dtsi
@@ -20,6 +20,39 @@
 		};
 	};
 
+
+	i2c@7000C000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra250-i2c";
+		reg = <0x7000C000 0x100>;
+		interrupts = < 70 >;
+	};
+
+	i2c@7000C400 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra250-i2c";
+		reg = <0x7000C400 0x100>;
+		interrupts = < 116 >;
+	};
+
+	i2c@7000C500 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra250-i2c";
+		reg = <0x7000C500 0x100>;
+		interrupts = < 124 >;
+	};
+
+	i2c@7000D000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra250-i2c";
+		reg = <0x7000D000 0x200>;
+		interrupts = < 85 >;
+	};
+
 	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra250-gpio";
 		reg = < 0x6000d000 0x1000 >;
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index e61d563..cc7903b 100644
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
@@ -44,6 +46,35 @@
 #include "devices.h"
 #include "gpio-names.h"
 
+static struct tegra_i2c_platform_data harmony_i2c1_platform_data = {
+	.bus_clk_rate   = 400000,
+};
+
+static struct tegra_i2c_platform_data harmony_i2c2_platform_data = {
+	.bus_clk_rate   = 400000,
+};
+
+static struct tegra_i2c_platform_data harmony_i2c3_platform_data = {
+	.bus_clk_rate   = 400000,
+};
+
+static struct tegra_i2c_platform_data harmony_dvc_platform_data = {
+	.bus_clk_rate   = 400000,
+};
+
+static void __init harmony_i2c_init(void)
+{
+	tegra_i2c_device1.dev.platform_data = &harmony_i2c1_platform_data;
+	tegra_i2c_device2.dev.platform_data = &harmony_i2c2_platform_data;
+	tegra_i2c_device3.dev.platform_data = &harmony_i2c3_platform_data;
+	tegra_i2c_device4.dev.platform_data = &harmony_dvc_platform_data;
+
+	platform_device_register(&tegra_i2c_device1);
+	platform_device_register(&tegra_i2c_device2);
+	platform_device_register(&tegra_i2c_device3);
+	platform_device_register(&tegra_i2c_device4);
+}
+
 static struct platform_device *harmony_devices[] __initdata = {
 	&tegra_sdhci_device1,
 	&tegra_sdhci_device2,
@@ -111,6 +142,7 @@ static void __init tegra_dt_init(void)
 	tegra_sdhci_device4.dev.platform_data = &sdhci_pdata4;
 
 	platform_add_devices(harmony_devices, ARRAY_SIZE(harmony_devices));
+	harmony_i2c_init();
 
 	/*
 	 * Finished with the static registrations now; fill in the missing
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b4ab39b..a2f3ec6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -26,6 +26,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/i2c-tegra.h>
+#include <linux/of_i2c.h>
 
 #include <asm/unaligned.h>
 
@@ -598,6 +599,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->adapter.algo = &tegra_i2c_algo;
 	i2c_dev->adapter.dev.parent = &pdev->dev;
 	i2c_dev->adapter.nr = pdev->id;
+	i2c_dev->adapter.dev.of_node = of_node_get(pdev->dev.of_node);
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
 	if (ret) {
@@ -605,6 +607,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto err_free_irq;
 	}
 
+	of_i2c_register_devices(&i2c_dev->adapter);
+
 	return 0;
 err_free_irq:
 	free_irq(i2c_dev->irq, i2c_dev);
