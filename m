From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC] dt-bindings: display: Convert Tegra host1x to json-schema
Date: Thu, 30 Jan 2020 18:40:06 +0100
Message-ID: <20200130174006.3154922-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Convert the Tegra host1x controller bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   | 487 ----------
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 884 ++++++++++++++++++
 2 files changed, 884 insertions(+), 487 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
deleted file mode 100644
index 6fd0a83ec889..000000000000
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ /dev/null
@@ -1,487 +0,0 @@
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
-Optional properties:
-- interconnects: Description of the interconnect paths for the host1x
-  controller; see ../interconnect/interconnect.txt for details.
-- interconnect-names: A list of names identifying each entry listed in the
-  "interconnects" property.
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
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
-    See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - vi
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
-  - interconnects: Description of the interconnect paths for the display
-    controller; see ../interconnect/interconnect.txt for details.
-  - interconnect-names: A list of names identifying each entry listed in the
-    "interconnects" property.
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
-  - interconnects: Description of the interconnect paths for the VIC; see
-    ../../interconnect/interconnect.txt for details.
-  - interconnect-names: A list of names identifying each entry listed in the
-    "interconnects" property.
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
-    - interconnects: Description of the interconnect paths for the display
-      controller; see ../interconnect/interconnect.txt for details.
-    - interconnect-names: A list of names identifying each entry listed in the
-      "interconnects" property.
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
-		vi {
-			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
-			interrupts = <0 69 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_VI>;
-			resets = <&tegra_car 100>;
-			reset-names = "vi";
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
index 000000000000..26b2325813eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -0,0 +1,884 @@
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
+        allOf:
+          - enum:
+              - nvidia,tegra20-host1x
+          - const: simple-bus
+
+      - description: NVIDIA Tegra30
+        allOf:
+          - enum:
+              - nvidia,tegra30-host1x
+          - const: simple-bus
+
+      - description: NVIDIA Tegra114
+        allOf:
+          - enum:
+              - nvidia,tegra114-host1x
+          - const: simple-bus
+
+      - description: NVIDIA Tegra124
+        allOf:
+          - enum:
+              - nvidia,tegra124-host1x
+          - const: simple-bus
+
+      - description: NVIDIA Tegra132
+        allOf:
+          - enum:
+              - nvidia,tegra132-host1x
+          - const: simple-bus
+
+      - description: NVIDIA Tegra210
+        allOf:
+          - enum:
+              - nvidia,tegra210-host1x
+          - const: simple-bus
+
+      - description: NVIDIA Tegra186
+        allOf:
+          - enum:
+              - nvidia,tegra186-host1x
+          - const: simple-bus
+
+      - description: NVIDIA Tegra194
+        allOf:
+          - enum:
+              - nvidia,tegra194-host1x
+          - const: simple-bus
+
+  interrupts:
+    items:
+      - description: host1x syncpoint interrupt
+      - description: host1x general interrupt
+    minItems: 1
+    maxItems: 2
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
+  ranges:
+    description: The mapping of the host1x address space to the CPU address
+      space.
+
+  clocks:
+    description: Must contain one entry, for the module clock. See
+      ../clocks/clock-bindings.txt for details.
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
+  interconnects:
+    description: Description of the interconnect paths for the host1x
+      controller; see ../interconnect/interconnect.txt for details.
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+
+  # host1x clients
+  vi:
+    description: video input
+    type: object
+    properties:
+      compatible:
+        oneOf:
+          - const: nvidia,tegra20-vi
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra114-vi
+          - const: nvidia,tegra124-vi
+          - allOf:
+              - const: nvidia,tegra132-vi
+              - const: nvidia,tegra124-vi
+          - const: nvidia,tegra210-vi
+          - const: nvidia,tegra186-vi
+          - const: nvidia,tegra194-vi
+
+      reg: true
+      interrupts: true
+      clocks: true
+
+      resets: true
+      reset-names:
+        items:
+          - const: vi
+
+  isp:
+    description: image signal processor
+    type: object
+    properties:
+      compatible:
+        oneOf:
+          - const: nvidia,tegra20-isp
+          - const: nvidia,tegra30-isp
+          - const: nvidia,tegra114-isp
+          - const: nvidia,tegra124-isp
+          - allOf:
+              - const: nvidia,tegra132-isp
+              - const: nvidia,tegra124-isp
+          - const: nvidia,tegra210-isp
+          - const: nvidia,tegra186-isp
+          - const: nvidia,tegra194-isp
+
+      reg: true
+      interrupts: true
+      clocks: true
+      resets: true
+      reset-names:
+        items:
+          - const: isp
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - const: nvidia,tegra186-host1x
+              - const: nvidia,tegra194-host1x
+    then:
+      properties:
+        reg-names:
+          items:
+            - const: hypervisor
+            - const: vm
+        reg:
+          items:
+            - description: physical base address and length of the register
+                region assigned to the VM
+            - description: physical base address and length of the register
+                region used by the hypervisor
+    else:
+      properties:
+        reg:
+          items:
+            - description: physical base address and length of the controller
+                registers
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - const: nvidia,tegra20-host1x
+              - const: nvidia,tegra30-host1x
+    then:
+      properties:
+        epp:
+          description: encoder pre-processor
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-epp
+                - const: nvidia,tegra30-epp
+                - const: nvidia,tegra114-epp
+            reg: true
+            interrupts: true
+            clocks: true
+            resets: true
+            reset-names:
+              items:
+                - const: epp
+
+        mpe:
+          description: video encoder
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-mpe
+                - const: nvidia,tegra30-mpe
+                - const: nvidia,tegra114-mpe
+            reg: true
+            interrupts: true
+            clocks: true
+            resets: true
+            reset-names:
+              items:
+                - const: mpe
+
+        gr2d:
+          description: 2D graphics engine
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-gr2d
+                - const: nvidia,tegra30-gr2d
+                - const: nvidia,tegra114-gr2d
+            reg: true
+            interrupts: true
+            clocks: true
+            resets: true
+            reset-names:
+              items:
+                - const: 2d
+
+        gr3d:
+          description: 3D graphics engine
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-gr3d
+                - const: nvidia,tegra30-gr3d
+                - const: nvidia,tegra114-gr3d
+            reg: true
+            clocks: true
+            resets: true
+
+          allOf:
+            - if:
+                properties:
+                  compatible:
+                    contains:
+                      oneOf:
+                        - const: nvidia,tegra30-gr3d
+              then:
+                properties:
+                  clock-names:
+                    items:
+                      - const: 3d
+                      - const: 3d2
+                  reset-names:
+                    items:
+                      - const: 3d
+                      - const: 3d2
+              else:
+                properties:
+                  clock-names:
+                    items:
+                      - const: 3d
+                  reset-names:
+                    items:
+                      - const: 3d
+
+        tvo:
+          description: TV encoder output
+          type: object
+          properties:
+            # required
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-tvo
+                - const: nvidia,tegra30-tvo
+                - const: nvidia,tegra114-tvo
+            reg: true
+            interrupts: true
+            clocks: true
+
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
+              - const: nvidia,tegra132-host1x
+              - const: nvidia,tegra210-host1x
+    then:
+      properties:
+        dc:
+          description: display controller
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra20-dc
+                - const: nvidia,tegra30-dc
+                - const: nvidia,tegra114-dc
+                - const: nvidia,tegra124-dc
+                - allOf:
+                    - const: nvidia,tegra124-dc
+                    - const: nvidia,tegra132-dc
+                - const: nvidia,tegra210-dc
+            reg: true
+            interrupts: true
+            clocks: true
+            clock-names:
+              items:
+                - const: dc
+                - const: parent
+            resets: true
+            reset-names:
+              items:
+                - const: dc
+            interconnects: true
+            interconnect-names:
+              items:
+                - const: XXX
+                - const: XXX
+            nvidia,head:
+              description: The number of the display controller head. This is
+                used to setup the various types of output to receive video
+                data from the given head.
+              $ref: /schemas/types.yaml#/definitions/uint32
+
+          if:
+            properties:
+              compatible:
+                contains:
+                  oneOf:
+                    - const: nvidia,tegra20-dc
+                    - const: nvidia,tegra30-dc
+                    - const: nvidia,tegra114-dc
+          then:
+            properties:
+              rgb:
+                description: Each display controller node has a child node,
+                  named "rgb", that represents the RGB output associated with
+                  the controller.
+                type: object
+                properties:
+                  nvidia,ddc-i2c-bus:
+                    $ref: /schemas/types.yaml#/definitions/phandle
+                    description: phandle of an I2C controller used for DDC
+                      EDID probing
+
+                  nvidia,hpd-gpio:
+                    $ref: /schemas/types.yaml#/definitions/phandle-array
+                    description: specifies a GPIO used for hotplug detection
+
+                  nvidia,edid:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    description: supplies a binary EDID blob
+
+                  nvidia,panel:
+                    $ref: /schemas/types.yaml#/definitions/phandle
+                    description: phandle of a display panel
+
+                  # XXX
+    else:
+      properties:
+        display-hub:
+          description: display controller hub
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - allOf:
+                    - const: nvidia,tegra186-display
+                    - const: simple-bus
+                - allOf:
+                    - const: nvidia,tegra194-display
+                    - const: simple-bus
+            reg: true
+            interrupts: true
+            clocks: true
+            clock-names:
+              items:
+                - const: disp
+                - const: dsc
+                - const: hub
+            resets: true
+            reset-names:
+              items:
+                - const: misc
+                - const: wgrp0
+                - const: wgrp1
+                - const: wgrp2
+                - const: wgrp3
+                - const: wgrp4
+                - const: wgrp5
+            power-domains: true
+            ranges: true
+
+            display:
+              #$nodename: display@[0-9a-f]+
+              description: display controller
+              type: object
+              properties:
+                compatible:
+                  oneOf:
+                    - const: nvidia,tegra186-dc
+                    - const: nvidia,tegra194-dc
+                reg: true
+                interrupts: true
+                clocks: true
+                clock-names:
+                  items:
+                    - const: dc
+                    - const: parent
+                resets: true
+                reset-names:
+                  items:
+                    - const: dc
+                power-domains:
+                  description: A list of phandle and specifiers that identify
+                    the power domains that this display controller is part of.
+
+                interconnects: true
+                interconnect-names:
+                  items:
+                    - const: read-0
+                    - const: read-1
+
+                iommus:
+                  $ref: /schemas/types.yaml#/definitions/phandle-array
+                  description: a phandle and specifier identifying the SMMU
+                    master interface of this display controller.
+                nvidia,outputs:
+                  description: A list of phandles of outputs that this display
+                    controller can drive.
+                  $ref: /schemas/types.yaml#/definitions/phandle-array
+                nvidia,head:
+                  description: The number of the display controller head. This
+                    is used to setup the various types of output to receive
+                    video data from the given head.
+                  $ref: /schemas/types.yaml#/definitions/uint32
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
+    then:
+      properties:
+        hdmi:
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
+                - allOf:
+                    - const: nvidia,tegra132-hdmi
+                    - const: nvidia,tegra124-hdmi
+            reg: true
+            interrupts: true
+            clocks: true
+            clock-names:
+              items:
+                - const: hdmi
+                - const: parent
+            resets: true
+            reset-names:
+              items:
+                - const: hdmi
+            hdmi-supply:
+              description: supply for the +5V HDMI connector pin
+            vdd-supply:
+              description: regulator for supply voltage
+            pll-supply:
+              description: regulator for PLL
+
+            # optional
+            nvidia,ddc-i2c-bus:
+              description: phandle of an I2C controller used for DDC EDID
+                probing
+              $ref: /schemas/types.yaml#/definitions/phandle
+            nvidia,hpd-gpio:
+              description: specifies a GPIO used for hotplug detection
+              $ref: /schemas/types.yaml#/definitions/phandle-array
+            nvidia,edid:
+              description: supplies a binary EDID blob
+              $ref: /schemas/types.yaml#/definitions/uint8-array
+            nvidia,panel:
+              description: phandle of a display panel
+              $ref: /schemas/types.yaml#/definitions/phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - const: nvidia,tegra124-host1x
+              - const: nvidia,tegra210-host1x
+              - const: nvidia,tegra186-host1x
+              - const: nvidia,tegra194-host1x
+    then:
+      properties:
+        sor:
+          description: The Serial Output Resource (SOR) can be used to drive
+            HDMI, LVDS, eDP and DP outputs.
+
+            See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
+            regarding the DPAUX pad controller bindings.
+          type: object
+          properties:
+            # required
+            compatible:
+              oneOf:
+                - const: nvidia,tegra124-sor
+                - allOf:
+                    - const: nvidia,tegra132-sor
+                    - const: nvidia,tegra124-sor
+                - const: nvidia,tegra210-sor
+                - const: nvidia,tegra210-sor1
+                - const: nvidia,tegra186-sor
+                - const: nvidia,tegra186-sor1
+                - const: nvidia,tegra194-sor
+            reg: true
+            interrupts: true
+            clocks: true
+            clock-names:
+              items:
+                - description: clock input for the SOR hardware
+                  const: sor
+                - description: SOR output clock
+                  const: out
+                - description: input for the pixel clock
+                  const: parent
+                - description: reference clock for the SOR clock
+                  const: dp
+                - description: safe reference clock for the SOR clock during
+                    power up
+                  const: safe
+                  # deprecated
+                - description: source clock for the SOR clock (obsolete, use
+                    "out" instead)
+                  const: source
+                  # Tegra186 and later
+                - description: SOR pad output clock
+                  const: pad
+            resets: true
+            reset-names:
+              items:
+                - description: module reset
+                  const: sor
+
+            # Tegra186 and later
+            nvidia,interface:
+              $ref: /schemas/types.yaml#/definitions/uint32
+              description: index of the SOR interface
+
+            # optional
+            nvidia,ddc-i2c-bus:
+              $ref: /schemas/types.yaml#/definitions/phandle
+              description: phandle of an I2C controller used for DDC EDID
+                probing
+
+            nvidia,hpd-gpio:
+              $ref: /schemas/types.yaml#/definitions/phandle-array
+              description: specifies a GPIO used for hotplug detection
+
+            nvidia,edid:
+              $ref: /schemas/types.yaml#/definitions/uint8-array
+              description: supplies a binary EDID blob
+
+            nvidia,panel:
+              $ref: /schemas/types.yaml#/definitions/phandle
+              description: phandle of a display panel
+
+            nvidia,xbar-cfg:
+              $ref: /schemas/types.yaml#/definitions/uint32-array
+              description: 5 cells containing the crossbar configuration.
+                Each lane of the SOR, identified by the cell's index, is
+                mapped via the crossbar to the pad specified by the cell's
+                value.
+
+            # optional when driving an eDP output
+            nvidia,dpaux:
+              $ref: /schemas/types.yaml#/definitions/phandle
+              description: phandle to a DispayPort AUX interface
+
+        dpaux:
+          description: DisplayPort AUX interface
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra124-dpaux
+                - allOf:
+                    - const: nvidia,tegra132-dpaux
+                    - const: nvidia,tegra124-dpaux
+                - const: nvidia,tegra210-dpaux
+                - const: nvidia,tegra186-dpaux
+                - const: nvidia,tegra194-dpaux
+            reg: true
+            interrupts: true
+            clocks: true
+            clock-names:
+              items:
+                - description: clock input for the DPAUX hardware
+                  const: dpaux
+                - description: reference clock
+                  const: parent
+            resets: true
+            reset-names:
+              items:
+                - const: dpaux
+            vdd-supply:
+              description: phandle of a supply that powers the DisplayPort
+                link
+            i2c-bus:
+              description: Subnode where I2C slave devices are listed. This
+                subnode must be always present. If there are no I2C slave
+                devices, an empty node should be added. See ../../i2c/i2c.yaml
+                for more information.
+
+        vic:
+          description: Video Image Compositor
+          type: object
+          properties:
+            compatible:
+              oneOf:
+                - const: nvidia,tegra124-vic
+                - allOf:
+                    - const: nvidia,tegra132-vic
+                    - const: nvidia,tegra124-vic
+                - const: nvidia,tegra210-vic
+                - const: nvidia,tegra186-vic
+                - const: nvidia,tegra194-vic
+            reg: true
+            interrupts: true
+            clocks: true
+            clock-names:
+              items:
+                - description: clock input for the VIC hardware
+                - const: vic
+            resets: true
+            reset-names:
+              items:
+                - const: vic
+            interconnects: true
+            interconnect-names:
+              items:
+                - const: read
+                - const: write
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - const: nvidia,tegra30-host1x
+              - const: nvidia,tegra114-host1x
+              - const: nvidia,tegra124-host1x
+              - const: nvidia,tegra210-host1x
+              - const: nvidia,tegra186-host1x
+    then:
+      properties:
+        dsi:
+          description: display serial interface
+          type: object
+          properties:
+            # required
+            compatible:
+              oneOf:
+                - const: nvidia,tegra30-dsi
+                - const: nvidia,tegra114-dsi
+                - const: nvidia,tegra124-dsi
+                - allOf:
+                    - const: nvidia,tegra132-dsi
+                    - const: nvidia,tegra124-dsi
+                - const: nvidia,tegra210-dsi
+                - const: nvidia,tegra186-dsi
+            reg: true
+            clocks: true
+            clock-names:
+              items:
+                - description: DSI module clock
+                  const: dsi
+                - description: low-power module clock
+                  const: lp
+                - description: input for the pixel clock
+                  const: parent
+            resets: true
+            reset-names:
+              items:
+                - description: module reset
+                - const: dsi
+            avdd-dsi-supply:
+              description: phandle of a supply that powers the DSI controller
+              $ref: /schemas/types.yaml#/definitions/phandle
+
+            nvidia,mipi-calibrate:
+              $ref: /schemas/types.yaml#/definitions/phandle-array
+              description: Should contain a phandle and a specifier specifying
+                which pads are used by this DSI output and need to be
+                calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
+
+            # optional
+            nvidia,ddc-i2c-bus:
+              $ref: /schemas/types.yaml#/definitions/phandle
+              description: phandle of an I2C controller used for DDC EDID
+                probing
+            nvidia,hpd-gpio:
+              $ref: /schemas/types.yaml#/definitions/phandle-array
+              description: specifies a GPIO used for hotplug detection
+            nvidia,edid:
+              $ref: /schemas/types.yaml#/definitions/uint8-array
+              description: supplies a binary EDID blob
+            nvidia,panel:
+              $ref: /schemas/types.yaml#/definitions/phandle
+              description: phandle of a display panel
+            nvidia,ganged-mode:
+              $ref: /schemas/types.yaml#/definitions/phandle
+              description: contains a phandle to a second DSI controller to
+                gang up with in order to support up to 8 data lanes
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+
+    host1x {
+        compatible = "nvidia,tegra20-host1x", "simple-bus";
+        reg = <0x50000000 0x00024000>;
+        interrupts = <0 65 0x04   /* mpcore syncpt */
+                      0 67 0x04>; /* mpcore general */
+        clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
+        resets = <&tegra_car 28>;
+        reset-names = "host1x";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ranges = <0x54000000 0x54000000 0x04000000>;
+
+        mpe {
+                compatible = "nvidia,tegra20-mpe";
+                reg = <0x54040000 0x00040000>;
+                interrupts = <0 68 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_MPE>;
+                resets = <&tegra_car 60>;
+                reset-names = "mpe";
+        };
+
+        vi {
+                compatible = "nvidia,tegra20-vi";
+                reg = <0x54080000 0x00040000>;
+                interrupts = <0 69 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_VI>;
+                resets = <&tegra_car 100>;
+                reset-names = "vi";
+        };
+
+        epp {
+                compatible = "nvidia,tegra20-epp";
+                reg = <0x540c0000 0x00040000>;
+                interrupts = <0 70 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_EPP>;
+                resets = <&tegra_car 19>;
+                reset-names = "epp";
+        };
+
+        isp {
+                compatible = "nvidia,tegra20-isp";
+                reg = <0x54100000 0x00040000>;
+                interrupts = <0 71 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_ISP>;
+                resets = <&tegra_car 23>;
+                reset-names = "isp";
+        };
+
+        gr2d {
+                compatible = "nvidia,tegra20-gr2d";
+                reg = <0x54140000 0x00040000>;
+                interrupts = <0 72 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_GR2D>;
+                resets = <&tegra_car 21>;
+                reset-names = "2d";
+        };
+
+        gr3d {
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
+                clocks = <&tegra_car TEGRA20_CLK_DISP1>,
+                         <&tegra_car TEGRA20_CLK_PLL_P>;
+                clock-names = "dc", "parent";
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
+                clocks = <&tegra_car TEGRA20_CLK_DISP2>,
+                         <&tegra_car TEGRA20_CLK_PLL_P>;
+                clock-names = "dc", "parent";
+                resets = <&tegra_car 26>;
+                reset-names = "dc";
+
+                rgb {
+                        status = "disabled";
+                };
+        };
+
+        hdmi {
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
+        tvo {
+                compatible = "nvidia,tegra20-tvo";
+                reg = <0x542c0000 0x00040000>;
+                interrupts = <0 76 0x04>;
+                clocks = <&tegra_car TEGRA20_CLK_TVO>;
+                status = "disabled";
+        };
+
+        dsi {
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
-- 
2.24.1
