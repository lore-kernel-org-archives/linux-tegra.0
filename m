From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 15/38] dt-bindings: sound: tegra: hda: Convert to json-schema
Date: Fri, 12 Jun 2020 16:18:40 +0200
Message-ID: <20200612141903.2391044-16-thierry.reding@gmail.com>
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

Convert the Tegra HDA controller bindings from the free-form text format
to json-schema.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/sound/nvidia,tegra30-hda.txt     |  35 -----
 .../bindings/sound/nvidia,tegra30-hda.yaml    | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
deleted file mode 100644
index 21cd310963b1..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-NVIDIA Tegra30 HDA controller
-
-Required properties:
-- compatible : For Tegra30, must contain "nvidia,tegra30-hda".  Otherwise,
-  must contain '"nvidia,<chip>-hda", "nvidia,tegra30-hda"', where <chip> is
-  tegra114, tegra124, or tegra132.
-- reg : Should contain the HDA registers location and length.
-- interrupts : The interrupt from the HDA controller.
-- clocks : Must contain an entry for each required entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-
-Optional properties:
-- nvidia,model : The user-visible name of this sound complex. Since the property
-  is optional, legacy boards can use default name provided in hda driver.
-
-Example:
-
-hda@70030000 {
-	compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
-	reg = <0x0 0x70030000 0x0 0x10000>;
-	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA124_CLK_HDA>,
-		 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
-		 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
-	clock-names = "hda", "hda2hdmi", "hda2codec_2x";
-	resets = <&tegra_car 125>, /* hda */
-		 <&tegra_car 128>, /* hda2hdmi */
-		 <&tegra_car 111>; /* hda2codec_2x */
-	reset-names = "hda", "hda2hdmi", "hda2codec_2x";
-	nvidia,model = "jetson-tk1-hda";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
new file mode 100644
index 000000000000..ea8e39934945
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra30 HDA controller
+
+maintainers:
+  - Thierry Reding <thierry.reding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+
+properties:
+  compatible:
+    oneOf:
+      - description: NVIDIA Tegra30
+        const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra114
+        items:
+          - const: nvidia,tegra114-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra124
+        items:
+          - const: nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra132
+        items:
+          - const: nvidia,tegra132-hda
+          - const: nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra210
+        items:
+          - const: nvidia,tegra210-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra186
+        items:
+          - const: nvidia,tegra186-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra194
+        items:
+          - const: nvidia,tegra194-hda
+          - const: nvidia,tegra30-hda
+
+  reg:
+    description: base address and size of the register region for the HDA
+      controller
+
+  interrupts:
+    description: interrupt from the HDA controller
+
+  clocks:
+    items:
+      - description: The main HDA controller clock
+      - description: The clock for the logic feeding data from HDA to HDMI.
+      - description: The clock for the logic feeding data from HDA to codec.
+
+  clock-names:
+    contains:
+      enum:
+        - hda
+        - hda2hdmi
+        - hda2codec_2x
+
+  resets:
+    items:
+      - description: Reset for the HDA controller.
+      - description: Reset for the HDA to HDMI logic.
+      - description: Reset for the HDA to codec logic.
+
+  reset-names:
+    contains:
+      enum:
+        - hda
+        - hda2hdmi
+        - hda2codec_2x
+
+  power-domains:
+    description: A list of PM domain specifiers that reference each
+      power-domain used by the xHCI controller. This list must comprise
+      of a specifier for the XUSBA and XUSBC power-domains. See
+      ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt
+      for details.
+
+  iommus:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  nvidia,model:
+    description: The user-visible name of this sound complex. Since the
+      property is optional, legacy boards can use default name provided in HDA
+      driver.
+    $ref: "/schemas/types.yaml#/definitions/string"
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/tegra124-car.h>
+
+    hda@70030000 {
+        compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
+        reg = <0x0 0x70030000 0x0 0x10000>;
+        interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_HDA>,
+                 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+                 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
+        clock-names = "hda", "hda2hdmi", "hda2codec_2x";
+        resets = <&tegra_car 125>, /* hda */
+                 <&tegra_car 128>, /* hda2hdmi */
+                 <&tegra_car 111>; /* hda2codec_2x */
+        reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+        nvidia,model = "jetson-tk1-hda";
+    };
-- 
2.24.1
