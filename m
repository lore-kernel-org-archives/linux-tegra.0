From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V3 11/11] ARM: tegra: set hw trips for Tegra124
Date: Mon, 18 Jan 2016 18:05:20 +0800
Message-ID: <1453111520-12622-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, rui.zhang@intel.com
Cc: MLongnecker@nvidia.com, swarren@wwwdotorg.org, mikko.perttunen@kapsi.fi, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Set cpu and gpu's thermtrip temperatures for Tegra124.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 68669f791c8b..48de23e41ca4 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -701,6 +701,15 @@
 		resets = <&tegra_car 78>;
 		reset-names = "soctherm";
 		#thermal-sensor-cells = <1>;
+
+		hw-trip-points {
+			cpu {
+				thermtrip-temperature = <103000>;
+			};
+			gpu {
+				thermtrip-temperature = <101000>;
+			};
+		};
 	};
 
 	dfll: clock@0,70110000 {
-- 
1.9.1
