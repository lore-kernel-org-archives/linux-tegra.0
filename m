From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 10/11] arm64: tegra: Add SOR power-domain node
Date: Wed, 29 Jun 2016 10:17:56 +0100
Message-ID: <1467191877-26017-11-git-send-email-jonathanh@nvidia.com>
References: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add node for SOR power-domain for Tegra210 and populate the SOR
power-domain phandle for SOR and DPAUX nodes that are dependent
on this power-domain.

Please note that although neither the SOR or DPAUX drivers currently
support runtime power-management, by populating the power-domain node
the SOR power-domain will be turned on before probing SOR or DPAUX
devices and kept on while the devices are bound.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index ebf44f4059f8..ef317f0d773f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -34,6 +34,7 @@
 			clock-names = "dpaux", "parent";
 			resets = <&tegra_car 207>;
 			reset-names = "dpaux";
+			power-domains = <&pd_sor>;
 			status = "disabled";
 		};
 
@@ -154,6 +155,7 @@
 			clock-names = "sor", "parent", "dp", "safe";
 			resets = <&tegra_car 182>;
 			reset-names = "sor";
+			power-domains = <&pd_sor>;
 			status = "disabled";
 		};
 
@@ -168,6 +170,7 @@
 			clock-names = "sor", "parent", "dp", "safe";
 			resets = <&tegra_car 183>;
 			reset-names = "sor";
+			power-domains = <&pd_sor>;
 			status = "disabled";
 		};
 
@@ -180,6 +183,7 @@
 			clock-names = "dpaux", "parent";
 			resets = <&tegra_car 181>;
 			reset-names = "dpaux";
+			power-domains = <&pd_sor>;
 			status = "disabled";
 		};
 
@@ -592,6 +596,26 @@
 				resets = <&tegra_car 198>;
 				#power-domain-cells = <0>;
 			};
+
+			pd_sor: sor {
+				clocks = <&tegra_car TEGRA210_CLK_SOR0>,
+					 <&tegra_car TEGRA210_CLK_SOR1>,
+					 <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_DSIA>,
+					 <&tegra_car TEGRA210_CLK_DSIB>,
+					 <&tegra_car TEGRA210_CLK_DPAUX>,
+					 <&tegra_car TEGRA210_CLK_DPAUX1>,
+					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
+				resets = <&tegra_car TEGRA210_CLK_SOR0>,
+					 <&tegra_car TEGRA210_CLK_SOR1>,
+					 <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_DSIA>,
+					 <&tegra_car TEGRA210_CLK_DSIB>,
+					 <&tegra_car TEGRA210_CLK_DPAUX>,
+					 <&tegra_car TEGRA210_CLK_DPAUX1>,
+					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
+				#power-domain-cells = <0>;
+			};
 		};
 	};
 
-- 
2.1.4
