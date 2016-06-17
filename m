From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 09/13] dt-bindings: drm/tegra: Add DPAUX pinctrl documentation
Date: Fri, 17 Jun 2016 13:03:43 +0100
Message-ID: <1466165027-17917-10-git-send-email-jonathanh@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tegra124, Tegra132 and Tegra210 devices the pads used by the Display
Port Auxiliary (DPAUX) channel are multiplexed such that they can also
be used by one of the internal i2c controllers. Note that this is
different from i2c-over-AUX supported by the DPAUX controller. The
register that configures these pads is part of the DPAUX controllers
register set and so a pinctrl driver is being added for the DPAUX device
to share these pads. Add the device-tree binding documentation for the
DPAUX pad controller.

Please note that although the "off" function for the DPAUX pads is not
technically a pin-mux setting but more of a pin-conf setting it is
simpler to expose these as a function so that the user can simply select
either "aux", "i2c" or "off" as the current function/mode.

Update the main DPAUX binding documentation to reference the DPAUX pad
controller binding document and add the 'i2c-bus' subnode. The 'i2c-bus'
subnode is used for populating I2C slaves for the DPAUX device so that
the I2C driver core does not attempt to add the DPAUX pad controller
nodes as I2C slaves.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        |  4 ++
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       | 60 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 361a472eac4b..6759554b7b8f 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -242,6 +242,10 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - dpaux
   - vdd-supply: phandle of a supply that powers the DisplayPort link
+  - i2c-bus: Subnode where I2C slave devices should be listed.
+
+  See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
+  regarding the DPAUX pad controller bindings.
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
new file mode 100644
index 000000000000..3be0ced01680
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
+single set of pads, the child nodes do not need to describe the pads the
+functions are being applied to.
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

