From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/38] dt-bindings: display: tegra: Convert to json-schema
Date: Fri, 12 Jun 2020 16:18:32 +0200
Message-ID: <20200612141903.2391044-8-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Convert the Tegra host1x controller bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   |  516 ------
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 1418 +++++++++++++++++
 2 files changed, 1418 insertions(+), 516 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
deleted file mode 100644
index 2cf3cc4893da..000000000000
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ /dev/null
@@ -1,516 +0,0 @@
-NVIDIA Tegra host1x
-
-Required properties:
-- compatible: "nvidia,tegra<chip>-host1x"
-- reg: Physical base address and length of the controller's registers.
-  For pre-Tegra186, one entry describing the whole register area.
-  For Tegra186, one entry for each entry in reg-names:
-    "vm" - VM region assigned to Linux
-    "hypervisor" - Hypervisor region (only if Linux acts as hypervisor)
-- interrupts: The interrupt outputs from the controller.
-- #address-cells: The number of cells used to represent physical base addresses
-  in the host1x address space. Should be 1.
-- #size-cells: The number of cells used to represent the size of an address
-  range in the host1x address space. Should be 1.
-- ranges: The mapping of the host1x address space to the CPU address space.
-- clocks: Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - host1x
-
-The host1x top-level node defines a number of children, each representing one
-of the following host1x client modules:
-
-- mpe: video encoder
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-mpe"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - mpe
-
-- vi: video input
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-vi"
-  - reg: Physical base address and length of the controller registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - Tegra20/Tegra30/Tegra114/Tegra124:
-    - resets: Must contain an entry for each entry in reset-names.
-      See ../reset/reset.txt for details.
-    - reset-names: Must include the following entries:
-      - vi
-  - Tegra210:
-    - power-domains: Must include venc powergate node as vi is in VE partition.
-  - Tegra210 has CSI part of VI sharing same host interface and register space.
-    So, VI device node should have CSI child node.
-
-    - csi: mipi csi interface to vi
-
-      Required properties:
-      - compatible: "nvidia,tegra210-csi"
-      - reg: Physical base address offset to parent and length of the controller
-        registers.
-      - clocks: Must contain entries csi, cilab, cilcd, cile, csi_tpg clocks.
-        See ../clocks/clock-bindings.txt for details.
-      - power-domains: Must include sor powergate node as csicil is in
-        SOR partition.
-
-- epp: encoder pre-processor
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-epp"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - epp
-
-- isp: image signal processor
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-isp"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - isp
-
-- gr2d: 2D graphics engine
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-gr2d"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - 2d
-
-- gr3d: 3D graphics engine
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-gr3d"
-  - reg: Physical base address and length of the controller's registers.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    (This property may be omitted if the only clock in the list is "3d")
-    - 3d
-      This MUST be the first entry.
-    - 3d2 (Only required on SoCs with two 3D clocks)
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - 3d
-    - 3d2 (Only required on SoCs with two 3D clocks)
-
-- dc: display controller
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-dc"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - dc
-      This MUST be the first entry.
-    - parent
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - dc
-  - nvidia,head: The number of the display controller head. This is used to
-    setup the various types of output to receive video data from the given
-    head.
-
-  Each display controller node has a child node, named "rgb", that represents
-  the RGB output associated with the controller. It can take the following
-  optional properties:
-  - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
-  - nvidia,edid: supplies a binary EDID blob
-  - nvidia,panel: phandle of a display panel
-
-- hdmi: High Definition Multimedia Interface
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-hdmi"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - hdmi-supply: supply for the +5V HDMI connector pin
-  - vdd-supply: regulator for supply voltage
-  - pll-supply: regulator for PLL
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - hdmi
-      This MUST be the first entry.
-    - parent
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - hdmi
-
-  Optional properties:
-  - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
-  - nvidia,edid: supplies a binary EDID blob
-  - nvidia,panel: phandle of a display panel
-
-- tvo: TV encoder output
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-tvo"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-
-- dsi: display serial interface
-
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-dsi"
-  - reg: Physical base address and length of the controller's registers.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - dsi
-      This MUST be the first entry.
-    - lp
-    - parent
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - dsi
-  - avdd-dsi-supply: phandle of a supply that powers the DSI controller
-  - nvidia,mipi-calibrate: Should contain a phandle and a specifier specifying
-    which pads are used by this DSI output and need to be calibrated. See also
-    ../display/tegra/nvidia,tegra114-mipi.txt.
-
-  Optional properties:
-  - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
-  - nvidia,edid: supplies a binary EDID blob
-  - nvidia,panel: phandle of a display panel
-  - nvidia,ganged-mode: contains a phandle to a second DSI controller to gang
-    up with in order to support up to 8 data lanes
-
-- sor: serial output resource
-
-  Required properties:
-  - compatible: Should be:
-    - "nvidia,tegra124-sor": for Tegra124 and Tegra132
-    - "nvidia,tegra132-sor": for Tegra132
-    - "nvidia,tegra210-sor": for Tegra210
-    - "nvidia,tegra210-sor1": for Tegra210
-    - "nvidia,tegra186-sor": for Tegra186
-    - "nvidia,tegra186-sor1": for Tegra186
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - sor: clock input for the SOR hardware
-    - out: SOR output clock
-    - parent: input for the pixel clock
-    - dp: reference clock for the SOR clock
-    - safe: safe reference for the SOR clock during power up
-
-    For Tegra186 and later:
-    - pad: SOR pad output clock (on Tegra186 and later)
-
-    Obsolete:
-    - source: source clock for the SOR clock (obsolete, use "out" instead)
-
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - sor
-
-  Required properties on Tegra186 and later:
-  - nvidia,interface: index of the SOR interface
-
-  Optional properties:
-  - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
-  - nvidia,edid: supplies a binary EDID blob
-  - nvidia,panel: phandle of a display panel
-  - nvidia,xbar-cfg: 5 cells containing the crossbar configuration. Each lane
-    of the SOR, identified by the cell's index, is mapped via the crossbar to
-    the pad specified by the cell's value.
-
-  Optional properties when driving an eDP output:
-  - nvidia,dpaux: phandle to a DispayPort AUX interface
-
-- dpaux: DisplayPort AUX interface
-  - compatible : Should contain one of the following:
-    - "nvidia,tegra124-dpaux": for Tegra124 and Tegra132
-    - "nvidia,tegra210-dpaux": for Tegra210
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - dpaux: clock input for the DPAUX hardware
-    - parent: reference clock
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - dpaux
-  - vdd-supply: phandle of a supply that powers the DisplayPort link
-  - i2c-bus: Subnode where I2C slave devices are listed. This subnode
-    must be always present. If there are no I2C slave devices, an empty
-    node should be added. See ../../i2c/i2c.txt for more information.
-
-  See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
-  regarding the DPAUX pad controller bindings.
-
-- vic: Video Image Compositor
-  - compatible : "nvidia,tegra<chip>-vic"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - vic: clock input for the VIC hardware
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - vic
-
-- display-hub: display controller hub
-  Required properties:
-  - compatible: "nvidia,tegra<chip>-display"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain an entry for each entry in clock-names.
-    See ../clocks/clock-bindings.txt for details.
-  - clock-names: Must include the following entries:
-    - disp
-    - dsc
-    - hub
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - misc
-    - wgrp0
-    - wgrp1
-    - wgrp2
-    - wgrp3
-    - wgrp4
-    - wgrp5
-  - power-domains: A list of phandle and specifiers identifying the power
-    domains that the display hub is part of.
-  - ranges: Range of registers used for the display controllers.
-
-  Each subnode of the display hub represents one of the display controllers
-  available:
-
-  - display: display controller
-    - compatible: "nvidia,tegra<chip>-dc"
-    - reg: Physical base address and length of the controller's registers.
-    - interrupts: The interrupt outputs from the controller.
-    - clocks: Must contain an entry for each entry in clock-names.
-      See ../clocks/clock-bindings.txt for details.
-    - clock-names: Must include the following entries:
-      - dc
-    - resets: Must contain an entry for each entry in reset-names.
-      See ../reset/reset.txt for details.
-    - reset-names: Must include the following entries:
-      - dc
-    - power-domains: A list of phandle and specifiers that identify the power
-      domains that this display controller is part of.
-    - iommus: A phandle and specifier identifying the SMMU master interface of
-      this display controller.
-    - nvidia,outputs: A list of phandles of outputs that this display
-      controller can drive.
-    - nvidia,head: The number of the display controller head. This is used to
-      setup the various types of output to receive video data from the given
-      head.
-
-Example:
-
-/ {
-	...
-
-	host1x {
-		compatible = "nvidia,tegra20-host1x", "simple-bus";
-		reg = <0x50000000 0x00024000>;
-		interrupts = <0 65 0x04   /* mpcore syncpt */
-			      0 67 0x04>; /* mpcore general */
-		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		ranges = <0x54000000 0x54000000 0x04000000>;
-
-		mpe {
-			compatible = "nvidia,tegra20-mpe";
-			reg = <0x54040000 0x00040000>;
-			interrupts = <0 68 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_MPE>;
-			resets = <&tegra_car 60>;
-			reset-names = "mpe";
-		};
-
-		vi@54080000 {
-			compatible = "nvidia,tegra210-vi";
-			reg = <0x0 0x54080000 0x0 0x700>;
-			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
-			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
-
-			clocks = <&tegra_car TEGRA210_CLK_VI>;
-			power-domains = <&pd_venc>;
-
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			ranges = <0x0 0x0 0x54080000 0x2000>;
-
-			csi@838 {
-				compatible = "nvidia,tegra210-csi";
-				reg = <0x838 0x1300>;
-				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
-						  <&tegra_car TEGRA210_CLK_CILCD>,
-						  <&tegra_car TEGRA210_CLK_CILE>,
-						  <&tegra_car TEGRA210_CLK_CSI_TPG>;
-				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
-							 <&tegra_car TEGRA210_CLK_PLL_P>,
-							 <&tegra_car TEGRA210_CLK_PLL_P>;
-				assigned-clock-rates = <102000000>,
-						       <102000000>,
-						       <102000000>,
-						       <972000000>;
-
-				clocks = <&tegra_car TEGRA210_CLK_CSI>,
-					 <&tegra_car TEGRA210_CLK_CILAB>,
-					 <&tegra_car TEGRA210_CLK_CILCD>,
-					 <&tegra_car TEGRA210_CLK_CILE>,
-					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
-				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
-				power-domains = <&pd_sor>;
-			};
-		};
-
-		epp {
-			compatible = "nvidia,tegra20-epp";
-			reg = <0x540c0000 0x00040000>;
-			interrupts = <0 70 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_EPP>;
-			resets = <&tegra_car 19>;
-			reset-names = "epp";
-		};
-
-		isp {
-			compatible = "nvidia,tegra20-isp";
-			reg = <0x54100000 0x00040000>;
-			interrupts = <0 71 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_ISP>;
-			resets = <&tegra_car 23>;
-			reset-names = "isp";
-		};
-
-		gr2d {
-			compatible = "nvidia,tegra20-gr2d";
-			reg = <0x54140000 0x00040000>;
-			interrupts = <0 72 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
-		};
-
-		gr3d {
-			compatible = "nvidia,tegra20-gr3d";
-			reg = <0x54180000 0x00040000>;
-			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
-			resets = <&tegra_car 24>;
-			reset-names = "3d";
-		};
-
-		dc@54200000 {
-			compatible = "nvidia,tegra20-dc";
-			reg = <0x54200000 0x00040000>;
-			interrupts = <0 73 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_DISP1>,
-				 <&tegra_car TEGRA20_CLK_PLL_P>;
-			clock-names = "dc", "parent";
-			resets = <&tegra_car 27>;
-			reset-names = "dc";
-
-			rgb {
-				status = "disabled";
-			};
-		};
-
-		dc@54240000 {
-			compatible = "nvidia,tegra20-dc";
-			reg = <0x54240000 0x00040000>;
-			interrupts = <0 74 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_DISP2>,
-				 <&tegra_car TEGRA20_CLK_PLL_P>;
-			clock-names = "dc", "parent";
-			resets = <&tegra_car 26>;
-			reset-names = "dc";
-
-			rgb {
-				status = "disabled";
-			};
-		};
-
-		hdmi {
-			compatible = "nvidia,tegra20-hdmi";
-			reg = <0x54280000 0x00040000>;
-			interrupts = <0 75 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_HDMI>,
-				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
-			clock-names = "hdmi", "parent";
-			resets = <&tegra_car 51>;
-			reset-names = "hdmi";
-			status = "disabled";
-		};
-
-		tvo {
-			compatible = "nvidia,tegra20-tvo";
-			reg = <0x542c0000 0x00040000>;
-			interrupts = <0 76 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_TVO>;
-			status = "disabled";
-		};
-
-		dsi {
-			compatible = "nvidia,tegra20-dsi";
-			reg = <0x54300000 0x00040000>;
-			clocks = <&tegra_car TEGRA20_CLK_DSI>,
-				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
-			clock-names = "dsi", "parent";
-			resets = <&tegra_car 48>;
-			reset-names = "dsi";
-			status = "disabled";
-		};
-	};
-
-	...
-};
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
new file mode 100644
index 000000000000..3347e1b3c8f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -0,0 +1,1418 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-host1x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra host1x controller
+
+maintainers:
+  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+
+description: The host1x top-level node defines a number of children, each
+  representing one of the host1x client modules defined in this binding.
+
+properties:
+  # required
+  compatible:
+    oneOf:
+      - description: NVIDIA Tegra20
+        items:
+          - const: nvidia,tegra20-host1x
+
+      - description: NVIDIA Tegra30
+        items:
+          - const: nvidia,tegra30-host1x
+
+      - description: NVIDIA Tegra114
+        items:
+          - const: nvidia,tegra114-host1x
+
+      - description: NVIDIA Tegra124
+        items:
+          - const: nvidia,tegra124-host1x
+
+      - description: NVIDIA Tegra132
+        items:
+          - const: nvidia,tegra132-host1x
+          - const: nvidia,tegra124-host1x
+
+      - description: NVIDIA Tegra210
+        items:
+          - const: nvidia,tegra210-host1x
+
+      - description: NVIDIA Tegra186
+        items:
+          - const: nvidia,tegra186-host1x
+
+      - description: NVIDIA Tegra194
+        items:
+          - const: nvidia,tegra194-host1x
+
+  interrupts:
+    items:
+      - description: host1x syncpoint interrupt
+      - description: host1x general interrupt
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: syncpt
+      - const: host1x
+
+  '#address-cells':
+    description: The number of cells used to represent physical base addresses
+      in the host1x address space.
+    enum: [1, 2]
+
+  '#size-cells':
+    description: The number of cells used to represent the size of an address
+      range in the host1x address space.
+    enum: [1, 2]
+
+  # required
+  ranges:
+    description: The mapping of the host1x address space to the CPU address
+      space.
+
+  clocks:
+    description: Must contain one entry, for the module clock. See
+      ../clocks/clock-bindings.txt for details.
+
+  clock-names:
+    items:
+      - const: host1x
+
+  resets:
+    description: Must contain an entry for each entry in reset-names. See
+      ../reset/reset.txt for details.
+
+  reset-names:
+    items:
+      - const: host1x
+
+  # optional
+  iommus:
+    $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
+
+  memory-controllers:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-host1x
+              - nvidia,tegra194-host1x
+    then:
+      properties:
+        reg-names:
+          items:
+            - const: hypervisor
+            - const: vm
+
+        reg:
+          items:
+            - description: physical base address and length of the register
+                region assigned to the VM
+            - description: physical base address and length of the register
+                region used by the hypervisor
+
+      required:
+        - reg-names
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - const: nvidia,tegra20-host1x
+              - const: nvidia,tegra30-host1x
+              - const: nvidia,tegra114-host1x
+              - const: nvidia,tegra124-host1x
+
+    then:
+      patternProperties:
+        "^vi@[0-9a-f]+$":
+          description: video input
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-vi
+                - const: nvidia,tegra30-vi
+                - const: nvidia,tegra114-vi
+                - const: nvidia,tegra124-vi
+                - items:
+                    - const: nvidia,tegra132-vi
+                    - const: nvidia,tegra124-vi
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              maxItems: 1
+
+            resets: true
+
+            reset-names:
+              items:
+                - const: vi
+    else:
+      patternProperties:
+        "^vi@[0-9a-f]+$":
+          description: video input
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra210-vi
+                - const: nvidia,tegra186-vi
+                - const: nvidia,tegra194-vi
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              maxItems: 1
+
+            power-domains: true
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - const: nvidia,tegra210-host1x
+    then:
+      patternProperties:
+        "^vi@[0-9a-f]+$":
+          patternProperties:
+            "^csi@[0-9a-f]+$":
+              description: camera sensor interface
+              type: object
+              properties:
+                compatible:
+                  enum:
+                    - nvidia,tegra210-csi
+
+                reg: true
+
+                clocks: true
+
+                clock-names:
+                  items:
+                    - const: csi
+                    - const: cilab
+                    - const: cilcd
+                    - const: cile
+                    - const: csi_tpg
+
+                power-domains: true
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-host1x
+              - nvidia,tegra30-host1x
+              - nvidia,tegra114-host1x
+    then:
+      patternProperties:
+        "^epp@[0-9a-f]+$":
+          description: encoder pre-processor
+          type: object
+          properties:
+            compatible:
+              enum:
+                - nvidia,tegra20-epp
+                - nvidia,tegra30-epp
+                - nvidia,tegra114-epp
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              maxItems: 1
+
+            resets:
+              items:
+                - description: module reset
+
+            reset-names:
+              items:
+                - const: epp
+
+            iommus:
+              $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
+
+          unevaluatedProperties: false
+
+        "^mpe@[0-9a-f]+$":
+          description: video encoder
+          type: object
+          properties:
+            compatible:
+              enum:
+                - nvidia,tegra20-mpe
+                - nvidia,tegra30-mpe
+                - nvidia,tegra114-mpe
+
+            reg:
+              minItems: 1
+              maxItems: 1
+
+            interrupts:
+              minItems: 1
+              maxItems: 1
+
+            clocks:
+              minItems: 1
+              maxItems: 1
+
+            resets:
+              minItems: 1
+              maxItems: 1
+
+            reset-names:
+              items:
+                - const: mpe
+
+            iommus:
+              $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
+
+          unevaluatedProperties: false
+
+        "^gr2d@[0-9a-f]+$":
+          description: 2D graphics engine
+          type: object
+          properties:
+            compatible:
+              enum:
+                - nvidia,tegra20-gr2d
+                - nvidia,tegra30-gr2d
+                - nvidia,tegra114-gr2d
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              maxItems: 1
+
+            resets:
+              items:
+                - description: module reset
+
+            reset-names:
+              items:
+                - const: 2d
+
+            iommus:
+              $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
+
+          unevaluatedProperties: false
+
+        "^gr3d@[0-9a-f]+$":
+          description: 3D graphics engine
+          type: object
+          properties:
+            compatible:
+              enum:
+                - nvidia,tegra20-gr3d
+                - nvidia,tegra30-gr3d
+                - nvidia,tegra114-gr3d
+
+            reg:
+              maxItems: 1
+
+            iommus:
+              $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
+
+          allOf:
+            - if:
+                properties:
+                  compatible:
+                    contains:
+                      const: nvidia,tegra30-gr3d
+              then:
+                properties:
+                  clocks:
+                    items:
+                      - description: primary module clock
+                      - description: secondary module clock
+
+                  clock-names:
+                    items:
+                      - const: 3d
+                      - const: 3d2
+
+                  resets:
+                    items:
+                      - description: primary module reset
+                      - description: secondary module reset
+
+                  reset-names:
+                    items:
+                      - const: 3d
+                      - const: 3d2
+              else:
+                properties:
+                  clocks:
+                    items:
+                      - description: module clock
+
+                  clock-names:
+                    items:
+                      - const: 3d
+
+                  resets:
+                    items:
+                      - description: module reset
+
+                  reset-names:
+                    items:
+                      - const: 3d
+
+          unevaluatedProperties: false
+
+        "^tvo@[0-9a-f]+$":
+          description: TV encoder output
+          type: object
+          properties:
+            # required
+            compatible:
+              enum:
+                - nvidia,tegra20-tvo
+                - nvidia,tegra30-tvo
+                - nvidia,tegra114-tvo
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              maxItems: 1
+
+            status:
+              $ref: "/schemas/dt-core.yaml#/properties/status"
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-host1x
+              - nvidia,tegra30-host1x
+              - nvidia,tegra114-host1x
+              - nvidia,tegra124-host1x
+              - nvidia,tegra132-host1x
+              - nvidia,tegra210-host1x
+    then:
+      patternProperties:
+        "^dc@[0-9a-f]+$":
+          description: display controller
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-dc
+                - const: nvidia,tegra30-dc
+                - const: nvidia,tegra114-dc
+                - const: nvidia,tegra124-dc
+                - items:
+                    - const: nvidia,tegra124-dc
+                    - const: nvidia,tegra132-dc
+                - const: nvidia,tegra210-dc
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              items:
+                - description: display controller pixel clock
+
+            clock-names:
+              items:
+                - const: dc
+
+            resets:
+              items:
+                - description: module reset
+
+            reset-names:
+              items:
+                - const: dc
+
+            iommus:
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            nvidia,head:
+              description: The number of the display controller head. This is
+                used to setup the various types of output to receive video
+                data from the given head.
+              $ref: "/schemas/types.yaml#/definitions/uint32"
+
+          allOf:
+            - if:
+                properties:
+                  compatible:
+                    contains:
+                      enum:
+                        - nvidia,tegra20-dc
+                        - nvidia,tegra30-dc
+                        - nvidia,tegra114-dc
+              then:
+                properties:
+                  rgb:
+                    description: Each display controller node has a child node,
+                      named "rgb", that represents the RGB output associated
+                      with the controller.
+                    type: object
+                    properties:
+                      nvidia,ddc-i2c-bus:
+                        description: phandle of an I2C controller used for DDC
+                          EDID probing
+                        $ref: "/schemas/types.yaml#/definitions/phandle"
+
+                      nvidia,hpd-gpio:
+                        description: specifies a GPIO used for hotplug
+                          detection
+                        $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+                      nvidia,edid:
+                        description: supplies a binary EDID blob
+                        $ref: "/schemas/types.yaml#/definitions/uint8-array"
+
+                      nvidia,panel:
+                        description: phandle of a display panel
+                        $ref: "/schemas/types.yaml#/definitions/phandle"
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-host1x
+              - nvidia,tegra194-host1x
+    then:
+      patternProperties:
+        "^display-hub@[0-9a-f]+$":
+          properties:
+            compatible:
+              oneOf:
+                - description: NVIDIA Tegra186
+                  const: nvidia,tegra186-display
+
+                - description: NVIDIA Tegra194
+                  const: nvidia,tegra194-display
+
+            '#address-cells':
+              const: 1
+
+            '#size-cells':
+              const: 1
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            ranges:
+              $ref: "/schemas/dt-core.yaml#/properties/ranges"
+
+            status:
+              $ref: "/schemas/dt-core.yaml#/properties/status"
+
+            resets:
+              items:
+                - description: display hub reset
+                - description: window group 0 reset
+                - description: window group 1 reset
+                - description: window group 2 reset
+                - description: window group 3 reset
+                - description: window group 4 reset
+                - description: window group 5 reset
+
+            reset-names:
+              items:
+                - const: misc
+                - const: wgrp0
+                - const: wgrp1
+                - const: wgrp2
+                - const: wgrp3
+                - const: wgrp4
+                - const: wgrp5
+
+            power-domains:
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+          patternProperties:
+            "^display@[0-9a-f]+$":
+              description: display controller
+              type: object
+              properties:
+                compatible:
+                  enum:
+                    - nvidia,tegra186-dc
+                    - nvidia,tegra194-dc
+
+                reg:
+                  maxItems: 1
+
+                interrupts:
+                  maxItems: 1
+
+                clocks:
+                  items:
+                    - description: display controller pixel clock
+
+                clock-names:
+                  items:
+                    - const: dc
+
+                resets:
+                  items:
+                    - description: display controller reset
+
+                reset-names:
+                  items:
+                    - const: dc
+
+                power-domains:
+                  description: A list of phandle and specifiers that identify
+                    the power domains that this display controller is part of.
+                  $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+                iommus:
+                  description: a phandle and specifier identifying the SMMU
+                    master interface of this display controller.
+                  $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+                memory-controllers:
+                  $ref: /schemas/types.yaml#/definitions/phandle-array
+
+                nvidia,outputs:
+                  description: A list of phandles of outputs that this display
+                    controller can drive.
+                  $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+                nvidia,head:
+                  description: The number of the display controller head. This
+                    is used to setup the various types of output to receive
+                    video data from the given head.
+                  $ref: "/schemas/types.yaml#/definitions/uint32"
+
+              unevaluatedProperties: false
+
+          allOf:
+            - if:
+                properties:
+                  compatible:
+                    contains:
+                      const: nvidia,tegra186-display
+              then:
+                properties:
+                  clocks:
+                    items:
+                      - description: display core clock
+                      - description: display stream compression clock
+                      - description: display hub clock
+
+                  clock-names:
+                    items:
+                      - const: disp
+                      - const: dsc
+                      - const: hub
+              else:
+                properties:
+                  clocks:
+                    items:
+                      - description: display core clock
+                      - description: display hub clock
+
+                  clock-names:
+                    items:
+                      - const: disp
+                      - const: hub
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-host1x
+              - nvidia,tegra30-host1x
+              - nvidia,tegra114-host1x
+              - nvidia,tegra124-host1x
+    then:
+      patternProperties:
+        "^hdmi@[0-9a-f]+$":
+          description: High Definition Multimedia Interface
+          type: object
+          properties:
+            # required
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-hdmi
+                - const: nvidia,tegra30-hdmi
+                - const: nvidia,tegra114-hdmi
+                - const: nvidia,tegra124-hdmi
+                - items:
+                    - const: nvidia,tegra132-hdmi
+                    - const: nvidia,tegra124-hdmi
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              items:
+                - description: module clock
+                - description: parent clock
+
+            clock-names:
+              items:
+                - const: hdmi
+                - const: parent
+
+            resets:
+              items:
+                - description: module reset
+
+            reset-names:
+              items:
+                - const: hdmi
+
+            hdmi-supply:
+              description: supply for the +5V HDMI connector pin
+
+            vdd-supply:
+              description: regulator for supply voltage
+
+            pll-supply:
+              description: regulator for PLL
+
+            # optional
+            nvidia,ddc-i2c-bus:
+              description: phandle of an I2C controller used for DDC EDID
+                probing
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+            nvidia,hpd-gpio:
+              description: specifies a GPIO used for hotplug detection
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            nvidia,edid:
+              description: supplies a binary EDID blob
+              $ref: "/schemas/types.yaml#/definitions/uint8-array"
+
+            nvidia,panel:
+              description: phandle of a display panel
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+            status:
+              $ref: "/schemas/dt-core.yaml#/properties/status"
+
+            phandle:
+              $ref: "/schemas/types.yaml#/definitions/uint32"
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra124-host1x
+              - nvidia,tegra210-host1x
+              - nvidia,tegra186-host1x
+              - nvidia,tegra194-host1x
+    then:
+      patternProperties:
+        "^sor@[0-9a-f]+$":
+          description: |
+            The Serial Output Resource (SOR) can be used to drive HDMI, LVDS,
+            eDP and DP outputs.
+
+            See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
+            regarding the DPAUX pad controller bindings.
+          type: object
+          properties:
+            # required
+            compatible:
+              oneOf:
+                - const: nvidia,tegra124-sor
+                - items:
+                    - const: nvidia,tegra132-sor
+                    - const: nvidia,tegra124-sor
+                - const: nvidia,tegra210-sor
+                - const: nvidia,tegra210-sor1
+                - const: nvidia,tegra186-sor
+                - const: nvidia,tegra186-sor1
+                - const: nvidia,tegra194-sor
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            resets:
+              items:
+                - description: module reset
+
+            reset-names:
+              items:
+                - const: sor
+
+            status:
+              $ref: "/schemas/dt-core.yaml#/properties/status"
+
+            power-domains:
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            avdd-io-hdmi-dp-supply:
+              description: I/O supply for HDMI/DP
+
+            vdd-hdmi-dp-pll-supply:
+              description: PLL supply for HDMI/DP
+
+            hdmi-supply:
+              description: +5.0V HDMI connector supply
+
+            # Tegra186 and later
+            nvidia,interface:
+              description: index of the SOR interface
+              $ref: "/schemas/types.yaml#/definitions/uint32"
+
+            # optional
+            nvidia,ddc-i2c-bus:
+              description: phandle of an I2C controller used for DDC EDID
+                probing
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+            nvidia,hpd-gpio:
+              description: specifies a GPIO used for hotplug detection
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            nvidia,edid:
+              description: supplies a binary EDID blob
+              $ref: "/schemas/types.yaml#/definitions/uint8-array"
+
+            nvidia,panel:
+              description: phandle of a display panel
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+            nvidia,xbar-cfg:
+              description: 5 cells containing the crossbar configuration.
+                Each lane of the SOR, identified by the cell's index, is
+                mapped via the crossbar to the pad specified by the cell's
+                value.
+              $ref: "/schemas/types.yaml#/definitions/uint32-array"
+
+            # optional when driving an eDP output
+            nvidia,dpaux:
+              description: phandle to a DispayPort AUX interface
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+            pinctrl-names: true
+            phandle:
+              $ref: "/schemas/types.yaml#/definitions/uint32"
+
+          patternProperties:
+            "^pinctrl-[0-9]+$": true
+
+          allOf:
+            - if:
+                properties:
+                  compatible:
+                    contains:
+                      enum:
+                        - nvidia,tegra186-sor
+                        - nvidia,tegra194-sor
+              then:
+                properties:
+                  clocks:
+                    items:
+                      - description: clock input for the SOR hardware
+                      - description: SOR output clock
+                      - description: input for the pixel clock
+                      - description: reference clock for the SOR clock
+                      - description: safe reference clock for the SOR clock
+                          during power up
+                      - description: SOR pad output clock
+
+                  clock-names:
+                    items:
+                      - const: sor
+                      - enum:
+                          - source # deprecated
+                          - out
+                      - const: parent
+                      - const: dp
+                      - const: safe
+                      - const: pad
+              else:
+                properties:
+                  clocks:
+                    items:
+                      - description: clock input for the SOR hardware
+                      - description: SOR output clock
+                      - description: input for the pixel clock
+                      - description: reference clock for the SOR clock
+                      - description: safe reference clock for the SOR clock
+                          during power up
+
+                  clock-names:
+                    items:
+                      - const: sor
+                      - enum:
+                          - source # deprecated
+                          - out
+                      - const: parent
+                      - const: dp
+                      - const: safe
+
+          unevaluatedProperties: false
+
+        "^dpaux@[0-9a-f]+$":
+          description: DisplayPort AUX interface
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra124-dpaux
+                - items:
+                    - const: nvidia,tegra132-dpaux
+                    - const: nvidia,tegra124-dpaux
+                - const: nvidia,tegra210-dpaux
+                - const: nvidia,tegra186-dpaux
+                - const: nvidia,tegra194-dpaux
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              items:
+                - description: clock input for the DPAUX hardware
+                - description: reference clock
+
+            clock-names:
+              items:
+                - const: dpaux
+                - const: parent
+
+            resets:
+              items:
+                - description: module reset
+
+            reset-names:
+              items:
+                - const: dpaux
+
+            status:
+              $ref: "/schemas/dt-core.yaml#/properties/status"
+
+            phandle:
+              $ref: "/schemas/types.yaml#/definitions/uint32"
+
+            power-domains:
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            i2c-bus:
+              description: Subnode where I2C slave devices are listed. This
+                subnode must be always present. If there are no I2C slave
+                devices, an empty node should be added. See ../../i2c/i2c.yaml
+                for more information.
+
+            vdd-supply:
+              description: phandle of a supply that powers the DisplayPort
+                link
+
+          patternProperties:
+            "^pinmux-.*$":
+              type: object
+
+          unevaluatedProperties: false
+
+        "^vic@[0-9a-f]+$":
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra124-vic
+                - items:
+                    - const: nvidia,tegra132-vic
+                    - const: nvidia,tegra124-vic
+                - const: nvidia,tegra210-vic
+                - const: nvidia,tegra186-vic
+                - const: nvidia,tegra194-vic
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            clocks:
+              items:
+                - description: clock input for the VIC hardware
+
+            clock-names:
+              items:
+                  const: vic
+
+            resets:
+              items:
+                - description: module reset
+
+            reset-names:
+              items:
+                - const: vic
+
+            power-domains:
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            iommus:
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            memory-controllers:
+              $ref: /schemas/types.yaml#/definitions/phandle-array
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-host1x
+              - nvidia,tegra30-host1x
+              - nvidia,tegra114-host1x
+              - nvidia,tegra124-host1x
+              - nvidia,tegra210-host1x
+              - nvidia,tegra186-host1x
+    then:
+      patternProperties:
+        "^dsi@[0-9a-f]+$":
+          description: display serial interface
+          type: object
+          properties:
+            # required
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-dsi
+                - const: nvidia,tegra30-dsi
+                - const: nvidia,tegra114-dsi
+                - const: nvidia,tegra124-dsi
+                - items:
+                    - const: nvidia,tegra132-dsi
+                    - const: nvidia,tegra124-dsi
+                - const: nvidia,tegra210-dsi
+                - const: nvidia,tegra186-dsi
+
+            status:
+              $ref: "/schemas/dt-core.yaml#/properties/status"
+
+            phandle:
+              $ref: "/schemas/types.yaml#/definitions/uint32"
+
+            '#address-cells':
+              const: 1
+
+            '#size-cells':
+              const: 0
+
+            reg:
+              maxItems: 1
+
+            interrupts:
+              maxItems: 1
+
+            resets:
+              items:
+                - description: module reset
+
+            reset-names:
+              items:
+                - const: dsi
+
+            power-domains:
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            avdd-dsi-csi-supply:
+              description: phandle of a supply that powers the DSI controller
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+            nvidia,mipi-calibrate:
+              description: Should contain a phandle and a specifier specifying
+                which pads are used by this DSI output and need to be
+                calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            # optional
+            nvidia,ddc-i2c-bus:
+              description: phandle of an I2C controller used for DDC EDID
+                probing
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+            nvidia,hpd-gpio:
+              description: specifies a GPIO used for hotplug detection
+              $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+            nvidia,edid:
+              description: supplies a binary EDID blob
+              $ref: "/schemas/types.yaml#/definitions/uint8-array"
+
+            nvidia,panel:
+              description: phandle of a display panel
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+            nvidia,ganged-mode:
+              description: contains a phandle to a second DSI controller to
+                gang up with in order to support up to 8 data lanes
+              $ref: "/schemas/types.yaml#/definitions/phandle"
+
+          patternProperties:
+            "^panel@[0-9]+$":
+              type: object
+
+          allOf:
+            - if:
+                properties:
+                  compatible:
+                    contains:
+                      enum:
+                        - nvidia,tegra20-dsi
+                        - nvidia,tegra30-dsi
+              then:
+                properties:
+                  clocks:
+                    items:
+                      - description: DSI module clock
+                      - description: input for the pixel clock
+
+                  clock-names:
+                    items:
+                      - const: dsi
+                      - const: parent
+              else:
+                properties:
+                  clocks:
+                    items:
+                      - description: DSI module clock
+                      - description: low-power module clock
+                      - description: input for the pixel clock
+
+                  clock-names:
+                    items:
+                      - const: dsi
+                      - const: lp
+                      - const: parent
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-host1x
+              - nvidia,tegra30-host1x
+              - nvidia,tegra210-host1x
+    then:
+      patternProperties:
+        "^isp@[0-9a-f]+$":
+          type: object
+
+          unevaluatedProperties: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra210-host1x
+    then:
+      patternProperties:
+        "^tsec@[0-9a-f]+$":
+          type: object
+
+        "^nvjpg@[0-9a-f]+$":
+          type: object
+
+        "^nvdec@[0-9a-f]+$":
+          type: object
+
+        "^nvenc@[0-9a-f]+$":
+          type: object
+
+        "^i2c@[0-9a-f]+$":
+          type: object
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra186-host1x
+    then:
+      patternProperties:
+        "^padctl@[0-9a-f]+$":
+          type: object
+          $ref: "/schemas/reset/reset.yaml"
+          properties:
+            compatible:
+              const: nvidia,tegra186-dsi-padctl
+
+            reg:
+              $ref: "/schemas/dt-core.yaml#/properties/reg"
+
+            status:
+              $ref: "/schemas/dt-core.yaml#/properties/status"
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+
+    host1x@50000000 {
+        compatible = "nvidia,tegra20-host1x", "simple-bus";
+        reg = <0x50000000 0x00024000>;
+        interrupts = <0 65 0x04   /* mpcore syncpt */
+                      0 67 0x04>; /* mpcore general */
+        interrupt-names = "syncpt", "host1x";
+        clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
+        clock-names = "host1x";
+        resets = <&tegra_car 28>;
+        reset-names = "host1x";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x54000000 0x54000000 0x04000000>;
+
+        mpe@54040000 {
+                compatible = "nvidia,tegra20-mpe";
+                reg = <0x54040000 0x00040000>;
+                interrupts = <0 68 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_MPE>;
+                resets = <&tegra_car 60>;
+                reset-names = "mpe";
+        };
+
+        vi@54080000 {
+                compatible = "nvidia,tegra20-vi";
+                reg = <0x54080000 0x00040000>;
+                interrupts = <0 69 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_VI>;
+                resets = <&tegra_car 100>;
+                reset-names = "vi";
+        };
+
+        epp@540c0000 {
+                compatible = "nvidia,tegra20-epp";
+                reg = <0x540c0000 0x00040000>;
+                interrupts = <0 70 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_EPP>;
+                resets = <&tegra_car 19>;
+                reset-names = "epp";
+        };
+
+        isp@54100000 {
+                compatible = "nvidia,tegra20-isp";
+                reg = <0x54100000 0x00040000>;
+                interrupts = <0 71 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_ISP>;
+                resets = <&tegra_car 23>;
+                reset-names = "isp";
+        };
+
+        gr2d@54140000 {
+                compatible = "nvidia,tegra20-gr2d";
+                reg = <0x54140000 0x00040000>;
+                interrupts = <0 72 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_GR2D>;
+                resets = <&tegra_car 21>;
+                reset-names = "2d";
+        };
+
+        gr3d@54180000 {
+                compatible = "nvidia,tegra20-gr3d";
+                reg = <0x54180000 0x00040000>;
+                clocks = <&tegra_car TEGRA20_CLK_GR3D>;
+                resets = <&tegra_car 24>;
+                reset-names = "3d";
+        };
+
+        dc@54200000 {
+                compatible = "nvidia,tegra20-dc";
+                reg = <0x54200000 0x00040000>;
+                interrupts = <0 73 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_DISP1>;
+                clock-names = "dc";
+                resets = <&tegra_car 27>;
+                reset-names = "dc";
+
+                rgb {
+                        status = "disabled";
+                };
+        };
+
+        dc@54240000 {
+                compatible = "nvidia,tegra20-dc";
+                reg = <0x54240000 0x00040000>;
+                interrupts = <0 74 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_DISP2>;
+                clock-names = "dc";
+                resets = <&tegra_car 26>;
+                reset-names = "dc";
+
+                rgb {
+                        status = "disabled";
+                };
+        };
+
+        hdmi@54280000 {
+                compatible = "nvidia,tegra20-hdmi";
+                reg = <0x54280000 0x00040000>;
+                interrupts = <0 75 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_HDMI>,
+                         <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
+                clock-names = "hdmi", "parent";
+                resets = <&tegra_car 51>;
+                reset-names = "hdmi";
+                status = "disabled";
+        };
+
+        tvo@542c0000 {
+                compatible = "nvidia,tegra20-tvo";
+                reg = <0x542c0000 0x00040000>;
+                interrupts = <0 76 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_TVO>;
+                status = "disabled";
+        };
+
+        dsi@54300000 {
+                compatible = "nvidia,tegra20-dsi";
+                reg = <0x54300000 0x00040000>;
+                clocks = <&tegra_car TEGRA20_CLK_DSI>,
+                         <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
+                clock-names = "dsi", "parent";
+                resets = <&tegra_car 48>;
+                reset-names = "dsi";
+                status = "disabled";
+        };
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra210-mc.h>
+
+    host1x@50000000 {
+        compatible = "nvidia,tegra210-host1x", "simple-bus";
+        reg = <0x50000000 0x00024000>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>, /* mpcore syncpt */
+                     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* mpcore general */
+        interrupt-names = "syncpt", "host1x";
+        clocks = <&tegra_car TEGRA210_CLK_HOST1X>;
+        clock-names = "host1x";
+        resets = <&tegra_car 28>;
+        reset-names = "host1x";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x54000000 0x54000000 0x01000000>;
+        iommus = <&mc TEGRA_SWGROUP_HC>;
+
+        vi@54080000 {
+            compatible = "nvidia,tegra210-vi";
+            reg = <0x54080000 0x00000700>;
+            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+            assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+            assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+            clocks = <&tegra_car TEGRA210_CLK_VI>;
+            power-domains = <&pd_venc>;
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            ranges = <0x0 0x54080000 0x2000>;
+
+            csi@838 {
+                compatible = "nvidia,tegra210-csi";
+                reg = <0x838 0x1300>;
+                assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+                                  <&tegra_car TEGRA210_CLK_CILCD>,
+                                  <&tegra_car TEGRA210_CLK_CILE>,
+                                  <&tegra_car TEGRA210_CLK_CSI_TPG>;
+                assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+                                         <&tegra_car TEGRA210_CLK_PLL_P>,
+                                         <&tegra_car TEGRA210_CLK_PLL_P>;
+                assigned-clock-rates = <102000000>,
+                                       <102000000>,
+                                       <102000000>,
+                                       <972000000>;
+
+                clocks = <&tegra_car TEGRA210_CLK_CSI>,
+                         <&tegra_car TEGRA210_CLK_CILAB>,
+                         <&tegra_car TEGRA210_CLK_CILCD>,
+                         <&tegra_car TEGRA210_CLK_CILE>,
+                         <&tegra_car TEGRA210_CLK_CSI_TPG>;
+                clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
+                power-domains = <&pd_sor>;
+            };
+        };
+    };
-- 
2.24.1
