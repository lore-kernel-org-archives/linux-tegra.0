From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/9] ARM: tegra: Add MIPI calibration DT entries for Tegra114
Date: Mon,  7 Oct 2013 13:48:42 +0200
Message-ID: <1381146528-18069-4-git-send-email-treding@nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add a device node for the MIPI calibration block on Tegra114. There is
no need to disable it by default because it only enables the clock while
performing calibration and therefore shouldn't be consuming any power
when unused.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi                |  8 ++++++++
 include/dt-bindings/gpu/host1x/tegra114-mipi.h | 11 +++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/gpu/host1x/tegra114-mipi.h

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 2905145..be91592 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -1,6 +1,7 @@
 #include <dt-bindings/clock/tegra114-car.h>
 #include <dt-bindings/gpio/tegra-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/gpu/host1x/tegra114-mipi.h>
 
 #include "skeleton.dtsi"
 
@@ -398,6 +399,13 @@
 		};
 	};
 
+	mipi: mipi {
+		compatible = "nvidia,tegra114-mipi";
+		reg = <0x700e3000 0x100>;
+		clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
+		#calibrate-cells = <1>;
+	};
+
 	sdhci@78000000 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000000 0x200>;
diff --git a/include/dt-bindings/gpu/host1x/tegra114-mipi.h b/include/dt-bindings/gpu/host1x/tegra114-mipi.h
new file mode 100644
index 0000000..1c218a4
--- /dev/null
+++ b/include/dt-bindings/gpu/host1x/tegra114-mipi.h
@@ -0,0 +1,11 @@
+/*
+ * This header provides constants for binding nvidia,tegra114-mipical
+ */
+
+#ifndef _DT_BINDINGS_GPU_HOST1X_TEGRA114_MIPICAL_H
+#define _DT_BINDINGS_GPU_HOST1X_TEGRA114_MIPICAL_H
+
+#define TEGRA114_MIPI_DSIA 0x060
+#define TEGRA114_MIPI_DSIB 0x180
+
+#endif
-- 
1.8.4
