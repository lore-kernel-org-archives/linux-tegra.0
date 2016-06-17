From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 12/13] arm64: tegra: Add sor-safe clock to DPAUX binding
Date: Fri, 17 Jun 2016 13:03:46 +0100
Message-ID: <1466165027-17917-13-git-send-email-jonathanh@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Populate the 'sor-safe' clock for DPAUX devices on Tegra210 that require
this clock for operation. Update the compatability string for the DPAUX
instance at address 0x545c0000 to be "nvidia,tegra210-dpaux" to ensure
that the 'sor-safe' clock is enabled for this device.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 94f780b43037..78bcc87b627d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -30,8 +30,9 @@
 			reg = <0x0 0x54040000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA210_CLK_DPAUX1>,
-				 <&tegra_car TEGRA210_CLK_PLL_DP>;
-			clock-names = "dpaux", "parent";
+				 <&tegra_car TEGRA210_CLK_PLL_DP>,
+				 <&tegra_car TEGRA210_CLK_SOR_SAFE>;
+			clock-names = "dpaux", "parent", "sor-safe";
 			resets = <&tegra_car 207>;
 			reset-names = "dpaux";
 			power-domains = <&pd_sor>;
@@ -175,12 +176,13 @@
 		};
 
 		dpaux: dpaux@545c0000 {
-			compatible = "nvidia,tegra124-dpaux";
+			compatible = "nvidia,tegra210-dpaux";
 			reg = <0x0 0x545c0000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA210_CLK_DPAUX>,
-				 <&tegra_car TEGRA210_CLK_PLL_DP>;
-			clock-names = "dpaux", "parent";
+				 <&tegra_car TEGRA210_CLK_PLL_DP>,
+				 <&tegra_car TEGRA210_CLK_SOR_SAFE>;
+			clock-names = "dpaux", "parent", "sor-safe";
 			resets = <&tegra_car 181>;
 			reset-names = "dpaux";
 			power-domains = <&pd_sor>;
-- 
2.1.4

