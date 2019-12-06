From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH 02/18] dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
Date: Fri, 6 Dec 2019 16:20:05 +0530
Message-ID: <1575629421-7039-3-git-send-email-nkristam@nvidia.com>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add device-tree binding documentation for the XUSB device mode controller
present on Tegra210 and Tegra186 SoC. This controller supports the USB 3.0
specification.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 204 +++++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
new file mode 100644
index 0000000..b23c451
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/nvidia,tegra-xudc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
+
+description:
+  The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
+  USB 3.0 SuperSpeed protocols.
+
+maintainers:
+  - Nagarjuna Kristam <nkristam@nvidia.com>
+  - JC Kuo <jckuo@nvidia.com>
+  - Thierry Reding <treding@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - const: nvidia,tegra210-xudc # For Tegra210
+      - items:
+        - const: nvidia,tegra186-xudc # For Tegra186
+
+  interrupts:
+    maxItems: 1
+    description: Must contain the XUSB device interrupt.
+
+  power-domains:
+    maxItems: 2
+    description:
+      A list of PM domain specifiers that reference each power-domain
+      used by the XUSB device mode controller. This list must comprise of a
+      specifier for the XUSBA and XUSBB power-domains.
+      See ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt
+      for details.
+
+  power-domains-names:
+    maxItems: 2
+    description:
+       A list of names that represent each of the specifiers in
+       the 'power-domains' property.
+    items:
+      - const: ss
+      - const: dev
+
+  nvidia,xusb-padctl:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to the XUSB pad controller that is used to configure the USB pads
+      used by the XUDC controller.
+
+  phys:
+    minItems: 1
+    description:
+      Must contain an entry for each entry in phy-names.
+      See ../phy/phy-bindings.txt for details.
+
+  phy-names:
+    minItems: 1
+    items:
+      - const: usb2-0
+      - const: usb2-1
+      - const: usb2-2
+      - const: usb2-3
+      - const: usb3-0
+      - const: usb3-1
+      - const: usb3-2
+      - const: usb3-3
+
+  avddio-usb-supply:
+    description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
+
+  hvdd-usb-supply:
+    description: USB controller power supply. Must supply 3.3 V.
+
+required:
+  - compatible
+  - power-domains
+  - power-domain-names
+  - nvidia,xusb-padctl
+  - phys
+  - phy-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          items:
+            const: nvidia,tegra210-xudc
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
+          items:
+          - description: XUSB device controller registers
+          - description: XUSB device PCI Config registers
+          - description: XUSB device registers.
+        reg-names:
+          maxItems: 3
+          items:
+            - const: base
+            - const: fpci
+            - const: ipfs
+        clocks:
+          description:
+            Must contain an entry for all clocks used. See ../clock/clock-bindings.txt
+            for details.
+          maxItems: 5
+          items:
+            - description: Clock to enable core XUSB dev clock.
+            - description: Clock to enable XUSB super speed clock.
+            - description: Clock to enable XUSB super speed dev clock.
+            - description: Clock to enable XUSB high speed dev clock.
+            - description: Clock to enable XUSB full speed dev clock.
+        clock-names:
+          items:
+           - const: dev
+           - const: ss
+           - const: ss_src
+           - const: hs_src
+           - const: fs_src
+      required:
+        - reg
+        - reg-names
+        - clocks
+        - clock-names
+        - avddio-usb-supply
+        - hvdd-usb-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra186-xudc
+
+    then:
+      properties:
+        reg:
+          maxItems: 2
+          items:
+          - description: XUSB device controller registers
+          - description: XUSB device PCI Config registers
+        reg-names:
+          maxItems: 2
+          items:
+            - const: base
+            - const: fpci
+        clocks:
+          description:
+            Must contain an entry for all clocks used. See ../clock/clock-bindings.txt
+            for details.
+          maxItems: 4
+          items:
+            - description: Clock to enable core XUSB dev clock.
+            - description: Clock to enable XUSB super speed clock.
+            - description: Clock to enable XUSB super speed dev clock.
+            - description: Clock to enable XUSB full speed dev clock.
+        clock-names:
+          items:
+           - const: dev
+           - const: ss
+           - const: ss_src
+           - const: fs_src
+      required:
+        - reg
+        - reg-names
+        - clocks
+        - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@700d0000 {
+        compatible = "nvidia,tegra210-xudc";
+        reg = <0x0 0x700d0000 0x0 0x8000>,
+              <0x0 0x700d8000 0x0 0x1000>,
+              <0x0 0x700d9000 0x0 0x1000>;
+        reg-names = "base", "fpci", "ipfs";
+
+        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
+                 <&tegra_car TEGRA210_CLK_XUSB_SS>,
+                 <&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
+                 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
+                 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
+        clock-names = "dev", "ss", "ss_src", "hs_src", "fs_src";
+
+        power-domains = <&pd_xusbdev>, <&pd_xusbss>;
+        power-domain-names = "dev", "ss";
+
+        nvidia,xusb-padctl = <&padctl>;
+
+        phys = <&micro_b>;
+        phy-names = "usb2-0";
+
+        avddio-usb-supply = <&vdd_pex_1v05>;
+        hvdd-usb-supply = <&vdd_3v3_sys>;
+    };
-- 
2.7.4
