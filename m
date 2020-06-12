From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/38] dt-bindings: mmc: tegra: Convert to json-schema
Date: Fri, 12 Jun 2020 16:18:36 +0200
Message-ID: <20200612141903.2391044-12-thierry.reding@gmail.com>
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

Convert the NVIDIA Tegra SDHCI bindings from the free-form text format
to json-schema.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/mmc/nvidia,tegra20-sdhci.txt     | 117 --------
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 270 ++++++++++++++++++
 2 files changed, 270 insertions(+), 117 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
deleted file mode 100644
index 2cf3affa1be7..000000000000
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
+++ /dev/null
@@ -1,117 +0,0 @@
-* NVIDIA Tegra Secure Digital Host Controller
-
-This controller on Tegra family SoCs provides an interface for MMC, SD,
-and SDIO types of memory cards.
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the sdhci-tegra driver.
-
-Required properties:
-- compatible : should be one of:
-  - "nvidia,tegra20-sdhci": for Tegra20
-  - "nvidia,tegra30-sdhci": for Tegra30
-  - "nvidia,tegra114-sdhci": for Tegra114
-  - "nvidia,tegra124-sdhci": for Tegra124 and Tegra132
-  - "nvidia,tegra210-sdhci": for Tegra210
-  - "nvidia,tegra186-sdhci": for Tegra186
-  - "nvidia,tegra194-sdhci": for Tegra194
-- clocks : Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - sdhci
-
-Optional properties:
-- power-gpios : Specify GPIOs for power control
-
-Example:
-
-sdhci@c8000200 {
-	compatible = "nvidia,tegra20-sdhci";
-	reg = <0xc8000200 0x200>;
-	interrupts = <47>;
-	clocks = <&tegra_car 14>;
-	resets = <&tegra_car 14>;
-	reset-names = "sdhci";
-	cd-gpios = <&gpio 69 0>; /* gpio PI5 */
-	wp-gpios = <&gpio 57 0>; /* gpio PH1 */
-	power-gpios = <&gpio 155 0>; /* gpio PT3 */
-	bus-width = <8>;
-};
-
-Optional properties for Tegra210, Tegra186 and Tegra194:
-- pinctrl-names, pinctrl-0, pinctrl-1 : Specify pad voltage
-  configurations. Valid pinctrl-names are "sdmmc-3v3" and "sdmmc-1v8"
-  for controllers supporting multiple voltage levels. The order of names
-  should correspond to the pin configuration states in pinctrl-0 and
-  pinctrl-1.
-- pinctrl-names : "sdmmc-3v3-drv" and "sdmmc-1v8-drv" are applicable for
-  Tegra210 where pad config registers are in the pinmux register domain
-  for pull-up-strength and pull-down-strength values configuration when
-  using pads at 3V3 and 1V8 levels.
-- nvidia,only-1-8-v : The presence of this property indicates that the
-  controller operates at a 1.8 V fixed I/O voltage.
-- nvidia,pad-autocal-pull-up-offset-3v3,
-  nvidia,pad-autocal-pull-down-offset-3v3 : Specify drive strength
-  calibration offsets for 3.3 V signaling modes.
-- nvidia,pad-autocal-pull-up-offset-1v8,
-  nvidia,pad-autocal-pull-down-offset-1v8 : Specify drive strength
-  calibration offsets for 1.8 V signaling modes.
-- nvidia,pad-autocal-pull-up-offset-3v3-timeout,
-  nvidia,pad-autocal-pull-down-offset-3v3-timeout : Specify drive
-  strength used as a fallback in case the automatic calibration times
-  out on a 3.3 V signaling mode.
-- nvidia,pad-autocal-pull-up-offset-1v8-timeout,
-  nvidia,pad-autocal-pull-down-offset-1v8-timeout : Specify drive
-  strength used as a fallback in case the automatic calibration times
-  out on a 1.8 V signaling mode.
-- nvidia,pad-autocal-pull-up-offset-sdr104,
-  nvidia,pad-autocal-pull-down-offset-sdr104 : Specify drive strength
-  calibration offsets for SDR104 mode.
-- nvidia,pad-autocal-pull-up-offset-hs400,
-  nvidia,pad-autocal-pull-down-offset-hs400 : Specify drive strength
-  calibration offsets for HS400 mode.
-- nvidia,default-tap : Specify the default inbound sampling clock
-  trimmer value for non-tunable modes.
-- nvidia,default-trim : Specify the default outbound clock trimmer
-  value.
-- nvidia,dqs-trim : Specify DQS trim value for HS400 timing
-
-  Notes on the pad calibration pull up and pulldown offset values:
-    - The property values are drive codes which are programmed into the
-      PD_OFFSET and PU_OFFSET sections of the
-      SDHCI_TEGRA_AUTO_CAL_CONFIG register.
-    - A higher value corresponds to higher drive strength. Please refer
-      to the reference manual of the SoC for correct values.
-    - The SDR104 and HS400 timing specific values are used in
-      corresponding modes if specified.
-
-  Notes on tap and trim values:
-    - The values are used for compensating trace length differences
-      by adjusting the sampling point.
-    - The values are programmed to the Vendor Clock Control Register.
-      Please refer to the reference manual of the SoC for correct
-      values.
-    - The DQS trim values are only used on controllers which support
-      HS400 timing. Only SDMMC4 on Tegra210 and Tegra 186 supports
-      HS400.
-
-Example:
-sdhci@700b0000 {
-	compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
-	reg = <0x0 0x700b0000 0x0 0x200>;
-	interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA210_CLK_SDMMC1>;
-	clock-names = "sdhci";
-	resets = <&tegra_car 14>;
-	reset-names = "sdhci";
-	pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
-	pinctrl-0 = <&sdmmc1_3v3>;
-	pinctrl-1 = <&sdmmc1_1v8>;
-	nvidia,pad-autocal-pull-up-offset-3v3 = <0x00>;
-	nvidia,pad-autocal-pull-down-offset-3v3 = <0x7d>;
-	nvidia,pad-autocal-pull-up-offset-1v8 = <0x7b>;
-	nvidia,pad-autocal-pull-down-offset-1v8 = <0x7b>;
-	status = "disabled";
-};
diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
new file mode 100644
index 000000000000..7652c2c1ff35
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -0,0 +1,270 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/nvidia,tegra20-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Secure Digital Host Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+
+description: |
+  This controller on Tegra family SoCs provides an interface for MMC, SD, and
+  SDIO types of memory cards.
+
+  This file documents differences between the core properties described by
+  mmc-controller.yaml and the properties for the Tegra SDHCI controller.
+
+properties:
+  # required properties
+  compatible:
+    oneOf:
+      - description: NVIDIA Tegra20
+        const: nvidia,tegra20-sdhci
+
+      - description: NVIDIA Tegra30
+        const: nvidia,tegra30-sdhci
+
+      - description: NVIDIA Tegra114
+        const: nvidia,tegra114-sdhci
+
+      - description: NVIDIA Tegra124
+        const: nvidia,tegra124-sdhci
+
+      - description: NVIDIA Tegra132
+        items:
+          - const: nvidia,tegra132-sdhci
+          - const: nvidia,tegra124-sdhci
+
+      - description: NVIDIA Tegra210
+        const: nvidia,tegra210-sdhci
+
+      - description: NVIDIA Tegra186
+        const: nvidia,tegra186-sdhci
+
+      - description: NVIDIA Tegra194
+        const: nvidia,tegra194-sdhci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  assigned-clocks:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  assigned-clock-parents:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  assigned-clock-rates:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+
+  clocks:
+    items:
+      - description: module clock
+
+  clock-names:
+    items:
+      - const: sdhci
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: sdhci
+
+  # optional properties
+  power-gpios:
+    description: specify GPIOs for power control
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  iommus:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  nvidia,default-tap:
+    description: Specify the default inbound sampling clock trimmer value for
+      non-tunable modes.
+
+      The values are used for compensating trace length differences by
+      adjusting the sampling point. The values are programmed to the Vendor
+      Clock Control Register. Please refer to the reference manual of the SoC
+      for correct values.
+
+      The DQS trim values are only used on controllers which support HS400
+      timing. Only SDMMC4 on Tegra210 and Tegra186 supports HS400.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,default-trim:
+    description: Specify the default outbound clock trimmer value.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,dqs-trim:
+    description: Specify DQS trim value for HS400 timing.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-1v8:
+    description: Specify drive strength calibration offsets for 1.8 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-1v8-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 1.8 V signaling mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-3v3:
+    description: Specify drive strength calibration offsets for 3.3 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-3v3-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 3.3 V signaling mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-sdr104:
+    description: Specify drive strength calibration offsets for SDR104 mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-hs400:
+    description: Specify drive strength calibration offsets for HS400 mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-1v8:
+    description: Specify drive strength calibration offsets for 1.8 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-1v8-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 1.8 V signaling mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-3v3:
+    description: Specify drive strength calibration offsets for 3.3 V
+      signaling modes.
+
+      The property values are drive codes which are programmed into the
+      PD_OFFSET and PU_OFFSET sections of the SDHCI_TEGRA_AUTO_CAL_CONFIG
+      register. A higher value corresponds to higher drive strength. Please
+      refer to the reference manual of the SoC for correct values. The SDR104
+      and HS400 timing specific values are used in corresponding modes if
+      specified.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-3v3-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 3.3 V signaling mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-sdr104:
+    description: Specify drive strength calibration offsets for SDR104 mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-hs400:
+    description: Specify drive strength calibration offsets for HS400 mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,only-1-8v:
+    description: The presence of this property indicates that the controller
+      operates at a 1.8 V fixed I/O voltage.
+    $ref: "/schemas/types.yaml#/definitions/flag"
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
+allOf:
+  - $ref: "mmc-controller.yaml"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-sdhci
+    then:
+      properties:
+        pinctrl-names:
+          oneOf:
+            - items:
+                - const: sdmmc-3v3
+                  description: pad configuration for 3.3 V
+                - const: sdmmc-1v8
+                  description: pad configuration for 1.8 V
+                - const: sdmmc-3v3-drv
+                  description: pull-up/down configuration for 3.3 V
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+            - items:
+                - const: sdmmc-3v3-drv
+                  description: pull-up/down configuration for 3.3 V
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+            - items:
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-sdhci
+              - nvidia,tegra194-sdhci
+    then:
+      properties:
+        pinctrl-names:
+          items:
+            - const: sdmmc-3v3
+              description: pad configuration for 3.3 V
+            - const: sdmmc-1v8
+              description: pad configuration for 1.8 V
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sdhci@c8000200 {
+        compatible = "nvidia,tegra20-sdhci";
+        reg = <0xc8000200 0x200>;
+        interrupts = <47>;
+        clocks = <&tegra_car 14>;
+        resets = <&tegra_car 14>;
+        reset-names = "sdhci";
+        cd-gpios = <&gpio 69 0>; /* gpio PI5 */
+        wp-gpios = <&gpio 57 0>; /* gpio PH1 */
+        power-gpios = <&gpio 155 0>; /* gpio PT3 */
+        bus-width = <8>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sdhci@700b0000 {
+        compatible = "nvidia,tegra210-sdhci";
+        reg = <0x0 0x700b0000 0x0 0x200>;
+        interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA210_CLK_SDMMC1>;
+        clock-names = "sdhci";
+        resets = <&tegra_car 14>;
+        reset-names = "sdhci";
+        pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+        pinctrl-0 = <&sdmmc1_3v3>;
+        pinctrl-1 = <&sdmmc1_1v8>;
+        nvidia,pad-autocal-pull-up-offset-3v3 = <0x00>;
+        nvidia,pad-autocal-pull-down-offset-3v3 = <0x7d>;
+        nvidia,pad-autocal-pull-up-offset-1v8 = <0x7b>;
+        nvidia,pad-autocal-pull-down-offset-1v8 = <0x7b>;
+        status = "disabled";
+    };
-- 
2.24.1
