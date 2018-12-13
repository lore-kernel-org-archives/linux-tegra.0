From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1] arm64: tegra: SDMMC Clock change
Date: Thu, 13 Dec 2018 13:14:30 -0800
Message-ID: <1544735670-14246-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mperttunen@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

SDMMC Clock source change for supporting max frequency of
200Mhz for Tegra194

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index c2091bb16546..e61f86366cb1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -321,6 +321,10 @@
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC4>;
 			clock-names = "sdhci";
+			assigned-clocks = <&bpmp TEGRA194_CLK_SDMMC4>,
+					<&bpmp TEGRA194_CLK_PLLC4>;
+			assigned-clock-parents =
+					  <&bpmp TEGRA194_CLK_PLLC4>;
 			resets = <&bpmp TEGRA194_RESET_SDMMC4>;
 			reset-names = "sdhci";
 			status = "disabled";
-- 
2.7.4
