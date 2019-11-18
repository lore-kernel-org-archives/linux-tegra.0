From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 07/29] dt-bindings: host1x: Document new interconnect properties
Date: Mon, 18 Nov 2019 23:02:25 +0300
Message-ID: <20191118200247.3567-8-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Host1x clients are interconnected with memory controller through Graphics
HOST bus, these clients will issue memory bandwidth requests to the memory
controller that will adapt arbitration configuration in order to satisfy
clients and then propagate the aggregated bandwidth request to external
memory controller. The new interconnect properties are optional, thus
backwards compatibility is preserved with older device-trees.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 9999255ac5b6..2a1fc1a194d2 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -20,6 +20,11 @@ Required properties:
 - reset-names: Must include the following entries:
   - host1x
 
+Each host1x client module having to perform DMA through the Memory Controller
+should have the interconnect endpoints set to the Memory Client and External
+Memory respectively, interconnect name must be set to "dma-mem".
+The interconnect property is optional.
+
 The host1x top-level node defines a number of children, each representing one
 of the following host1x client modules:
 
@@ -36,6 +41,11 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - mpe
 
+  Optional properties:
+  - interconnects: Must contain entry for the memory interconnect.
+  - interconnect-names: Must include the following entries:
+    - dma-mem
+
 - vi: video input
 
   Required properties:
@@ -49,6 +59,11 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - vi
 
+  Optional properties:
+  - interconnects: Must contain entry for the memory interconnect.
+  - interconnect-names: Must include the following entries:
+    - dma-mem
+
 - epp: encoder pre-processor
 
   Required properties:
@@ -62,6 +77,11 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - epp
 
+  Optional properties:
+  - interconnects: Must contain entry for the memory interconnect.
+  - interconnect-names: Must include the following entries:
+    - dma-mem
+
 - isp: image signal processor
 
   Required properties:
@@ -75,6 +95,11 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - isp
 
+  Optional properties:
+  - interconnects: Must contain entry for the memory interconnect.
+  - interconnect-names: Must include the following entries:
+    - dma-mem
+
 - gr2d: 2D graphics engine
 
   Required properties:
@@ -88,6 +113,11 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 2d
 
+  Optional properties:
+  - interconnects: Must contain entry for the memory interconnect.
+  - interconnect-names: Must include the following entries:
+    - dma-mem
+
 - gr3d: 3D graphics engine
 
   Required properties:
@@ -106,6 +136,11 @@ of the following host1x client modules:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
 
+  Optional properties:
+  - interconnects: Must contain entry for the memory interconnect.
+  - interconnect-names: Must include the following entries:
+    - dma-mem
+
 - dc: display controller
 
   Required properties:
@@ -133,6 +168,9 @@ of the following host1x client modules:
   - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
+  - interconnects: Must contain entry for the memory interconnect.
+  - interconnect-names: Must include the following entries:
+    - dma-mem
 
 - hdmi: High Definition Multimedia Interface
 
@@ -281,6 +319,11 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - vic
 
+  Optional properties:
+  - interconnects: Must contain entry for the memory interconnect.
+  - interconnect-names: Must include the following entries:
+    - dma-mem
+
 Example:
 
 / {
@@ -307,6 +350,9 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_MPE>;
 			resets = <&tegra_car 60>;
 			reset-names = "mpe";
+
+			interconnects = <&mc TEGRA_ICC_MC_MPE &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
 		};
 
 		vi {
@@ -316,6 +362,9 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 100>;
 			reset-names = "vi";
+
+			interconnects = <&mc TEGRA_ICC_MC_VI &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
 		};
 
 		epp {
@@ -325,6 +374,9 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_EPP>;
 			resets = <&tegra_car 19>;
 			reset-names = "epp";
+
+			interconnects = <&mc TEGRA_ICC_MC_EPP &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
 		};
 
 		isp {
@@ -334,6 +386,9 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_ISP>;
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
+
+			interconnects = <&mc TEGRA_ICC_MC_ISP &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
 		};
 
 		gr2d {
@@ -343,6 +398,9 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+
+			interconnects = <&mc TEGRA_ICC_MC_2D &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
 		};
 
 		gr3d {
@@ -351,6 +409,9 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
 			resets = <&tegra_car 24>;
 			reset-names = "3d";
+
+			interconnects = <&mc TEGRA_ICC_MC_3D &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
 		};
 
 		dc@54200000 {
@@ -363,6 +424,9 @@ Example:
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
+			interconnects = <&mc TEGRA_ICC_MC_DC &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
+
 			rgb {
 				status = "disabled";
 			};
@@ -378,6 +442,9 @@ Example:
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
+			interconnects = <&mc TEGRA_ICC_MC_DCB &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
+
 			rgb {
 				status = "disabled";
 			};
-- 
2.23.0
