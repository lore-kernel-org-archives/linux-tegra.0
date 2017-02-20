From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/2] dt-bindings: Add Tegra186 BPMP I2C binding
Date: Mon, 20 Feb 2017 17:52:33 +0100
Message-ID: <20170220165234.29299-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In Tegra186, the BPMP (Boot and Power Management Processor) owns certain
HW devices, such as the I2C controller for the power management I2C bus.
Software running on other CPUs must perform IPC to the BPMP in order to
execute transactions on that I2C bus. This binding describes an I2C bus
that is accessed in such a fashion.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- add missing Acked-by from Rob, taken from patchwork:

    http://patchwork.ozlabs.org/patch/650385/

 .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
new file mode 100644
index 000000000000..ab240e10debc
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
@@ -0,0 +1,42 @@
+NVIDIA Tegra186 BPMP I2C controller
+
+In Tegra186, the BPMP (Boot and Power Management Processor) owns certain HW
+devices, such as the I2C controller for the power management I2C bus. Software
+running on other CPUs must perform IPC to the BPMP in order to execute
+transactions on that I2C bus. This binding describes an I2C bus that is
+accessed in such a fashion.
+
+The BPMP I2C node must be located directly inside the main BPMP node. See
+../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
+
+This node represents an I2C controller. See ../i2c/i2c.txt for details of the
+core I2C binding.
+
+Required properties:
+- compatible:
+    Array of strings.
+    One of:
+    - "nvidia,tegra186-bpmp-i2c".
+- #address-cells: Address cells for I2C device address.
+    Single-cell integer.
+    Must be <1>.
+- #size-cells:
+    Single-cell integer.
+    Must be <0>.
+- nvidia,bpmp-bus-id:
+    Single-cell integer.
+    Indicates the I2C bus number this DT node represent, as defined by the
+    BPMP firmware.
+
+Example:
+
+bpmp {
+	...
+
+	i2c {
+		compatible = "nvidia,tegra186-bpmp-i2c";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		nvidia,bpmp-bus-id = <5>;
+	};
+};
-- 
2.11.1
