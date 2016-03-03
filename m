From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm64: tegra210-smaug: Add gpio-key nodes
Date: Thu, 3 Mar 2016 14:54:25 -0500
Message-ID: <1457034865-17826-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add gpio-key nodes for the volumn controls, lid switch,
tablet mode and power button.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 750e85c45135..9c0ec3031e98 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1,5 +1,7 @@
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
+
 #include "tegra210.dtsi"
 
 / {
@@ -76,6 +78,47 @@
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		gpio-keys,name = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpio TEGRA_GPIO(X, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <30>;
+			gpio-key,wakeup;
+		};
+
+		lid {
+			label = "Lid";
+			gpios = <&gpio TEGRA_GPIO(B, 4) GPIO_ACTIVE_LOW>;
+			linux,input-type = <5>; /* EV_SW */
+			linux,code = <0>; /* SW_LID */
+			gpio-key,wakeup;
+		};
+
+		tablet_mode {
+			label = "Tablet Mode";
+			gpios = <&gpio TEGRA_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
+			linux,input-type = <5>; /* EV_SW */
+			linux,code = <1>; /* SW_TABLET_MODE */
+			gpio-key,wakeup;
+		};
+
+		volume_down {
+			label = "Volume Down";
+			gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		volume_up {
+			label = "Volume Up";
+			gpios = <&gpio TEGRA_GPIO(M, 4) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
1.9.1
