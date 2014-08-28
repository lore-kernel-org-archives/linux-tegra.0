From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/5] of: Add NVIDIA Tegra Legacy Interrupt Controller binding
Date: Thu, 28 Aug 2014 17:31:15 +0200
Message-ID: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Legacy Interrupt Controller found on NVIDIA Tegra SoCs is used by
the AVP coprocessor and can also serve as a backup for the ARM Cortex
CPU's local interrupt controller (GIC).

The LIC is subdivided into multiple identical units, each handling 32
possible interrupt sources.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- bracket individual tuples in the "reg" property

 .../interrupt-controller/nvidia,tegra20-ictlr.txt     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
new file mode 100644
index 000000000000..1639389b7360
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
@@ -0,0 +1,19 @@
+NVIDIA Tegra Legacy Interrupt Controller
+
+The legacy interrupt controller is divided into units that serve 32 interrupts
+each. Tegra20 implements four units, whereas Tegra30 and later implement five.
+
+Required properties:
+- compatible: "nvidia,tegra<chip>-ictlr"
+- reg: Physical base address and length of the controller's registers. There
+  should be one entry for each unit.
+
+Example:
+
+	interrupt-controller@60004000 {
+		compatible = "nvidia,tegra20-ictlr";
+		reg = <0x60004000 0x40>, /* primary controller */
+		      <0x60004100 0x40>, /* secondary controller */
+		      <0x60004200 0x40>, /* tertiary controller */
+		      <0x60004300 0x40>; /* quaternary controller */
+	};
-- 
2.0.4
