From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 26/31] ARM: tegra: colibri_t20: annotate/move sd card detect
Date: Wed, 29 Aug 2018 10:14:02 +0200
Message-ID: <20180829081407.11304-27-marcel@ziswiler.com>
References: <20180829081407.11304-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829081407.11304-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate the SD card, its detect pin and move the SD card detect GPIO
definition from the module to the carrier board more in-line with our
other device trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 2 ++
 arch/arm/boot/dts/tegra20-colibri.dtsi     | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 91b3404e1b3d..955d1e1ad8e0 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -163,9 +163,11 @@
 		vbus-supply = <&reg_usbh_vbus>;
 	};
 
+	/* SD/MMC */
 	sdhci@c8000600 {
 		status = "okay";
 		bus-width = <4>;
+		cd-gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>; /* MMCD */
 		no-1-8-v;
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 35eec7ade70d..057147565b1e 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -698,10 +698,6 @@
 		vbus-supply = <&reg_lan_v_bus>;
 	};
 
-	sdhci@c8000600 {
-		cd-gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>;
-	};
-
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.14.4
