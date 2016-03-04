From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad controller binding
Date: Fri,  4 Mar 2016 17:19:31 +0100
Message-ID: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
set of lanes that are used for PCIe, SATA and USB.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v10:
- clarify that the hardware documentation means something different when
  referring to a "port" (intra-SoC connectivity)

Changes in v9:
- rename UTMI -> USB2 to match hardware documentation
- reword according to suggestions by Stephen Warren
- make Tegra132 compatible string list consistent
- remove mailbox support

 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   | 376 +++++++++++++++++++++
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |   5 +
 2 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
new file mode 100644
index 000000000000..8b642d9e3433
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -0,0 +1,376 @@
+Device tree binding for NVIDIA Tegra XUSB pad controller
+========================================================
+
+The Tegra XUSB pad controller manages a set of I/O lanes (with differential
+signals) which connect directly to pins/pads on the SoC package. Each lane
+is controlled by a HW block referred to as a "pad" in the Tegra hardware
+documentation. Each such "pad" may control either one or multiple lanes,
+and thus contains any logic common to all its lanes. Each lane can be
+separately configured and powered up.
+
+Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
+super-speed USB. Other lanes are for various types of low-speed, full-speed
+or high-speed USB (such as UTMI, ULPI and HSIC). The XUSB pad controller
+contains a software-configurable mux that sits between the I/O controller
+ports (e.g. PCIe) and the lanes.
+
+In addition to per-lane configuration, USB 3.0 ports may require additional
+settings on a per-board basis.
+
+Pads will be represented as children of the top-level XUSB pad controller
+device tree node. Each lane exposed by the pad will be represented by its
+own subnode and can be referenced by users of the lane using the standard
+PHY bindings, as described by the phy-bindings.txt file in this directory.
+
+The Tegra hardware documentation refers to the connection between the XUSB
+pad controller and the XUSB controller as "ports". This is confusing since
+"port" is typically used to denote the physical USB receptacle. The device
+tree binding in this document uses the term "port" to refer to the logical
+abstraction of the signals that are routed to a USB receptacle (i.e. a PHY
+for the USB signal, the VBUS power supply, the USB 2.0 companion port for
+USB 3.0 receptacles, ...).
+
+Required properties:
+--------------------
+- compatible: Must be:
+  - Tegra124: "nvidia,tegra124-xusb-padctl"
+  - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padctl"
+- reg: Physical base address and length of the controller's registers.
+- resets: Must contain an entry for each entry in reset-names.
+- reset-names: Must include the following entries:
+  - "padctl"
+
+
+Pad nodes:
+==========
+
+A required child node named "pads" contains a list of subnodes, one for each
+of the pads exposed by the XUSB pad controller. Each pad may need additional
+resources that can be referenced in its pad node.
+
+The "status" property is used to enable or disable the use of a pad. If set
+to "disabled", the pad will not be used on the given board. In order to use
+the pad and any of its lanes, this property must be set to "okay".
+
+For Tegra124 and Tegra132, the following pads exist: usb2, ulpi, hsic, pcie
+and sata. No extra resources are required for operation of these pads.
+
+
+PHY nodes:
+==========
+
+Each pad node has one or more children, each representing one of the lanes
+controlled by the pad.
+
+Required properties:
+--------------------
+- status: Defines the operation status of the PHY. Valid values are:
+  - "disabled": the PHY is disabled
+  - "okay": the PHY is enabled
+- #phy-cells: Should be 0. Since each lane represents a single PHY, there is
+  no need for an additional specifier.
+- nvidia,function: The output function of the PHY. See below for a list of
+  valid functions per SoC generation.
+
+For Tegra124 and Tegra132, the list of valid PHY nodes is given below:
+- usb2: usb2-0, usb2-1, usb2-2
+  - functions: "snps", "xusb", "uart"
+- ulpi: ulpi-0
+  - functions: "snps", "xusb"
+- hsic: hsic-0, hsic-1
+  - functions: "snps", "xusb"
+- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4
+  - functions: "pcie", "usb3-ss"
+- sata: sata-0
+  - functions: "usb3-ss", "sata"
+
+
+Port nodes:
+===========
+
+A required child node named "ports" contains a list of all the ports exposed
+by the XUSB pad controller. Per-port configuration is only required for USB.
+
+USB2 ports:
+-----------
+
+Required properties:
+- status: Defines the operation status of the port. Valid values are:
+  - "disabled": the port is disabled
+  - "okay": the port is enabled
+- mode: A string that determines the mode in which to run the port. Valid
+  values are:
+  - "host": for USB host mode
+  - "device": for USB device mode
+  - "otg": for USB OTG mode
+
+Optional properties:
+- nvidia,internal: A boolean property whose presence determines that a port
+  is internal. In the absence of this property the port is considered to be
+  external.
+- vbus-supply: phandle to a regulator supplying the VBUS voltage.
+
+ULPI ports:
+-----------
+
+Optional properties:
+- status: Defines the operation status of the port. Valid values are:
+  - "disabled": the port is disabled
+  - "okay": the port is enabled
+- nvidia,internal: A boolean property whose presence determines that a port
+  is internal. In the absence of this property the port is considered to be
+  external.
+- vbus-supply: phandle to a regulator supplying the VBUS voltage.
+
+HSIC ports:
+-----------
+
+Required properties:
+- status: Defines the operation status of the port. Valid values are:
+  - "disabled": the port is disabled
+  - "okay": the port is enabled
+
+Optional properties:
+- vbus-supply: phandle to a regulator supplying the VBUS voltage.
+
+Super-speed USB ports:
+----------------------
+
+Required properties:
+- status: Defines the operation status of the port. Valid values are:
+  - "disabled": the port is disabled
+  - "okay": the port is enabled
+- nvidia,usb2-companion: A single cell that specifies the physical port number
+  to map this super-speed USB port to. The range of valid port numbers varies
+  with the SoC generation:
+  - 0-2: for Tegra124 and Tegra132
+
+Optional properties:
+- nvidia,internal: A boolean property whose presence determines that a port
+  is internal. In the absence of this property the port is considered to be
+  external.
+
+For Tegra124 and Tegra132, the XUSB pad controller exposes the following
+ports:
+- 3x USB2: usb2-0, usb2-1, usb2-2
+- 1x ULPI: ulpi-0
+- 2x HSIC: hsic-0, hsic-1
+- 2x super-speed USB: usb3-0, usb3-1
+
+
+Examples:
+=========
+
+Tegra124 and Tegra132:
+----------------------
+
+SoC include:
+
+	padctl@0,7009f000 {
+		/* for Tegra124 */
+		compatible = "nvidia,tegra124-xusb-padctl";
+		/* for Tegra132 */
+		compatible = "nvidia,tegra132-xusb-padctl",
+			     "nvidia,tegra124-xusb-padctl";
+		reg = <0x0 0x7009f000 0x0 0x1000>;
+		resets = <&tegra_car 142>;
+		reset-names = "padctl";
+
+		pads {
+			usb2 {
+				status = "disabled";
+
+				usb2-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				usb2-1 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				usb2-2 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+
+			ulpi {
+				status = "disabled";
+
+				ulpi-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+
+			hsic {
+				status = "disabled";
+
+				hsic-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				hsic-1 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+
+			pcie {
+				status = "disabled";
+
+				pcie-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-1 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-2 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-3 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-4 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+
+			sata {
+				status = "disabled";
+
+				sata-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+		};
+
+		ports {
+			usb2-0 {
+				status = "disabled";
+			};
+
+			usb2-1 {
+				status = "disabled";
+			};
+
+			usb2-2 {
+				status = "disabled";
+			};
+
+			ulpi-0 {
+				status = "disabled";
+			};
+
+			hsic-0 {
+				status = "disabled";
+			};
+
+			hsic-1 {
+				status = "disabled";
+			};
+
+			usb3-0 {
+				status = "disabled";
+			};
+
+			usb3-1 {
+				status = "disabled";
+			};
+		};
+	};
+
+Board file:
+
+	padctl@0,7009f000 {
+		status = "okay";
+
+		pads {
+			usb2 {
+				status = "okay";
+
+				usb2-0 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+
+				usb2-1 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+
+				usb2-2 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+			};
+
+			pcie {
+				status = "okay";
+
+				pcie-0 {
+					nvidia,function = "usb3-ss";
+					status = "okay";
+				};
+
+				pcie-2 {
+					nvidia,function = "pcie";
+					status = "okay";
+				};
+
+				pcie-4 {
+					nvidia,function = "pcie";
+					status = "okay";
+				};
+			};
+
+			sata {
+				status = "okay";
+
+				sata-0 {
+					nvidia,function = "sata";
+					status = "okay";
+				};
+			};
+		};
+
+		ports {
+			/* Micro A/B */
+			usb2-0 {
+				status = "okay";
+				mode = "otg";
+			};
+
+			/* Mini PCIe */
+			usb2-1 {
+				status = "okay";
+				mode = "host";
+			};
+
+			/* USB3 */
+			usb2-2 {
+				status = "okay";
+				mode = "host";
+
+				vbus-supply = <&vdd_usb3_vbus>;
+			};
+
+			usb3-0 {
+				nvidia,port = <2>;
+				status = "okay";
+			};
+		};
+	};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
index 30676ded85bb..77dfba05ccfd 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
@@ -1,6 +1,11 @@
 Device tree binding for NVIDIA Tegra XUSB pad controller
 ========================================================
 
+NOTE: It turns out that this binding isn't an accurate description of the XUSB
+pad controller. While the description is good enough for the functional subset
+required for PCIe and SATA, it lacks the flexibility to represent the features
+needed for USB. For the new binding, see ../phy/nvidia,tegra-xusb-padctl.txt.
+
 The Tegra XUSB pad controller manages a set of lanes, each of which can be
 assigned to one out of a set of different pads. Some of these pads have an
 associated PHY that must be powered up before the pad can be used.
-- 
2.7.1
