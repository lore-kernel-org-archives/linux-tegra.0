From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: cardhu: Add power and volume keys
Date: Mon,  4 May 2015 13:23:58 +0200
Message-ID: <1430738638-24504-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Cardhu has a power key on the top-right as well as volume up and
volume down keys on the right side.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index cb0d72a30339..0da44b97df39 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -1,3 +1,4 @@
+#include <dt-bindings/input/input.h>
 #include "tegra30.dtsi"
 
 /**
@@ -627,4 +628,31 @@
 			 <&tegra_car TEGRA30_CLK_EXTERN1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			interrupt-parent = <&pmic>;
+			interrupts = <2 0>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <100>;
+			gpio-key,wakeup;
+		};
+
+		volume-down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <10>;
+		};
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <10>;
+		};
+	};
 };
-- 
2.3.5
