From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 07/15] dt-bindings: memory: tegra30: Convert to Tegra124 YAML
Date: Mon,  1 Jul 2019 00:00:11 +0300
Message-ID: <20190630210019.26914-8-digetx@gmail.com>
References: <20190630210019.26914-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190630210019.26914-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Tegra30 binding will actually differ from the Tegra124 a tad, in
particular the EMEM configuration description. Hence rename the binding
to Tegra124 during of the conversion to YAML.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../nvidia,tegra124-mc.yaml                   | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
new file mode 100644
index 000000000000..d18242510295
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:
+  NVIDIA Tegra124 SoC Memory Controller
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  Tegra124 SoC features a hybrid 2x32-bit / 1x64-bit memory controller.
+  These are interleaved to provide high performance with the load shared across
+  two memory channels. The Tegra124 Memory Controller handles memory requests
+  from internal clients and arbitrates among them to allocate memory bandwidth
+  for DDR3L and LPDDR3 SDRAMs.
+
+properties:
+  compatible:
+    const: nvidia,tegra124-mc
+
+  reg:
+    maxItems: 1
+    description:
+      Physical base address.
+
+  clocks:
+    maxItems: 1
+    description:
+      Memory Controller clock.
+
+  clock-names:
+    items:
+      - const: mc
+
+  interrupts:
+    maxItems: 1
+    description:
+      Memory Controller interrupt.
+
+  "#reset-cells":
+    const: 1
+
+  "#iommu-cells":
+    const: 1
+
+patternProperties:
+  ".*":
+    properties:
+      nvidia,ram-code:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Value of RAM_CODE this timing set is used for.
+
+    patternProperties:
+      ".*":
+        properties:
+          clock-frequency:
+            description:
+              Memory clock rate in Hz.
+
+          nvidia,emem-configuration:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description: |
+              Values to be written to the EMEM register block. See section
+              "15.6.1 MC Registers" in the TRM.
+            items:
+              - description: MC_EMEM_ARB_CFG
+              - description: MC_EMEM_ARB_OUTSTANDING_REQ
+              - description: MC_EMEM_ARB_TIMING_RCD
+              - description: MC_EMEM_ARB_TIMING_RP
+              - description: MC_EMEM_ARB_TIMING_RC
+              - description: MC_EMEM_ARB_TIMING_RAS
+              - description: MC_EMEM_ARB_TIMING_FAW
+              - description: MC_EMEM_ARB_TIMING_RRD
+              - description: MC_EMEM_ARB_TIMING_RAP2PRE
+              - description: MC_EMEM_ARB_TIMING_WAP2PRE
+              - description: MC_EMEM_ARB_TIMING_R2R
+              - description: MC_EMEM_ARB_TIMING_W2W
+              - description: MC_EMEM_ARB_TIMING_R2W
+              - description: MC_EMEM_ARB_TIMING_W2R
+              - description: MC_EMEM_ARB_DA_TURNS
+              - description: MC_EMEM_ARB_DA_COVERS
+              - description: MC_EMEM_ARB_MISC0
+              - description: MC_EMEM_ARB_MISC1
+              - description: MC_EMEM_ARB_RING1_THROTTLE
+
+        required:
+          - clock-frequency
+          - nvidia,emem-configuration
+
+    required:
+      - nvidia,ram-code
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#reset-cells"
+  - "#iommu-cells"
+
+examples:
+  - |
+    memory-controller@70019000 {
+        compatible = "nvidia,tegra124-mc";
+        reg = <0x0 0x70019000 0x0 0x1000>;
+        clocks = <&tegra_car 32>;
+        clock-names = "mc";
+
+        interrupts = <0 77 4>;
+
+        #iommu-cells = <1>;
+        #reset-cells = <1>;
+
+        emc-timings-3 {
+            nvidia,ram-code = <3>;
+
+            timing-12750000 {
+                clock-frequency = <12750000>;
+
+                nvidia,emem-configuration = <
+                    0x40040001 /* MC_EMEM_ARB_CFG */
+                    0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
+                    0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+                    0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+                    0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+                    0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+                    0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+                    0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+                    0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+                    0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+                    0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+                    0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+                    0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+                    0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+                    0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+                    0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+                    0x77e30303 /* MC_EMEM_ARB_MISC0 */
+                    0x70000f03 /* MC_EMEM_ARB_MISC1 */
+                    0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+                >;
+            };
+        };
+    };
-- 
2.22.0
