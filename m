From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v6 5/9] dt-binding: tegra: Add VI and CSI bindings
Date: Fri, 3 Apr 2020 18:25:03 -0700
Message-ID: <1585963507-12610-6-git-send-email-skomatineni@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra contains VI controller which can support up to 6 MIPI CSI
camera sensors.

Each Tegra CSI port from CSI unit can be one-to-one mapper to
VI channel and can capture from an external camera sensor or
from built-in test pattern generator.

This patch adds dt-bindings for Tegra VI and CSI.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 73 ++++++++++++++++++----
 1 file changed, 60 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 9999255..4731921 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -40,14 +40,30 @@ of the following host1x client modules:
 
   Required properties:
   - compatible: "nvidia,tegra<chip>-vi"
-  - reg: Physical base address and length of the controller's registers.
+  - reg: Physical base address and length of the controller registers.
   - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
+  - clocks: clocks: Must contain one entry, for the module clock.
     See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - vi
+  - Tegra20/Tegra30/Tegra114/Tegra124:
+    - resets: Must contain an entry for each entry in reset-names.
+      See ../reset/reset.txt for details.
+    - reset-names: Must include the following entries:
+      - vi
+  - Tegra210:
+    - power-domains: Must include venc powergate node as vi is in VE partition.
+  - Tegra210 has CSI part of VI sharing same host interface and register space.
+    So, VI device node should have CSI child node.
+
+    - csi: mipi csi interface to vi
+
+      Required properties:
+      - compatible: "nvidia,tegra210-csi"
+      - reg: Physical base address offset to parent and length of the controller
+        registers.
+      - clocks: Must contain entries csi, cilab, cilcd, cile, csi_tpg clocks.
+        See ../clocks/clock-bindings.txt for details.
+      - power-domains: Must include sor powergate node as csicil is in
+        SOR partition.
 
 - epp: encoder pre-processor
 
@@ -309,13 +325,44 @@ Example:
 			reset-names = "mpe";
 		};
 
-		vi {
-			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
-			interrupts = <0 69 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_VI>;
-			resets = <&tegra_car 100>;
-			reset-names = "vi";
+		vi@54080000 {
+			compatible = "nvidia,tegra210-vi";
+			reg = <0x0 0x54080000 0x0 0x700>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+			clocks = <&tegra_car TEGRA210_CLK_VI>;
+			power-domains = <&pd_venc>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x54080000 0x2000>;
+
+			csi@838 {
+				compatible = "nvidia,tegra210-csi";
+				reg = <0x838 0x1300>;
+				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+						  <&tegra_car TEGRA210_CLK_CILCD>,
+						  <&tegra_car TEGRA210_CLK_CILE>,
+						  <&tegra_car TEGRA210_CLK_CSI_TPG>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>,
+						       <972000000>;
+
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>,
+					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
+				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
+				power-domains = <&pd_sor>;
+			};
 		};
 
 		epp {
-- 
2.7.4
