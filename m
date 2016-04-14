From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm64: tegra: Enable cros-ec and charger on Smaug
Date: Thu, 14 Apr 2016 15:57:18 -0400
Message-ID: <1460663838-27175-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add nodes for the ChromeOS Embedded Controller and for the gas gauge
connected to the I2C bus that it controls.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 772921922046..aeb0d7691acb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1300,6 +1300,33 @@
 		status = "okay";
 	};
 
+	i2c@0,7000c400 {
+		status = "okay";
+		clock-frequency = <1000000>;
+
+		ec@1e {
+			compatible = "google,cros-ec-i2c";
+			reg = <0x1e>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(Z, 1) IRQ_TYPE_LEVEL_LOW>;
+			wakeup-source;
+
+			ec_i2c_0: i2c-tunnel {
+				compatible = "google,cros-ec-i2c-tunnel";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				google,remote-bus = <0>;
+
+				battery: bq27742@55 {
+					compatible = "ti,bq27742";
+					reg = <0x55>;
+					battery-name = "battery";
+				};
+			};
+		};
+	};
+
 	pmc@0,7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <0>;
-- 
1.9.1
