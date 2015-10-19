From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [RFC PATCH] dt: Tegra XUSB padctl: per-lane PHYs and USB lane map
Date: Mon, 19 Oct 2015 17:30:42 -0600
Message-ID: <1445297442-21439-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Convert the binding to provide a PHY per lane, rather than a PHY per
"pad" block in the hardware. This will allow the driver to easily know
which lanes are used by clients, and thus only enable those lanes, and
generally better aligns with the fact the hardware has configuration per
lane rather than solely configuration per "pad" block.

Add entries to pinctrl-tegra-xusb.h to enumerate all "pad" blocks on
Tegra210, which will allow an XUSB DT node to reference the PHYs it needs.

Add an nvidia,ss-port-map register to allow configuration of the
XUSB_PADCTL_SS_PORT_MAP register.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Thierry, Jon, here's a start at where I think the XUSB padctl binding
should go. What are your thoughts on this approach?

Kishon, this implements a "PHY-per-lane" approach for Tegra's XUSB padctl
module. Does the result look good to you? You may need to apply the patch
for the binding doc to make sense since I guess you aren't familiar with
the binding or HW.

 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        | 122 +++++++++++++++------
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h   |  24 +++-
 2 files changed, 108 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
index 3952d893635c..9b39f3283636 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
@@ -1,16 +1,31 @@
 Device tree binding for NVIDIA Tegra XUSB pad controller
 ========================================================
 
-The Tegra XUSB pad controller manages a set of lanes, each of which can be
-assigned to one out of a set of different pads. Some of these pads have an
-associated PHY that must be powered up before the pad can be used.
-
-This document defines the device-specific binding for the XUSB pad controller.
+The Tegra XUSB pad controller manages a set of "pads". Each pad drives output
+to (or receives input from) one or more SoC IO signals, or (pad) lanes. Note
+that in many contexts, a "pad" is an individual pin/signal/ball on a chip
+package. In the context of this documentation, a "pad" refers to a sub-block
+of the XUSB padctl HW module, which in turn is attached to potentially more
+than one pin/signal/ball on the chip. This unusual use of terminology is
+consistent with Tegra hardware documentation.
+
+These pads must typically be powered up and configured before they can be
+used. Individual lanes may also need various configuration applied to be
+useful. This binding allows specification of the set of pads and lanes to be
+used in a particular system, and their associated configuration.
+
+Various IO controllers are attached to the pad controller internally to Tegra.
+Examples are USB2, XUSB, SATA, and PCIe. The XUSB padctl contains muxes that
+route the IO controllers' lanes to the lanes of the pads. This binding allows
+specification of the intended configuration of these muxes.
 
 Refer to pinctrl-bindings.txt in this directory for generic information about
 pin controller device tree bindings and ../phy/phy-bindings.txt for details on
 how to describe and reference PHYs in device trees.
 
+Each PHY provided by this binding refers to a single (differential, and
+typicallly bi-directional) lane of a pad.
+
 Required properties:
 --------------------
 - compatible: Valid options are:
@@ -24,8 +39,19 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - padctl
-- #phy-cells: Should be 1. The specifier is the index of the PHY to reference.
-  See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the list of valid values.
+- #phy-cells: Should be 2. The first cell indicates the pad that implements
+  the lane. See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the list of
+  valid values. The second cell indicates the lane within the pad.
+
+Optional properties:
+--------------------
+- nvidia,ss-port-map: This value to program into the XUSB_PADCTL_SS_PORT_MAP
+  register. If this value is missing, no programming of the register should
+  occur.
+
+FIXME: Probably need other global properties to initialize registers such as
+XUSB_PADCTL_SNPS_OC_MAP_0, XUSB_PADCTL_USB2_OC_MAP_0,
+XUSB_PADCTL_VBUS_OC_MAP_0...
 
 Lane muxing:
 ------------
@@ -34,28 +60,34 @@ Child nodes contain the pinmux configurations following the conventions from
 the pinctrl-bindings.txt document. Typically a single, static configuration is
 given and applied at boot time.
 
-Each subnode describes groups of lanes along with parameters and pads that
-they should be assigned to. The name of these subnodes is not important. All
-subnodes should be parsed solely based on their content.
+Each subnode describes arbitary sets of (pad) lanes along with muxing and
+configuration parameters that should be applied to them. The name of these
+subnodes is not important. All subnodes should be parsed solely based on their
+content.
 
 Each subnode only applies the parameters that are explicitly listed. In other
-words, if a subnode that lists a function but no pin configuration parameters
+words, a subnode that lists a function but no pin configuration parameters
 implies no information about any pin configuration parameters. Similarly, a
-subnode that describes only an IDDQ parameter implies no information about
-what function the pins are assigned to. For this reason even seemingly boolean
-values are actually tristates in this binding: unspecified, off or on.
+subnode that describes only an configuration parameter implies no information
+about what function the pins are assigned to. For this reason even seemingly
+boolean values are actually tristates in this binding: unspecified, off or on.
 Unspecified is represented as an absent property, and off/on are represented
 as integer values 0 and 1.
 
 Required properties:
-- nvidia,lanes: An array of strings. Each string is the name of a lane (pad).
+- nvidia,lanes: An array of strings. Each string is the name of a (pad) lane.
   Valid values for lanes are listed below.
 
 Optional properties:
 - nvidia,function: A string that is the name of the function (IO controller)
   that the pin or group should be assigned to. Valid values for function names
   are  listed below.
-- nvidia,iddq: Enables IDDQ mode of the lane. (0: no, 1: yes)
+- FIXME: Need to add e.g. nvidia,hsic-strobe-trim,
+  nvidia,otg-hs-curr-level-offset, ...
+
+Deprecated properties:
+- nvidia,iddq: (single-cell) Integer. Programming this value statically
+  violates prescribed HW programming rules, hence this property is deprecated.
 
 Note that not all of these properties are valid for all lanes. Lanes can be
 divided into three groups:
@@ -66,7 +98,8 @@ divided into three groups:
 
     Valid functions for this group are: "snps", "xusb", "uart", "rsvd".
 
-    The nvidia,iddq property does not apply to this group.
+    FIXME: I'm not sure if usb2-bias needs to be exposed as a PHY, or if XUSB
+    padctl can simply configure/enable it itself?
 
   - ulpi-0, hsic-0, hsic-1:
 
@@ -74,8 +107,6 @@ divided into three groups:
 
     Valid functions for this group are: "snps", "xusb".
 
-    The nvidia,iddq property does not apply to this group.
-
   - pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, pcie-5, pcie-6, sata-0:
 
     (pcie-5, pcie-6 are valid on Tegra210 only.)
@@ -86,7 +117,6 @@ divided into three groups:
     On Tegra210, valid functions for this group are "pcie-x1", "usb3",
     "sata", "pcie-x4".
 
-
 Example:
 ========
 
@@ -99,45 +129,65 @@ SoC file extract:
 		resets = <&tegra_car 142>;
 		reset-names = "padctl";
 
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 	};
 
 Board file extract:
 -------------------
 
 	pcie-controller@0,01003000 {
-		...
-
-		phys = <&padctl 0>;
-		phy-names = "pcie";
+		status = "okay";
+
+		pci@1,0 {
+			status = "okay";
+			nvidia,num-lanes = <4>;
+			phys = <&padctl TEGRA_XUSB_PADCTL_PCIE 1>,
+			       <&padctl TEGRA_XUSB_PADCTL_PCIE 2>,
+			       <&padctl TEGRA_XUSB_PADCTL_PCIE 3>,
+			       <&padctl TEGRA_XUSB_PADCTL_PCIE 4>;
+			/* These are the lane IDs within this PCIe port */
+			phy-names = "0", "1", "2", "3";
+		};
 
-		...
+		pci@2,0 {
+			status = "okay";
+			nvidia,num-lanes = <1>;
+			phys = <&padctl TEGRA_XUSB_PADCTL_PCIE 0>;
+			phy-names = "0";
+		};
 	};
 
-	...
+	padctl@0,7009f000 {
+		status = "okay";
 
-	padctl: padctl@0,7009f000 {
 		pinctrl-0 = <&padctl_default>;
 		pinctrl-names = "default";
 
 		padctl_default: pinmux {
+			xusb {
+				nvidia,lanes = "otg-1", "otg-2";
+				nvidia,function = "xusb";
+			};
+
 			usb3 {
-				nvidia,lanes = "pcie-0", "pcie-1";
+				nvidia,lanes = "pcie-5", "pcie-6";
 				nvidia,function = "usb3";
-				nvidia,iddq = <0>;
 			};
 
-			pcie {
-				nvidia,lanes = "pcie-2", "pcie-3",
-					       "pcie-4";
-				nvidia,function = "pcie";
-				nvidia,iddq = <0>;
+			pcie-x1 {
+				nvidia,lanes = "pcie-0";
+				nvidia,function = "pcie-x1";
+			};
+
+			pcie-x4 {
+				nvidia,lanes = "pcie-1", "pcie-2",
+					       "pcie-3", "pcie-4";
+				nvidia,function = "pcie-x4";
 			};
 
 			sata {
 				nvidia,lanes = "sata-0";
 				nvidia,function = "sata";
-				nvidia,iddq = <0>;
 			};
 		};
 	};
diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
index 914d56da9324..edc961202d1c 100644
--- a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
+++ b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
@@ -1,7 +1,27 @@
 #ifndef _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H
 #define _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H 1
 
-#define TEGRA_XUSB_PADCTL_PCIE 0
-#define TEGRA_XUSB_PADCTL_SATA 1
+/*
+ * These legacy specifiers represent a client that uses an unspecified subset
+ * of the lanes within a particular "pad". Drivers that handle these
+ * specifiers should enable all lanes of the pad.
+ */
+#define TEGRA_XUSB_PADCTL_PCIE_LEGACY	0
+#define TEGRA_XUSB_PADCTL_SATA_LEGACY	1
+
+/*
+ * These represent the set of "pads" that exist within XUSB padctl hardware.
+ * Different pads contain a different number of lanes. See the TRM for
+ * details. The second cell of any specifier that uses these values will
+ * represent the specific lane that the client uses.
+ */
+#define TEGRA_XUSB_PADCTL_PCIE		2
+#define TEGRA_XUSB_PADCTL_SATA		3
+#define TEGRA_XUSB_PADCTL_HSIC		4
+#define TEGRA_XUSB_PADCTL_USB2_BIAS	5
+#define TEGRA_XUSB_PADCTL_USB2_0	6
+#define TEGRA_XUSB_PADCTL_USB2_1	7
+#define TEGRA_XUSB_PADCTL_USB2_2	8
+#define TEGRA_XUSB_PADCTL_USB2_3	9
 
 #endif /* _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H */
-- 
1.9.1
