From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/7] dt-bindings: timer: Add bindings for NVIDIA Tegra186 timers
Date: Wed,  1 Apr 2020 00:19:08 +0200
Message-ID: <20200331221914.2966407-2-thierry.reding@gmail.com>
References: <20200331221914.2966407-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200331221914.2966407-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The NVIDIA Tegra186 SoC contains an IP block that provides a register
interface for ten timers with a 29-bit counter that can generate one-
shot, periodic or watchdog interrupts.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- add required properties section
- add additionalProperties: false
- do not show status in example

 .../bindings/timer/nvidia,tegra186-timer.yaml | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml b/Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
new file mode 100644
index 000000000000..d722cd267bf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nvidia,tegra186-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 timers
+
+maintainers:
+  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+  - Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+
+description: |
+  The Tegra186 timer provides ten 29-bit timer counters and one 32-bit TSC
+  (timestamp counter). The timers run at either a fixed 1 MHz clock rate
+  derived from the oscillator clock. Each timer can be programmed to raise
+  one-shot, periodic, or watchdog interrupts.
+
+properties:
+  compatible:
+    oneOf:
+      - description: NVIDIA Tegra186
+        items:
+          - const: nvidia,tegra186-timer
+
+      - description: NVIDIA Tegra194
+        items:
+          - const: nvidia,tegra194-timer
+          - const: nvidia,tegra186-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 10
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@3010000 {
+        compatible = "nvidia,tegra186-timer";
+        reg = <0x03010000 0x000e0000>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.24.1
