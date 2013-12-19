From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: set up /aliases for RTCs on Venice2
Date: Thu, 19 Dec 2013 11:34:34 -0700
Message-ID: <1387478074-20731-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This ensures that the PMIC RTC provides the system time, rather than
the on-SoC RTC, which is not battery-backed.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index d6bb25c78c62..72f613913cce 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -6,6 +6,11 @@
 	model = "NVIDIA Tegra124 Venice2";
 	compatible = "nvidia,venice2", "nvidia,tegra124";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/as3722@40";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x80000000 0x80000000>;
 	};
-- 
1.8.1.5
