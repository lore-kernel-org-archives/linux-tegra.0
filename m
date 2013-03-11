From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1 v2] ARM: dt: tegra114: add PWM nodes
Date: Mon, 11 Mar 2013 16:48:15 -0700
Message-ID: <1363045695-28874-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch adds device tree nodes for the four PWM controllers present
on Tegra114.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Fixed commit message.
Corrected the compatible property.
Placed PWM nodes in the right place such that nodes are sorted by register
address.

 arch/arm/boot/dts/tegra114.dtsi |   32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 1dfaf28..5741ae4 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -92,6 +92,38 @@
 		status = "disabled";
 	};
 
+	pwm0: pwm@7000a000 {
+		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x4>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car 17>;
+		status = "disabled";
+	};
+
+	pwm1: pwm@7000a010 {
+		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
+		reg = <0x7000a010 0x4>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car 17>;
+		status = "disabled";
+	};
+
+	pwm2: pwm@7000a020 {
+		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
+		reg = <0x7000a020 0x4>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car 17>;
+		status = "disabled";
+	};
+
+	pwm3: pwm@7000a030 {
+		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
+		reg = <0x7000a030 0x4>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car 17>;
+		status = "disabled";
+	};
+
 	rtc {
 		compatible = "nvidia,tegra114-rtc", "nvidia,tegra20-rtc";
 		reg = <0x7000e000 0x100>;
-- 
1.7.9.5
