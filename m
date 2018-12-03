From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 30/34] dt-bindings: arm: Convert Tegra board/soc bindings to json-schema
Date: Mon,  3 Dec 2018 15:32:19 -0600
Message-ID: <20181203213223.16986-31-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Convert Tegra SoC bindings to DT schema format using json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/tegra.txt         |  65 -----------
 .../devicetree/bindings/arm/tegra.yaml        | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra.yaml

diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
deleted file mode 100644
index c59b15f64346..000000000000
--- a/Documentation/devicetree/bindings/arm/tegra.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-NVIDIA Tegra device tree bindings
--------------------------------------------
-
-SoCs
--------------------------------------------
-
-Each device tree must specify which Tegra SoC it uses, using one of the
-following compatible values:
-
-  nvidia,tegra20
-  nvidia,tegra30
-  nvidia,tegra114
-  nvidia,tegra124
-  nvidia,tegra132
-  nvidia,tegra210
-  nvidia,tegra186
-  nvidia,tegra194
-
-Boards
--------------------------------------------
-
-Each device tree must specify which one or more of the following
-board-specific compatible values:
-
-  ad,medcom-wide
-  ad,plutux
-  ad,tamonten
-  ad,tec
-  compal,paz00
-  compulab,trimslice
-  nvidia,beaver
-  nvidia,cardhu
-  nvidia,cardhu-a02
-  nvidia,cardhu-a04
-  nvidia,dalmore
-  nvidia,harmony
-  nvidia,jetson-tk1
-  nvidia,norrin
-  nvidia,p2371-0000
-  nvidia,p2371-2180
-  nvidia,p2571
-  nvidia,p2771-0000
-  nvidia,p2972-0000
-  nvidia,roth
-  nvidia,seaboard
-  nvidia,tn7
-  nvidia,ventana
-  toradex,apalis_t30
-  toradex,apalis_t30-eval
-  toradex,apalis_t30-v1.1
-  toradex,apalis_t30-v1.1-eval
-  toradex,apalis-tk1
-  toradex,apalis-tk1-eval
-  toradex,apalis-tk1-v1.2
-  toradex,apalis-tk1-v1.2-eval
-  toradex,colibri_t20
-  toradex,colibri_t20-eval-v3
-  toradex,colibri_t20-iris
-  toradex,colibri_t30
-  toradex,colibri_t30-eval-v3
-
-Trusted Foundations
--------------------------------------------
-Tegra supports the Trusted Foundation secure monitor. See the
-"tlm,trusted-foundations" binding's documentation for more details.
diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
new file mode 100644
index 000000000000..66493892ffc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/tegra.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra device tree bindings
+
+maintainers:
+  - Marcel Ziswiler <marcel.ziswiler@toradex.com>
+  - Peter De Schrijver <pdeschrijver@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - compal,paz00
+              - compulab,trimslice
+              - nvidia,harmony
+              - nvidia,seaboard
+              - nvidia,ventana
+          - const: nvidia,tegra20
+      - items:
+          - enum:
+              - ad,medcom-wide
+              - ad,plutux
+              - ad,tec
+          - const: ad,tamonten
+          - const: nvidia,tegra20
+      - items:
+          - enum:
+              - toradex,colibri_t20-eval-v3
+              - toradex,colibri_t20-iris
+          - const: toradex,colibri_t20
+          - const: nvidia,tegra20
+      - items:
+          - enum:
+              - nvidia,beaver
+          - const: nvidia,tegra30
+      - items:
+          - enum:
+              - nvidia,cardhu-a02
+              - nvidia,cardhu-a04
+          - const: nvidia,cardhu
+          - const: nvidia,tegra30
+      - items:
+          - const: toradex,apalis_t30-eval
+          - const: toradex,apalis_t30
+          - const: nvidia,tegra30
+      - items:
+          - const: toradex,apalis_t30-eval-v1.1
+          - const: toradex,apalis_t30-eval
+          - const: toradex,apalis_t30-v1.1
+          - const: toradex,apalis_t30
+          - const: nvidia,tegra30
+      - items:
+          - enum:
+              - toradex,colibri_t30-eval-v3
+          - const: toradex,colibri_t30
+          - const: nvidia,tegra30
+      - items:
+          - enum:
+              - nvidia,dalmore
+              - nvidia,roth
+              - nvidia,tn7
+          - const: nvidia,tegra114
+      - items:
+          - enum:
+              - nvidia,jetson-tk1
+              - nvidia,venice2
+          - const: nvidia,tegra124
+      - items:
+          - const: toradex,apalis-tk1-eval
+          - const: toradex,apalis-tk1
+          - const: nvidia,tegra124
+      - items:
+          - const: toradex,apalis-tk1-v1.2-eval
+          - const: toradex,apalis-tk1-eval
+          - const: toradex,apalis-tk1-v1.2
+          - const: toradex,apalis-tk1
+          - const: nvidia,tegra124
+      - items:
+          - enum:
+              - nvidia,norrin
+          - const: nvidia,tegra132
+          - const: nvidia,tegra124
+      - items:
+          - enum:
+              - nvidia,p2371-0000
+              - nvidia,p2371-2180
+              - nvidia,p2571
+          - const: nvidia,tegra210
+      - items:
+          - enum:
+              - nvidia,p2771-0000
+          - const: nvidia,tegra186
+      - items:
+          - enum:
+              - nvidia,p2972-0000
+          - const: nvidia,tegra194
-- 
2.19.1
