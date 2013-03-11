From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] ARM: dt: tegra114: add PWM nodes
Date: Mon, 11 Mar 2013 15:30:36 -0700
Message-ID: <1363041036-26358-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch adds device tree nodes for the four PWM controllers present
on tegra114.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi |   32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 1dfaf28..68fc0e1 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -150,4 +150,36 @@
 			     <1 11 0xf08>,
 			     <1 10 0xf08>;
 	};
+
+	pwm0: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x4>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car 17>;
+		status = "disabled";
+	};
+
+	pwm1: pwm@7000a010 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a010 0x4>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car 17>;
+		status = "disabled";
+	};
+
+	pwm2: pwm@7000a020 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a020 0x4>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car 17>;
+		status = "disabled";
+	};
+
+	pwm3: pwm@7000a030 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a030 0x4>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car 17>;
+		status = "disabled";
+	};
 };
-- 
1.7.9.5
