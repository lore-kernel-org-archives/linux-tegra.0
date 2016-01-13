From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 10/10] ARM: tegra: set hw trips for Tegra124
Date: Wed, 13 Jan 2016 16:01:04 +0800
Message-ID: <1452672064-563-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Set hw trips for Tegra124.

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 68669f791c8b..c670d71a8f37 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -701,6 +701,15 @@
 		resets = <&tegra_car 78>;
 		reset-names = "soctherm";
 		#thermal-sensor-cells = <1>;
+
+		hw-trips {
+			cpu {
+				therm-temp = <103000>;
+			};
+			gpu {
+				therm-temp = <101000>;
+			};
+		};
 	};
 
 	dfll: clock@0,70110000 {
-- 
1.9.1
