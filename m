From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v4 04/13] of: document new emc-timings subnode in nvidia,tegra124-car
Date: Wed, 12 Nov 2014 08:56:27 +0100
Message-ID: <1415779051-26410-5-git-send-email-tomeu.vizoso@collabora.com>
References: <1415779051-26410-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415779051-26410-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, mikko.perttunen-/1wQRMveznE@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The EMC clock needs some extra information for changing its rate.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

---

v4:	* Remove comma from unit-address of CAR node in the example
	* Simplify reg property value in the example
---
 .../bindings/clock/nvidia,tegra124-car.txt         | 44 +++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
index ded5d62..cab5cd7 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
@@ -19,10 +19,33 @@ Required properties :
   In clock consumers, this cell represents the bit number in the CAR's
   array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
 
+The node should contain a "emc-timings" subnode for each supported RAM type (see
+field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address being its
+RAM_CODE.
+
+Required properties for "emc-timings" nodes :
+- nvidia,ram-code : Should contain the value of RAM_CODE this timing set
+  is used for.
+
+Each "emc-timings" node should contain a "timing" subnode for every supported
+EMC clock rate. The "timing" subnodes should have the clock rate in Hz as their
+unit address.
+
+Required properties for "timing" nodes :
+- clock-frequency : Should contain the memory clock rate to which this timing
+relates.
+- nvidia,parent-clock-frequency : Should contain the rate at which the current
+parent of the EMC clock should be running at this timing.
+- clocks : Must contain an entry for each entry in clock-names.
+  See ../clocks/clock-bindings.txt for details.
+- clock-names : Must include the following entries:
+  - emc-parent : the clock that should be the parent of the EMC clock at this
+timing.
+
 Example SoC include file:
 
 / {
-	tegra_car: clock {
+	tegra_car: clock@60006000 {
 		compatible = "nvidia,tegra124-car";
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
@@ -60,4 +83,23 @@ Example board file:
 	&tegra_car {
 		clocks = <&clk_32k> <&osc>;
 	};
+
+	clock@60006000 {
+		emc-timings@3 {
+			nvidia,ram-code = <3>;
+
+			timing@12750000 {
+				clock-frequency = <12750000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing@20400000 {
+				clock-frequency = <20400000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+		};
+	};
 };
-- 
1.9.3
