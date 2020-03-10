From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 4/8] dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
Date: Tue, 10 Mar 2020 16:19:59 +0100
Message-ID: <20200310152003.2945170-5-thierry.reding@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200310152003.2945170-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add the binding document for the external memory controller (EMC) which
communicates with external LPDDR4 devices. It includes the bindings of
the EMC node and a sub-node of EMC table which under the reserved memory
node. The EMC table contains the data of the rates that EMC supported.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v5:
- convert to dt-schema

 .../nvidia,tegra210-emc.yaml                  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
new file mode 100644
index 000000000000..caf21c08f9cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 SoC External Memory Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+
+description: |
+  The EMC interfaces with the off-chip SDRAM to service the request stream
+  sent from the memory controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra210-emc
+
+  reg:
+    maxItems: 3
+
+  clocks:
+    items:
+      - description: external memory clock
+
+  clock-names:
+    items:
+      - const: emc
+
+  interrupts:
+    items:
+      - description: EMC general interrupt
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to a reserved memory region describing the table of EMC
+      frequencies trained by the firmware
+
+  nvidia,memory-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the memory controller node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - nvidia,memory-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        emc_table: emc-table@83400000 {
+            compatible = "nvidia,tegra210-emc-table";
+            reg = <0x0 0x83400000 0x0 0x10000>;
+            status = "okay";
+        };
+    };
+
+    external-memory-controller@7001b000 {
+        compatible = "nvidia,tegra210-emc";
+        reg = <0x0 0x7001b000 0x0 0x1000>,
+              <0x0 0x7001e000 0x0 0x1000>,
+              <0x0 0x7001f000 0x0 0x1000>;
+        clocks = <&tegra_car TEGRA210_CLK_EMC>;
+        clock-names = "emc";
+        interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+        memory-region = <&emc_table>;
+        nvidia,memory-controller = <&mc>;
+    };
-- 
2.24.1
