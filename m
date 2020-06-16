From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 46/73] arm64: tegra: Remove parent clock from display controllers
Date: Tue, 16 Jun 2020 15:52:11 +0200
Message-ID: <20200616135238.3001888-47-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The display controller's parent clock depends on the output that's
consuming data from the display controller, so it needs to be specified
as the parent of the corresponding output. The device tree bindings do
specify this, so just correct the existing device trees that get this
wrong.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 10 ++++------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 76e1a6451e83..4fc34c5ec2dc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -104,9 +104,8 @@ dc@54200000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA124_CLK_DISP1>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA124_CLK_DISP1>;
+			clock-names = "dc";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
@@ -119,9 +118,8 @@ dc@54240000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54240000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA124_CLK_DISP2>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA124_CLK_DISP2>;
+			clock-names = "dc";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 0586722df64b..41ffa0531cd8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -187,9 +187,8 @@ dc@54200000 {
 			compatible = "nvidia,tegra210-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA210_CLK_DISP1>,
-				 <&tegra_car TEGRA210_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA210_CLK_DISP1>;
+			clock-names = "dc";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
@@ -202,9 +201,8 @@ dc@54240000 {
 			compatible = "nvidia,tegra210-dc";
 			reg = <0x0 0x54240000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA210_CLK_DISP2>,
-				 <&tegra_car TEGRA210_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA210_CLK_DISP2>;
+			clock-names = "dc";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
-- 
2.24.1
