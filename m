From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 25/28] ARM: tegra: apalis_t30: rename clk to clock
Date: Sun, 22 Jul 2018 18:49:33 +0200
Message-ID: <20180722164936.20581-26-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename clk to clock.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 5f5a287eb535..ee6750247c57 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1094,14 +1094,14 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		clk32k_in: clk@0 {
+		clk32k_in: clock@0 {
 			compatible = "fixed-clock";
 			reg = <0>;
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
 		};
 
-		clk16m: clk@1 {
+		clk16m: clock@1 {
 			compatible = "fixed-clock";
 			reg = <1>;
 			#clock-cells = <0>;
-- 
2.14.4
