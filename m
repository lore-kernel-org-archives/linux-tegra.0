From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 17/34] ARM: tegra: colibri_t30: get rid of fake clocks simple bus
Date: Sat,  1 Sep 2018 10:12:31 +0200
Message-ID: <20180901081248.22639-18-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Get rid of the fake clocks simple bus and use node names as per the
actual schematics.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Get rid of fake clocks simple bus as suggested by Rob.

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 12 ++++--------
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 15 ++++-----------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 2aaf87ba0c42..bcdaeedcbea2 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -133,14 +133,10 @@
 		pwms = <&pwm 0 5000000>; /* PWM<A> */
 	};
 
-	clocks {
-		clk16m: clk@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			#clock-cells = <0>;
-			clock-frequency = <16000000>;
-			clock-output-names = "clk16m";
-		};
+	clk16m: osc3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <16000000>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 95b6444a6f05..4fcdc93ae687 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -954,17 +954,10 @@
 		vbus-supply = <&reg_lan_v_bus>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clk@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: xtal1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
 	};
 
 	reg_1v8_avdd_hdmi_pll: regulator-1v8-avdd-hdmi-pll {
-- 
2.14.4
