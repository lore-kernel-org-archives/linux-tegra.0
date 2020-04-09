From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 13/14] arm64: tegra: Hook up EMC cooling device
Date: Thu,  9 Apr 2020 19:52:37 +0200
Message-ID: <20200409175238.3586487-14-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409175238.3586487-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The external memory controller can be used as a cooling device for the
LPDDR chips. Hook it up to the "mem" thermal zone of the SOCTHERM block
so that temperature polling can be enabled on the EMC when a given
temperature is exceeded.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v6:
- new patch

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 28 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 3fa92dd8350b..a550e7b828e6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -895,7 +895,7 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
-	external-memory-controller@7001b000 {
+	emc: external-memory-controller@7001b000 {
 		compatible = "nvidia,tegra210-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>,
 		      <0x0 0x7001e000 0x0 0x1000>,
@@ -904,6 +904,7 @@ external-memory-controller@7001b000 {
 		clock-names = "emc";
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,memory-controller = <&mc>;
+		#cooling-cells = <2>;
 	};
 
 	sata@70020000 {
@@ -1561,6 +1562,18 @@ mem {
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_MEM>;
 
 			trips {
+				dram_nominal: mem-nominal-trip {
+					temperature = <50000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				dram_throttle: mem-throttle-trip {
+					temperature = <70000>;
+					hysteresis = <1000>;
+					type = "active";
+				};
+
 				mem-shutdown-trip {
 					temperature = <103000>;
 					hysteresis = <0>;
@@ -1569,10 +1582,15 @@ mem-shutdown-trip {
 			};
 
 			cooling-maps {
-				/*
-				 * There are currently no cooling maps,
-				 * because there are no cooling devices.
-				 */
+				dram-passive {
+					cooling-device = <&emc 0 0>;
+					trip = <&dram_nominal>;
+				};
+
+				dram-active {
+					cooling-device = <&emc 1 1>;
+					trip = <&dram_throttle>;
+				};
 			};
 		};
 
-- 
2.24.1
