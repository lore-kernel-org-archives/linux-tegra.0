From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v3 3/6] dt-binding: tegra: Add VI and CSI bindings
Date: Fri, 14 Feb 2020 10:23:25 -0800
Message-ID: <1581704608-31219-4-git-send-email-skomatineni@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, helen.koike@collabora.com, sboyd@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra contains VI controller which can support up to 6 MIPI CSI
camera sensors.

Each Tegra CSI port from CSI unit can be one-to-one mapper to
VI channel and can capture from an external camera sensor or
from built-in test pattern generator.

This patch adds dt-bindings for Tegra VI and CSI.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 55 ++++++++++++++++++----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 9999255ac5b6..3d0ed540a646 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -40,14 +40,24 @@ of the following host1x client modules:
 
   Required properties:
   - compatible: "nvidia,tegra<chip>-vi"
-  - reg: Physical base address and length of the controller's registers.
+  - reg: Physical base address and length of the controller registers.
   - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
+  - clocks: Must contain an entry for the module clock "vi"
     See ../clocks/clock-bindings.txt for details.
   - resets: Must contain an entry for each entry in reset-names.
     See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - vi
+  - reset-names: Must include the entry "vi"
+
+  Tegra210 has CSI part of VI sharing same host interface and register
+  space. So, VI device node should have CSI child node.
+
+  - csi: mipi csi interface to vi
+
+    Required properties:
+    - compatible: "nvidia,tegra<chip>-csi"
+    - reg: Physical base address and length of the controller registers.
+    - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
+      See ../clocks/clock-bindings.txt for details.
 
 - epp: encoder pre-processor
 
@@ -310,12 +320,41 @@ Example:
 		};
 
 		vi {
-			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			compatible = "nvidia,tegra210-vi";
+			reg = <0x0 0x54080000 0x0 0x700>;
 			interrupts = <0 69 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_VI>;
-			resets = <&tegra_car 100>;
+			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+			clocks = <&tegra_car TEGRA210_CLK_VI>;
+			clock-names = "vi";
+			resets = <&tegra_car 20>;
 			reset-names = "vi";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0x0 0x54080808 0x0 0x54080808 0x0 0x2000>;
+
+			csi@0x54080838 {
+				compatible = "nvidia,tegra210-csi";
+				reg = <0x0 0x54080838 0x0 0x2000>;
+				status = "disabled";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+						  <&tegra_car TEGRA210_CLK_CILCD>,
+						  <&tegra_car TEGRA210_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>;
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>;
+				clock-names = "csi", "cilab", "cilcd", "cile";
+			};
+
 		};
 
 		epp {
-- 
2.7.4
