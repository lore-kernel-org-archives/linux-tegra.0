From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 2/9] ARM: tegra: apalis-tk1/colibri_t20/t30: eval/iris: fix regulator gpio enable
Date: Tue, 16 Oct 2018 12:47:23 +0200
Message-ID: <20181016104730.4598-3-marcel@ziswiler.com>
References: <20181016104730.4598-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016104730.4598-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Anything other than the default active-low would require the separate
property enable-active-high to be set. This gets rid of the following
warning during boot:

 regulator-usbh-vbus GPIO handle specifies active low - ignored

resp.:

 regulator-1v05-avdd-hdmi-pll GPIO handle specifies active low - ignored

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None
Changes in v1: None

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi   | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi        | 2 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts | 2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts    | 2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 367eb8c86098..73a8e117a9b9 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1948,7 +1948,7 @@
 		regulator-name = "+V1.05_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_1v05_vdd>;
 	};
 
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 13c93cd507d8..3e3b347afe56 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1978,7 +1978,7 @@
 		regulator-name = "+V1.05_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_1v05_vdd>;
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
index 37ad508b61d9..f1a85d930e61 100644
--- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
@@ -256,7 +256,7 @@
 		regulator-name = "VCC_USB[1-4]";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index af4740847769..e1e5ec5253fd 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -238,7 +238,7 @@
 		regulator-name = "VCC_USB1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 8e106e784dce..7e6bf4cdf322 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -192,7 +192,7 @@
 		regulator-name = "VCC_USB[1-4]";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_5v0>;
 	};
 };
-- 
2.14.4
