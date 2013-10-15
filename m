From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/13] ARM: tegra: Add MIPI calibration DT entries for Tegra114
Date: Tue, 15 Oct 2013 17:27:54 +0200
Message-ID: <1381850883-12722-5-git-send-email-treding@nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Changes in v2:
- remove include/dt-bindings/gpu/host1x/tegra114-mipi.h

 arch/arm/boot/dts/tegra114.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 2905145..e45e619 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -398,6 +398,13 @@
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
-- 
1.8.4
