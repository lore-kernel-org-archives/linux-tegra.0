From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
Date: Fri, 12 Jun 2020 16:18:50 +0200
Message-ID: <20200612141903.2391044-26-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Convert the NVIDIA Tegra GPIO controller device tree bindings from
free-form text format to json-schema.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/gpio/nvidia,tegra20-gpio.txt     |  40 -------
 .../bindings/gpio/nvidia,tegra20-gpio.yaml    | 111 ++++++++++++++++++
 2 files changed, 111 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
deleted file mode 100644
index 023c9526e5f8..000000000000
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-NVIDIA Tegra GPIO controller
-
-Required properties:
-- compatible : "nvidia,tegra<chip>-gpio"
-- reg : Physical base address and length of the controller's registers.
-- interrupts : The interrupt outputs from the controller. For Tegra20,
-  there should be 7 interrupts specified, and for Tegra30, there should
-  be 8 interrupts specified.
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters:
-  - bit 0 specifies polarity (0 for normal, 1 for inverted)
-- gpio-controller : Marks the device node as a GPIO controller.
-- #interrupt-cells : Should be 2.
-  The first cell is the GPIO number.
-  The second cell is used to specify flags:
-    bits[3:0] trigger type and level flags:
-      1 = low-to-high edge triggered.
-      2 = high-to-low edge triggered.
-      4 = active high level-sensitive.
-      8 = active low level-sensitive.
-      Valid combinations are 1, 2, 3, 4, 8.
-- interrupt-controller : Marks the device node as an interrupt controller.
-
-Example:
-
-gpio: gpio@6000d000 {
-	compatible = "nvidia,tegra20-gpio";
-	reg = < 0x6000d000 0x1000 >;
-	interrupts = < 0 32 0x04
-		       0 33 0x04
-		       0 34 0x04
-		       0 35 0x04
-		       0 55 0x04
-		       0 87 0x04
-		       0 89 0x04 >;
-	#gpio-cells = <2>;
-	gpio-controller;
-	#interrupt-cells = <2>;
-	interrupt-controller;
-};
diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
new file mode 100644
index 000000000000..b2debdb0caff
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nvidia,tegra20-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra GPIO Controller (Tegra20 - Tegra210)
+
+maintainers:
+  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: nvidia,tegra20-gpio
+      - const: nvidia,tegra30-gpio
+      - items:
+          - enum:
+              - nvidia,tegra114-gpio
+              - nvidia,tegra124-gpio
+              - nvidia,tegra210-gpio
+          - const: nvidia,tegra30-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: The interrupt outputs from the controller. For Tegra20,
+      there should be 7 interrupts specified, and for Tegra30, there should
+      be 8 interrupts specified.
+
+  "#gpio-cells":
+    description: The first cell is the pin number and the second cell is used
+      to specify the GPIO polarity (0 = active high, 1 = active low).
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    const: 2
+
+  gpio-controller:
+    description: Marks the device node as a GPIO controller.
+    type: boolean
+
+  "#interrupt-cells":
+    description: |
+      Should be 2. The first cell is the GPIO number. The second cell is
+      used to specify flags:
+
+        bits[3:0] trigger type and level flags:
+          1 = low-to-high edge triggered.
+          2 = high-to-low edge triggered.
+          4 = active high level-sensitive.
+          8 = active low level-sensitive.
+
+      Valid combinations are 1, 2, 3, 4, 8.
+    const: 2
+
+  interrupt-controller:
+    description: Marks the device node as an interrupt controller.
+
+patternProperties:
+  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
+  "^gpios(-[a-zA-Z0-9-]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra30-gpio
+    then:
+      properties:
+        interrupts:
+          minItems: 8
+          maxItems: 8
+    else:
+      properties:
+        interrupts:
+          minItems: 7
+          maxItems: 7
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#gpio-cells"
+  - gpio-controller
+  - "#interrupt-cells"
+  - interrupt-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gpio: gpio@6000d000 {
+        compatible = "nvidia,tegra20-gpio";
+        reg = <0x6000d000 0x1000>;
+        interrupts = <0 32 0x04>,
+                     <0 33 0x04>,
+                     <0 34 0x04>,
+                     <0 35 0x04>,
+                     <0 55 0x04>,
+                     <0 87 0x04>,
+                     <0 89 0x04>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        #interrupt-cells = <2>;
+        interrupt-controller;
+    };
-- 
2.24.1
