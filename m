From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 05/10] ARM: tegra: Enable eDP for Venice2
Date: Fri, 28 Feb 2014 17:40:24 +0100
Message-ID: <1393605629-30514-5-git-send-email-thierry.reding@gmail.com>
References: <1393605629-30514-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393605629-30514-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Venice2 has a 12.9" (2560x1700) panel connected to the eDP output of the
Tegra124. The panel has an EDID to describe the video timings but needs
a few extra nodes to get the backlight to come up.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index b0db6348827f..7ffef561d667 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -16,6 +16,20 @@
 		reg = <0x80000000 0x80000000>;
 	};
 
+	host1x@50000000 {
+		sor@54540000 {
+			status = "okay";
+
+			nvidia,dpaux = <&dpaux>;
+			nvidia,panel = <&panel>;
+		};
+
+		dpaux: dpaux@545c0000 {
+			vdd-supply = <&vdd_3v3_panel>;
+			status = "okay";
+		};
+	};
+
 	pinmux: pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_default>;
@@ -940,6 +954,17 @@
 		};
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_led>;
+		pwms = <&pwm 1 1000000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -965,6 +990,13 @@
 		};
 	};
 
+	panel: panel {
+		compatible = "lg,lp129qe", "simple-panel";
+
+		backlight = <&backlight>;
+		ddc-i2c-bus = <&dpaux>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
1.8.4.2
