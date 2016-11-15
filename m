From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: Add Tegra186 BPMP I2C binding
Date: Tue, 15 Nov 2016 17:23:49 +0100
Message-ID: <20161115162350.32405-2-thierry.reding@gmail.com>
References: <20161115162350.32405-1-thierry.reding@gmail.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20161115162350.32405-1-thierry.reding@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

In Tegra186, the BPMP (Boot and Power Management Processor) owns certain
HW devices, such as the I2C controller for the power management I2C bus.
Software running on other CPUs must perform IPC to the BPMP in order to
execute transactions on that I2C bus. This binding describes an I2C bus
that is accessed in such a fashion.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Tom Warren <twarren@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
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
2.10.2
