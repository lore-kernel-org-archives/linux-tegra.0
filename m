From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 09/12] dt-bindings: Add bindings for Tegra DPAUX pinctrl driver
Date: Thu, 23 Jun 2016 16:59:02 +0100
Message-ID: <1466697545-11868-10-git-send-email-jonathanh@nvidia.com>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466697545-11868-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tegra124, Tegra132 and Tegra210 devices the pads used by the Display
Port Auxiliary (DPAUX) channel are multiplexed such that they can also
be used by one of the internal I2C controllers. Note that this is
different from I2C-over-AUX supported by the DPAUX controller. The
register that configures these pads is part of the DPAUX controllers
register set and so a pinctrl driver is being added for the DPAUX device
to share these pads. Add the device-tree binding documentation for the
DPAUX pad controller.

Although there is only one group of pads associated with the DPAUX that
can be multiplexed, the group still needs to be described by the binding.
If the 'groups' property is not present in the binding, then the pads
will not be allocated by the pinctrl core for a client and this would
allow another client to re-configure the same pads that may already be
in-use.

Please note that although the "off" function for the DPAUX pads is not
technically a pin-mux setting but more of a pin-conf setting it is
simpler to expose these as a function so that the user can simply select
either "aux", "i2c" or "off" as the current function/mode.

Update the main DPAUX binding documentation to reference the DPAUX pad
controller binding document and add the 'i2c-bus' subnode. The 'i2c-bus'
subnode is used for populating I2C slaves for the DPAUX device so that
the I2C driver core does not attempt to add the DPAUX pad controller
nodes as I2C slaves.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        |  6 +++
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       | 60 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 275f45680892..d0f1dc62550a 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -241,6 +241,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - dpaux
   - vdd-supply: phandle of a supply that powers the DisplayPort link
+  - i2c-bus: Subnode where I2C slave devices are listed. This subnode
+    must be always present. If there are no I2C slave devices, an empty
+    node should be added. See ../../i2c/i2c.txt for more information.
+
+  See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
+  regarding the DPAUX pad controller bindings.
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
new file mode 100644
index 000000000000..656e0a04be8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
@@ -0,0 +1,60 @@
+Device tree binding for NVIDIA Tegra DPAUX pad controller
+========================================================
+
+The Tegra Display Port Auxiliary (DPAUX) pad controller manages two pins
+which can be assigned to either the DPAUX channel or to an I2C
+controller.
+
+This document defines the device-specific binding for the DPAUX pad
+controller. Refer to pinctrl-bindings.txt in this directory for generic
+information about pin controller device tree bindings. Please refer to
+the binding document ../display/tegra/nvidia,tegra20-host1x.txt for more
+details on the DPAUX binding.
+
+Pin muxing:
+-----------
+
+Child nodes contain the pinmux configurations following the conventions
+from the pinctrl-bindings.txt document.
+
+Since only three configurations are possible, only three child nodes are
+needed to describe the pin mux'ing options for the DPAUX pads.
+Furthermore, given that the pad functions are only applicable to a
+single set of pads, the child nodes only need to describe the pad group
+the functions are being applied to rather than the individual pads.
+
+Required properties:
+- groups: Must be "dpaux-io"
+- function: Must be either "aux", "i2c" or "off".
+
+Example:
+--------
+
+	dpaux@545c0000 {
+		...
+
+		state_dpaux_aux: pinmux_aux {
+			groups = "dpaux-io";
+			function = "aux";
+		};
+
+		state_dpaux_i2c: pinmux_i2c {
+			groups = "dpaux-io";
+			function = "i2c";
+		};
+
+		state_dpaux_off: pinmux_off {
+			groups = "dpaux-io";
+			function = "off";
+		};
+	};
+
+	...
+
+	i2c@7000d100 {
+		...
+		pinctrl-0 = <&state_dpaux_i2c>;
+		pinctrl-1 = <&state_dpaux_off>;
+		pinctrl-names = "default", "idle";
+		status = "disabled";
+	};
-- 
2.1.4
