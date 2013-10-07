From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/9] ARM: tegra: Enable LVDS and HDMI on Cardhu
Date: Mon,  7 Oct 2013 13:48:40 +0200
Message-ID: <1381146528-18069-2-git-send-email-treding@nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add backlight and panel nodes for the Cardhu 10.1" WXGA TFT LCD panel
and enable the HDMI output and hotplug detection.

Note that HDMI doesn't work for some reason and I haven't found out why
yet. I remember someone reporting that it worked at some point in time
using this set of nodes but that no longer seems to be the case. Running
the same kernel on Beaver has working HDMI, though.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 52 +++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index e19dbf2..2364673 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -51,6 +51,27 @@
 		};
 	};
 
+	host1x {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+
+				nvidia,panel = <&panel>;
+			};
+		};
+
+		hdmi {
+			status = "okay";
+
+			vdd-supply = <&sys_3v3_reg>;
+			pll-supply = <&vio_reg>;
+
+			nvidia,hpd-gpio =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+			nvidia,ddc-i2c-bus = <&hdmiddc>;
+		};
+	};
+
 	pinmux {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -147,7 +168,11 @@
 		status = "okay";
 	};
 
-	i2c@7000c000 {
+	pwm {
+		status = "okay";
+	};
+
+	panelddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
@@ -170,7 +195,7 @@
 		};
 	};
 
-	i2c@7000c700 {
+	hdmiddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
@@ -366,6 +391,19 @@
 		status = "okay";
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_bl_reg>;
+		pwms = <&pwm 0 5000000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+
+		backlight-boot-off;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -379,6 +417,16 @@
 		};
 	};
 
+	panel: panel {
+		compatible = "chunghwa,claa101wb01";
+		ddc-i2c-bus = <&panelddc>;
+
+		power-supply = <&vdd_pnl1_reg>;
+		enable-gpios = <&gpio TEGRA_GPIO(L, 2) GPIO_ACTIVE_HIGH>;
+
+		backlight = <&backlight>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
1.8.4
