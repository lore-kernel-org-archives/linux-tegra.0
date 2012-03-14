From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 07/10] pwm: tegra: Add device tree support
Date: Wed, 14 Mar 2012 16:56:30 +0100
Message-ID: <1331740593-10807-8-git-send-email-thierry.reding@avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331740593-10807-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add auxdata to instantiate the PWFM controller from a device tree,
include the corresponding nodes in the dtsi files for Tegra 20 and
Tegra 30 and add binding documentation.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v4:
  - add DT binding documentation
  - allow nvidia,tegra20-pwm as fallback for nvidia,tegra30-pwm
  - export OF device table (for module auto-loading)

Changes in v3:
  - add missing include for mach/iomap.h

 .../devicetree/bindings/pwm/tegra-pwm.txt          |   18 ++++++++++++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |    6 ++++++
 arch/arm/boot/dts/tegra30.dtsi                     |    6 ++++++
 arch/arm/mach-tegra/board-dt-tegra20.c             |    1 +
 arch/arm/mach-tegra/board-dt-tegra30.c             |    3 +++
 drivers/pwm/pwm-tegra.c                            |   11 +++++++++++
 6 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/tegra-pwm.txt

diff --git a/Documentation/devicetree/bindings/pwm/tegra-pwm.txt b/Documentation/devicetree/bindings/pwm/tegra-pwm.txt
new file mode 100644
index 0000000..bbbeedb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/tegra-pwm.txt
@@ -0,0 +1,18 @@
+Tegra SoC PWFM controller
+
+Required properties:
+- compatible: should be one of:
+  - "nvidia,tegra20-pwm"
+  - "nvidia,tegra30-pwm"
+- reg: physical base address and length of the controller's registers
+- #pwm-cells: On Tegra the number of cells used to specify a PWM is 2. The
+  first cell specifies the per-chip index of the PWM to use and the second
+  cell is the duty cycle in nanoseconds.
+
+Example:
+
+	pwm: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x100>;
+		#pwm-cells = <2>;
+	};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 108e894..55b28fd 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -154,6 +154,12 @@
 		interrupts = < 0 91 0x04 >;
 	};
 
+	pwm: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x100>;
+		#pwm-cells = <2>;
+	};
+
 	emc@7000f400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 62a7b39..3fa5211 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -154,6 +154,12 @@
 		interrupts = < 0 91 0x04 >;
 	};
 
+	pwm: pwm@7000a000 {
+		compatible = "nvidia,tegra30-pwm", "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x100>;
+		#pwm-cells = <2>;
+	};
+
 	sdhci@78000000 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000000 0x200>;
diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index e20b419..2180954 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -73,6 +73,7 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 		       &tegra_ehci2_device.dev.platform_data),
 	OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB3_BASE, "tegra-ehci.2",
 		       &tegra_ehci3_device.dev.platform_data),
+	OF_DEV_AUXDATA("nvidia,tegra20-pwm", TEGRA_PWFM_BASE, "tegra-pwm", NULL),
 	{}
 };
 
diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index 5f7c03e..5e1180f 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -33,6 +33,8 @@
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
 
+#include <mach/iomap.h>
+
 #include "board.h"
 #include "clock.h"
 
@@ -51,6 +53,7 @@ struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000C500, "tegra-i2c.2", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000C700, "tegra-i2c.3", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000D000, "tegra-i2c.4", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-pwm", TEGRA_PWFM_BASE, "tegra-pwm", NULL),
 	{}
 };
 
diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 19540fc..19e96c6 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -242,9 +242,20 @@ static int __devexit tegra_pwm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static struct of_device_id tegra_pwm_of_match[] = {
+	{ .compatible = "nvidia,tegra20-pwm" },
+	{ .compatible = "nvidia,tegra30-pwm" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, tegra_pwm_of_match);
+#endif
+
 static struct platform_driver tegra_pwm_driver = {
 	.driver = {
 		.name = "tegra-pwm",
+		.of_match_table = of_match_ptr(tegra_pwm_of_match),
 	},
 	.probe = tegra_pwm_probe,
 	.remove = __devexit_p(tegra_pwm_remove),
-- 
1.7.9.4
