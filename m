From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v7 07/21] dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
Date: Tue, 7 Jan 2020 20:25:01 -0800
Message-ID: <1578457515-3477-8-git-send-email-skomatineni@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has 3 clocks clk_out_1, clk_out_2, and clk_out_3.

This patch documents PMC clock bindings and adds a header defining
Tegra PMC clock ids.

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml | 12 ++++++++++++
 include/dt-bindings/soc/tegra-pmc.h                       | 15 +++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 3ff34b348141..5b5c42a00264 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -40,6 +40,15 @@ properties:
       Must contain an entry for each entry in clock-names.
       See ../clocks/clocks-bindings.txt for details.
 
+  '#clock-cells':
+    const: 1
+    description:
+      Tegra PMC has clk_out_1, clk_out_2, and clk_out_3.
+      Consumer of PMC clock should specify the desired clock by having
+      the clock ID in its "clocks" phandle cell with pmc clock provider.
+      See include/dt-bindings/soc/tegra-pmc.h for the list of Tegra PMC
+      clock IDs.
+
   '#interrupt-cells':
     const: 2
     description:
@@ -296,6 +305,7 @@ required:
   - reg
   - clock-names
   - clocks
+  - '#clock-cells'
 
 dependencies:
   "nvidia,suspend-mode": ["nvidia,core-pwr-off-time", "nvidia,cpu-pwr-off-time"]
@@ -307,12 +317,14 @@ examples:
 
     #include <dt-bindings/clock/tegra210-car.h>
     #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
 
     tegra_pmc: pmc@7000e400 {
               compatible = "nvidia,tegra210-pmc";
               reg = <0x0 0x7000e400 0x0 0x400>;
               clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
               clock-names = "pclk", "clk32k_in";
+              #clock-cells = <1>;
 
               nvidia,invert-interrupt;
               nvidia,suspend-mode = <0>;
diff --git a/include/dt-bindings/soc/tegra-pmc.h b/include/dt-bindings/soc/tegra-pmc.h
new file mode 100644
index 000000000000..f7c866404456
--- /dev/null
+++ b/include/dt-bindings/soc/tegra-pmc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019-2020, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_SOC_TEGRA_PMC_H
+#define _DT_BINDINGS_SOC_TEGRA_PMC_H
+
+#define TEGRA_PMC_CLK_OUT_1		0
+#define TEGRA_PMC_CLK_OUT_2		1
+#define TEGRA_PMC_CLK_OUT_3		2
+
+#define TEGRA_PMC_CLK_MAX		3
+
+#endif	/* _DT_BINDINGS_SOC_TEGRA_PMC_H */
-- 
2.7.4
