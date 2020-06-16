From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 13/73] ARM: tegra: Rename sdhci nodes to mmc
Date: Tue, 16 Jun 2020 15:51:38 +0200
Message-ID: <20200616135238.3001888-14-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Philippe Schenker <philippe.schenker-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The new json-schema based validation tools require SD/MMC controller
nodes to be named mmc. Rename all references to them.

Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: Philippe Schenker <philippe.schenker-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts          | 4 ++--
 arch/arm/boot/dts/tegra114-roth.dts             | 4 ++--
 arch/arm/boot/dts/tegra114-tn7.dts              | 2 +-
 arch/arm/boot/dts/tegra114.dtsi                 | 8 ++++----
 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 4 ++--
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 4 ++--
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts       | 4 ++--
 arch/arm/boot/dts/tegra124-nyan-big.dts         | 2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi            | 6 +++---
 arch/arm/boot/dts/tegra124-venice2.dts          | 4 ++--
 arch/arm/boot/dts/tegra124.dtsi                 | 8 ++++----
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts   | 2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts      | 2 +-
 arch/arm/boot/dts/tegra20-harmony.dts           | 4 ++--
 arch/arm/boot/dts/tegra20-paz00.dts             | 4 ++--
 arch/arm/boot/dts/tegra20-seaboard.dts          | 6 +++---
 arch/arm/boot/dts/tegra20-ventana.dts           | 6 +++---
 arch/arm/boot/dts/tegra20.dtsi                  | 8 ++++----
 arch/arm/boot/dts/tegra30-apalis-eval.dts       | 4 ++--
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts  | 4 ++--
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi      | 2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi           | 2 +-
 arch/arm/boot/dts/tegra30-beaver.dts            | 4 ++--
 arch/arm/boot/dts/tegra30-cardhu.dtsi           | 4 ++--
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts   | 2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi          | 2 +-
 arch/arm/boot/dts/tegra30.dtsi                  | 8 ++++----
 29 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 584db54cd750..c04162ddec3c 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1108,14 +1108,14 @@ i2s@70080400 {
 		};
 	};
 
-	sdhci@78000400 {
+	mmc@78000400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		status = "okay";
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		bus-width = <8>;
 		status = "okay";
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 7378b5d6f2fa..07960171fabe 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -962,7 +962,7 @@ pmc@7000e400 {
 	};
 
 	/* SD card */
-	sdhci@78000400 {
+	mmc@78000400 {
 		status = "okay";
 		bus-width = <4>;
 		vqmmc-supply = <&vddio_sdmmc3>;
@@ -971,7 +971,7 @@ sdhci@78000400 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 0e520ae1109d..745d234b105b 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -242,7 +242,7 @@ pmc@7000e400 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 23df7a5f37d3..69e0e3eeffb4 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -644,7 +644,7 @@ mipi: mipi@700e3000 {
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
-	sdhci@78000000 {
+	mmc@78000000 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -655,7 +655,7 @@ sdhci@78000000 {
 		status = "disabled";
 	};
 
-	sdhci@78000200 {
+	mmc@78000200 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -666,7 +666,7 @@ sdhci@78000200 {
 		status = "disabled";
 	};
 
-	sdhci@78000400 {
+	mmc@78000400 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -677,7 +677,7 @@ sdhci@78000400 {
 		status = "disabled";
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index ceb3f6388c7d..28c29b6813a7 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -130,7 +130,7 @@ usb@70090000 {
 	};
 
 	/* Apalis MMC1 */
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 		/* MMC1_CD# */
@@ -139,7 +139,7 @@ sdhci@700b0000 {
 	};
 
 	/* Apalis SD1 */
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index 826b776fbe6f..f3afde410615 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -132,7 +132,7 @@ usb@70090000 {
 	};
 
 	/* Apalis MMC1 */
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 		/* MMC1_CD# */
@@ -141,7 +141,7 @@ sdhci@700b0000 {
 	};
 
 	/* Apalis SD1 */
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 1cc080fd062e..3fdc6ff32b0c 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1909,7 +1909,7 @@ usb3-1 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index f2b243d98c7c..29ceeba1e7b1 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1901,7 +1901,7 @@ usb3-1 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index e97943871fd8..289bf6e99041 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1797,7 +1797,7 @@ usb3-0 {
 	};
 
 	/* SD card */
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
@@ -1807,7 +1807,7 @@ sdhci@700b0400 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index d97791b98958..4d14dec21af6 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -20,7 +20,7 @@ panel: panel {
 		ddc-i2c-bus = <&dpaux>;
 	};
 
-	sdhci@700b0400 { /* SD Card on this bus */
+	mmc@700b0400 { /* SD Card on this bus */
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
 	};
 
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index b3b5c12cbda9..41a3db6649c5 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -491,7 +491,7 @@ sdhci0_pwrseq: sdhci0_pwrseq {
 		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
 	};
 
-	sdhci@700b0000 { /* WiFi/BT on this bus */
+	mmc@700b0000 { /* WiFi/BT on this bus */
 		status = "okay";
 		bus-width = <4>;
 		no-1-8-v;
@@ -502,7 +502,7 @@ sdhci@700b0000 { /* WiFi/BT on this bus */
 		keep-power-in-suspend;
 	};
 
-	sdhci@700b0400 { /* SD Card on this bus */
+	mmc@700b0400 { /* SD Card on this bus */
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
@@ -511,7 +511,7 @@ sdhci@700b0400 { /* SD Card on this bus */
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
-	sdhci@700b0600 { /* eMMC on this bus */
+	mmc@700b0600 { /* eMMC on this bus */
 		status = "okay";
 		bus-width = <8>;
 		no-1-8-v;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index effdb303c7f7..584a3b2125cd 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -998,7 +998,7 @@ usb3-1 {
 		};
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
@@ -1007,7 +1007,7 @@ sdhci@700b0400 {
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 2c992e8e3594..76c1ef923213 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -833,7 +833,7 @@ usb3-1 {
 		};
 	};
 
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -843,7 +843,7 @@ sdhci@700b0000 {
 		status = "disabled";
 	};
 
-	sdhci@700b0200 {
+	mmc@700b0200 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -853,7 +853,7 @@ sdhci@700b0200 {
 		status = "disabled";
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -863,7 +863,7 @@ sdhci@700b0400 {
 		status = "disabled";
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
index 37ad508b61d9..a05fb3853da8 100644
--- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
@@ -183,7 +183,7 @@ can@0 {
 	};
 
 	/* SD/MMC */
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <4>;
 		cd-gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>; /* MMCD */
diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index af4740847769..425494b9ed54 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -171,7 +171,7 @@ spi@7000da00 {
 	};
 
 	/* SD/MMC */
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <4>;
 		cd-gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>; /* MMCD */
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index b051d75d4642..86494cb4d5a1 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -613,7 +613,7 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000200 {
+	mmc@c8000200 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
@@ -621,7 +621,7 @@ sdhci@c8000200 {
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 2a0e5754f50f..91b6bb82e960 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -543,7 +543,7 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
@@ -551,7 +551,7 @@ sdhci@c8000000 {
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index 9a1ab4bd43e0..f1baf16c5010 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -760,14 +760,14 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		status = "okay";
 		power-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		keep-power-in-suspend;
 	};
 
-	sdhci@c8000400 {
+	mmc@c8000400 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
@@ -775,7 +775,7 @@ sdhci@c8000400 {
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index ccc24674be03..b158771ac0b7 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -554,14 +554,14 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		status = "okay";
 		power-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		keep-power-in-suspend;
 	};
 
-	sdhci@c8000400 {
+	mmc@c8000400 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
@@ -569,7 +569,7 @@ sdhci@c8000400 {
 		bus-width = <4>;
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 8b6909839f59..9e71ed84bf28 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -805,7 +805,7 @@ phy3: usb-phy@c5008000 {
 		status = "disabled";
 	};
 
-	sdhci@c8000000 {
+	mmc@c8000000 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -815,7 +815,7 @@ sdhci@c8000000 {
 		status = "disabled";
 	};
 
-	sdhci@c8000200 {
+	mmc@c8000200 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -825,7 +825,7 @@ sdhci@c8000200 {
 		status = "disabled";
 	};
 
-	sdhci@c8000400 {
+	mmc@c8000400 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -835,7 +835,7 @@ sdhci@c8000400 {
 		status = "disabled";
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index b39c26806bf2..9f653ef41da4 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -120,7 +120,7 @@ spi@7000dc00 {
 	};
 
 	/* Apalis SD1 */
-	sdhci@78000000 {
+	mmc@78000000 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
@@ -129,7 +129,7 @@ sdhci@78000000 {
 	};
 
 	/* Apalis MMC1 */
-	sdhci@78000400 {
+	mmc@78000400 {
 		status = "okay";
 		bus-width = <8>;
 		/* MMC1_CD# */
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
index e29dca92ba0a..dc633e529822 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
@@ -121,7 +121,7 @@ spi@7000dc00 {
 	};
 
 	/* Apalis SD1 */
-	sdhci@78000000 {
+	mmc@78000000 {
 		status = "okay";
 		bus-width = <4>;
 		/* SD1_CD# */
@@ -130,7 +130,7 @@ sdhci@78000000 {
 	};
 
 	/* Apalis MMC1 */
-	sdhci@78000400 {
+	mmc@78000400 {
 		status = "okay";
 		bus-width = <8>;
 		/* MMC1_CD# */
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 387b17458e22..9421063cd86c 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -1112,7 +1112,7 @@ i2s@70080500 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 6648506f3aa4..d13f6b0c7c0c 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1094,7 +1094,7 @@ i2s@70080500 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 3211c61f956c..e0624b74fb50 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1922,7 +1922,7 @@ i2s@70080400 {
 		};
 	};
 
-	sdhci@78000000 {
+	mmc@78000000 {
 		status = "okay";
 		vqmmc-supply = <&ldo5_reg>;
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
@@ -1931,7 +1931,7 @@ sdhci@78000000 {
 		bus-width = <4>;
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index c8dc3b6ab2f6..dab9989fa760 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -384,7 +384,7 @@ i2s@70080400 {
 		};
 	};
 
-	sdhci@78000000 {
+	mmc@78000000 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(T, 3) GPIO_ACTIVE_HIGH>;
@@ -392,7 +392,7 @@ sdhci@78000000 {
 		bus-width = <4>;
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 8e106e784dce..7d4a6ca4936a 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -98,7 +98,7 @@ can@0 {
 	};
 
 	/* SD/MMC */
-	sdhci@78000200 {
+	mmc@78000200 {
 		status = "okay";
 		bus-width = <4>;
 		cd-gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>; /* MMCD */
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index adba554381c7..a7bfe26f038d 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -933,7 +933,7 @@ i2s@70080500 {
 	};
 
 	/* eMMC */
-	sdhci@78000600 {
+	mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 23fedb76e5ae..536cc5629440 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -851,7 +851,7 @@ tegra_i2s4: i2s@70080700 {
 		};
 	};
 
-	sdhci@78000000 {
+	mmc@78000000 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -861,7 +861,7 @@ sdhci@78000000 {
 		status = "disabled";
 	};
 
-	sdhci@78000200 {
+	mmc@78000200 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -871,7 +871,7 @@ sdhci@78000200 {
 		status = "disabled";
 	};
 
-	sdhci@78000400 {
+	mmc@78000400 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -881,7 +881,7 @@ sdhci@78000400 {
 		status = "disabled";
 	};
 
-	sdhci@78000600 {
+	mmc@78000600 {
 		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.24.1
