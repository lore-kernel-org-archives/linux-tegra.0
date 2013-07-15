From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove tegra114-pluto.dts
Date: Mon, 15 Jul 2013 12:55:47 -0600
Message-ID: <1373914547-6075-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Early upstream work on Tegra114 was performed on the Pluto board.
However, it's not used any more, and the DT doesn't contain anything
beyond a serial port, so the file isn't useful either. Remove it.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile           |  3 +--
 arch/arm/boot/dts/tegra114-pluto.dts | 33 ---------------------------------
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 arch/arm/boot/dts/tegra114-pluto.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 2cec2ff..4130237 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -228,8 +228,7 @@ dtb-$(CONFIG_ARCH_TEGRA) += tegra20-harmony.dtb \
 	tegra30-beaver.dtb \
 	tegra30-cardhu-a02.dtb \
 	tegra30-cardhu-a04.dtb \
-	tegra114-dalmore.dtb \
-	tegra114-pluto.dtb
+	tegra114-dalmore.dtb
 dtb-$(CONFIG_ARCH_VERSATILE) += versatile-ab.dtb \
 	versatile-pb.dtb
 dtb-$(CONFIG_ARCH_U300) += ste-u300.dtb
diff --git a/arch/arm/boot/dts/tegra114-pluto.dts b/arch/arm/boot/dts/tegra114-pluto.dts
deleted file mode 100644
index d5f8d3e..0000000
--- a/arch/arm/boot/dts/tegra114-pluto.dts
+++ /dev/null
@@ -1,33 +0,0 @@
-/dts-v1/;
-
-#include "tegra114.dtsi"
-
-/ {
-	model = "NVIDIA Tegra114 Pluto evaluation board";
-	compatible = "nvidia,pluto", "nvidia,tegra114";
-
-	memory {
-		reg = <0x80000000 0x40000000>;
-	};
-
-	serial@70006300 {
-		status = "okay";
-	};
-
-	pmc {
-		nvidia,invert-interrupt;
-	};
-
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock {
-			compatible = "fixed-clock";
-			reg=<0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-};
-- 
1.8.1.5
