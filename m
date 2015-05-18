From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC] tegra: dpaux: pinctrl proposal
Date: Mon, 18 May 2015 16:33:49 +0100
Message-ID: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Background:
==========
On tegra124 and tegra132 devices the pads used by the Display Port Auxiliary
(DPAUX) channel are multiplexed such that they can also be used by one of the
internal i2c controllers. Note that this is different from i2c-over-AUX
supported by the DPAUX controller. The register that configures these pads is
part of the DPAUX controllers register set and so requires the clock for the
DPAUX controller to be enabled to access the register as well as keeping the
SOR (serial output resource) power domain enabled.

Currently, there is no pinctrl device for these pads and so cannot be easily
mapped to function as an i2c interface. Furthermore, when using the pads for
the DPAUX channel, the DPAUX driver (drivers/gpu/drm/tegra/dpaux.c) directly
writes the to appropriate register to setup the pads.

There are some products based upon the tegra132 that use these pads for an
internal i2c controller and hence we want to support this configuration in the
kernel.

Proposal:
========
Add a DPAUX MFD device that consists of a DPAUX controller, for the Display
Port Auxiliary related functionality and a DPAUX pad controller, for handling
the pinctrl for the DPAUX pads. Both the DPAUX controller and DPAUX pad
controller need to access the DPAUX register set and therefore, by making the
MFD compatible with "simple-mfd" and "syscon", a regmap for the DPAUX registers
will be created to synchronise register accesses made by the drivers.

The DPAUX driver (drivers/gpu/drm/tegra/dpaux.c) will be converted to use the
DPAUX pad controller driver to ensure that multiple devices cannot configure
the pads without first allocating the pads.

The following shows a strawman proposal for the device-tree bindings to add
further context to how this would work and get some feedback on this proposal
(from the tegra maintainers). If this proposal is reasonable then I plan to
generate an initial patch of a working implementation for review (looping in
the relevant maintainers).
---
 .../bindings/gpu/nvidia,tegra20-host1x.txt         |  85 +++++++++++++-
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       | 130 +++++++++++++++++++++
 2 files changed, 209 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
index 009f4bfa1590..9ce5586719ff 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
@@ -5,9 +5,11 @@ Required properties:
 - reg: Physical base address and length of the controller's registers.
 - interrupts: The interrupt outputs from the controller.
 - #address-cells: The number of cells used to represent physical base addresses
-  in the host1x address space. Should be 1.
+  in the host1x address space. Should be 1 for tegra20, tegra30 and tegra114
+  and should be 2 for tegra124.
 - #size-cells: The number of cells used to represent the size of an address
-  range in the host1x address space. Should be 1.
+  range in the host1x address space. Should be 1 for tegra20, tegra30 and
+  tegra114 and should be 2 for tegra124.
 - ranges: The mapping of the host1x address space to the CPU address space.
 - clocks: Must contain one entry, for the module clock.
   See ../clocks/clock-bindings.txt for details.
@@ -224,10 +226,25 @@ of the following host1x client modules:
   - nvidia,dpaux: phandle to a DispayPort AUX interface
 
 - dpaux: DisplayPort AUX interface
-  - compatible: For Tegra124, must contain "nvidia,tegra124-dpaux".  Otherwise,
-    must contain '"nvidia,<chip>-dpaux", "nvidia,tegra124-dpaux"', where
-    <chip> is tegra132.
+  - compatible: For Tegra124, must contain '"nvidia,tegra124-dpaux-mfd",
+    "simple-mfd", "syscon"'. Otherwise, must contain '"nvidia,<chip>-dpaux-mfd",
+    "nvidia,tegra124-dpaux-mfd", "simple-mfd", "syscon"', where <chip> is
+    tegra132.
   - reg: Physical base address and length of the controller's registers.
+  - #address-cells: The number of cells used to represent physical base
+    addresses in the host1x address space. Should match host1x node.
+  - #size-cells: The number of cells used to represent the size of an address
+    range in the host1x address space. Should match host1x node.
+  - ranges: Describes mapping of DPAUX registers to parent (host1x) address
+    space. Should be empty to signify a direct mapping.
+
+  The following nodes, "dpaux_controller" and "dpaux_padctl", are children of
+  the "dpaux" node.
+
+- dpaux_controller: DisplayPort AUX controller
+  - compatible: For Tegra124, must contain "nvidia,tegra124-dpaux-controller".
+    Otherwise, must contain '"nvidia,<chip>-dpaux-controller",
+    "nvidia,tegra124-dpaux-controller"', where <chip> is tegra132.
   - interrupts: The interrupt outputs from the controller.
   - clocks: Must contain an entry for each entry in clock-names.
     See ../clocks/clock-bindings.txt for details.
@@ -239,8 +256,15 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - dpaux
   - vdd-supply: phandle of a supply that powers the DisplayPort link
+  - pinctrl-0: phandle of pin-control configuration for the DisplayPort pads.
+    See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for details.
+  - pinctrl-names: Should be "default".
 
-Example:
+- dpaux_padctl: DisplayPort AUX Pad Controller
+  - See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for details.
+
+
+Example (tegra20):
 
 / {
 	...
@@ -376,3 +400,52 @@ Example:
 
 	...
 };
+
+
+Example (tegra124 DPAUX):
+
+/ {
+	...
+
+	host1x {
+		compatible = "nvidia,tegra124-host1x", "simple-bus";
+		...
+
+		dpaux: dpaux@0,545c0000 {
+			compatible = "nvidia,tegra124-dpaux-mfd", "simple-mfd", "syscon";
+			reg = <0x0 0x545c0000 0x0 0x40000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dpaux_controller: dpaux_controller@0,545c0000 {
+				compatible = "nvidia,tegra124-dpaux-controller";
+				interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&tegra_car TEGRA124_CLK_DPAUX>,
+					 <&tegra_car TEGRA124_CLK_PLL_DP>;
+				clock-names = "dpaux", "parent";
+				resets = <&tegra_car 181>;
+				reset-names = "dpaux";
+				pinctrl-0 = <&dpaux_state>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
+
+			dpaux_padctl@0,545c0124 {
+				compatible = "nvidia,tegra124-dpaux-padctl";
+
+				dpaux_state: dpaux_state0 {
+					dpaux {
+						nvidia,function = "dpaux";
+					};
+				};
+
+				i2c_state: i2c_state0 {
+					i2c {
+						nvidia,function = "i2c";
+					};
+				};
+			};
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
new file mode 100644
index 000000000000..9e7226086dd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
@@ -0,0 +1,130 @@
+Device tree binding for NVIDIA Tegra DPAUX pad controller
+========================================================
+
+The Tegra Display Port Auxiliary (DPAUX) pad controller manages two pins
+which can be assigned to either the DPAUX channel or to an I2C controller.
+For Tegra124 the I2C controller that can be mapped to these pins is
+i2c@0,7000d1000.
+
+This document defines the device-specific binding for the DPAUX pad controller.
+Refer to pinctrl-bindings.txt in thiis directory for generic information about
+pin controller device tree bindings.
+
+Required properties:
+--------------------
+- compatible:	 For Tegra124, must contain "nvidia,tegra124-dpaux-padctl".
+		 Otherwise, must contain '"nvidia,<chip>-dpaux-padctl",
+		 "nvidia-tegra124-dpaux-padctl"', where <chip> is tegra132 or
+		 tegra210.
+- power-domains: The power controller phandle and power-domain specifier that
+		 specifies power-domain dependency for the DPAUX pad controller.
+		 For Tegra124, the power-domain specifier must be
+		 "TEGRA_POWERGATE_SOR". See ../power/power_domain.txt for
+		 details.
+
+Pin muxing:
+------------
+
+Child nodes contain the pinmux configurations following the conventions from
+the pinctrl-bindings.txt document.
+
+Since only two configurations are possible, only two child nodes are needed to
+describe the pin mux'ing options for the DPAUX pads. Furthermore, given that
+the pad functions are only applicable to a single set of pads, the child nodes
+do not need to describe the pads the functions are being applied to.
+
+When the pads are used for a DPAUX channel, there are additional pin
+configuration settings that can be applied. These options are described in
+optional properties for the child nodes.
+
+Required properties:
+- nvidia,function: Must be either "dpaux" or "i2c".
+
+Optional properties:
+- nvidia,dpaux-enable-input-rcv: Boolean property, when present enables active
+				 high receiver for the DPAUX channel pad.
+- nvidia,dpaux-drvi:		 A value between 0-63 that controls the active
+				 high output driver current. (TODO: Describe
+				 output current range)
+- nvidia,dpaux-drvz:		 A value between 0-7 that controls the active
+				 high output driver impedance. The available
+				 impedance settings are:
+				 0 = 78 ohms
+				 1 = 60 ohms
+				 2 = 54 ohms
+				 3 = 50 ohms
+				 4 = 45 ohms
+				 5 = 42 ohms
+				 6 = 39 ohms
+				 7 = 34 ohms
+- nvidia,dpaux-cmh:		 A value between 0-3 that controls the output
+				 common mode voltage. The available common mode
+				 voltage settings are:
+				 0 = 0.60V
+				 1 = 0.64V
+				 2 = 0.70V
+				 3 = 0.56V
+
+
+Example:
+========
+
+SoC file extract:
+-----------------
+
+	dpaux: dpaux@0,545c0000 {
+		...
+
+		dpaux_controller: dpaux_controller@0,545c0000 {
+			...
+			pinctrl-0 = <&dpaux_state>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
+		dpaux_padctl@0,545c0124 {
+			compatible = "nvidia,tegra124-dpaux-padctl";
+			power-domains = <&pmc TEGRA_POWERGATE_SOR>
+
+			dpaux_state: dpaux_state0 {
+				dpaux {
+					nvidia,function = "dpaux";
+				};
+			};
+
+			i2c_state: i2c_state0 {
+				i2c {
+					nvidia,function = "i2c";
+				};
+			};
+		};
+	};
+
+	...
+
+	i2c@0,7000d100 {
+		...
+		pinctrl-0 = <&i2c_state>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
+
+Board file extract:
+-------------------
+
+	dpaux@0,545c0000 {
+		...
+
+		dpaux_padctl@0,545c0124 {
+
+			dpaux_state0 {
+				dpaux {
+					nvidia,dpaux-enable-input-rcv;
+					nvidia,dpaux-drvi = <0x18>;
+					nvidia,dpaux-drvz = <4>;
+					nvidia,dpaux-cmh = <2>;
+				};
+			};
+		};
+	};
-- 
1.9.1
