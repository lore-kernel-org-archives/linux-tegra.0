From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 18/26] ARM: tegra: colibri_t30: rename clk to clock
Date: Mon, 23 Jul 2018 14:36:49 +0200
Message-ID: <20180723123658.980-19-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename clk to clock.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 621cd15cdfd1..75373bf17b20 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -136,7 +136,7 @@
 	};
 
 	clocks {
-		clk16m: clk@1 {
+		clk16m: clock@1 {
 			compatible = "fixed-clock";
 			reg = <1>;
 			#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 14ce77ebf4a5..27e81ffb35c3 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -959,7 +959,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		clk32k_in: clk@0 {
+		clk32k_in: clock@0 {
 			compatible = "fixed-clock";
 			reg = <0>;
 			#clock-cells = <0>;
-- 
2.14.4
