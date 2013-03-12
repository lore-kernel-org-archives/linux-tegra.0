From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2 v4] ARM: tegra: fix the status of PWM nodes
Date: Tue, 12 Mar 2013 16:40:51 -0700
Message-ID: <1363131651-13734-2-git-send-email-achew@nvidia.com>
References: <1363131651-13734-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363131651-13734-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

We should be defining the PWM nodes with status as "disabled" in the
chip-specific dtsi file, since we don't know whether specific boards
will use the PWM or not.  This patch fixes the PWM node status for
Tegra20 and Tegra30.

Also fixed the one user of PWM, which is the Tegra20 medcom-wide board,
so that PWM is set to "okay" in the board-specific dts file.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-medcom-wide.dts |    4 ++++
 arch/arm/boot/dts/tegra20.dtsi            |    1 +
 arch/arm/boot/dts/tegra30.dtsi            |    1 +
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index a2d6d65..ec392a2 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -26,6 +26,10 @@
 		};
 	};
 
+	pwm: pwm {
+		status = "okay";
+	}
+
 	backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm 0 5000000>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2e7c83c..1887ac3 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -268,6 +268,7 @@
 		reg = <0x7000a000 0x100>;
 		#pwm-cells = <2>;
 		clocks = <&tegra_car 17>;
+		status = "disabled";
 	};
 
 	rtc {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 2de8b91..6294687 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -263,6 +263,7 @@
 		reg = <0x7000a000 0x100>;
 		#pwm-cells = <2>;
 		clocks = <&tegra_car 17>;
+		status = "disabled";
 	};
 
 	rtc {
-- 
1.7.9.5
