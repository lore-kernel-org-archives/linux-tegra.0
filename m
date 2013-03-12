From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1 v3] ARM: tegra: add PWM nodes to Tegra114 DT
Date: Tue, 12 Mar 2013 14:42:43 -0700
Message-ID: <1363124563-24784-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch adds a device tree node for the four PWM controllers present
on Tegra114.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changed from specifying four PWM nodes to specifying a single node for all
four PWM comtrollers.  The first member of the cells tuple is used to
select which specific PWM controller.

 arch/arm/boot/dts/tegra114.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 1dfaf28..71783be 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -92,6 +92,14 @@
 		status = "disabled";
 	};
 
+	pwm: pwm {
+		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x40>;
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
