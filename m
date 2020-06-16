From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 49/73] arm64: tegra: Rename sdhci nodes to mmc
Date: Tue, 16 Jun 2020 15:52:14 +0200
Message-ID: <20200616135238.3001888-50-thierry.reding@gmail.com>
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

The new json-schema based validation tools require SD/MMC controller
nodes to be named mmc. Rename all references to them.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  6 +++---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  8 ++++----
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 10 +++++-----
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  8 ++++----
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  8 ++++----
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  6 +++---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  8 ++++----
 15 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index d0d03cc30197..e6fe62e5c234 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -894,12 +894,12 @@ pmc@7000e400 {
 	};
 
 	/* WIFI/BT module */
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "disabled";
 	};
 
 	/* external SD/MMC */
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
@@ -909,7 +909,7 @@ sdhci@700b0400 {
 	};
 
 	/* EMMC 4.51 */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 4fc34c5ec2dc..8558ad38b69c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -691,7 +691,7 @@ utmi-2 {
 		};
 	};
 
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -702,7 +702,7 @@ sdhci@700b0000 {
 		status = "disabled";
 	};
 
-	sdhci@700b0200 {
+	mmc@700b0200 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -713,7 +713,7 @@ sdhci@700b0200 {
 		status = "disabled";
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -724,7 +724,7 @@ sdhci@700b0400 {
 		status = "disabled";
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index f35b0ba29cb5..37ec15a14c77 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -103,7 +103,7 @@ exp2: gpio@77 {
 	};
 
 	/* SDMMC1 (SD/MMC) */
-	sdhci@3400000 {
+	mmc@3400000 {
 		status = "okay";
 
 		vmmc-supply = <&vdd_sd>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 7b5b9bb332cf..d1ed7eee949a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -9,8 +9,8 @@ / {
 
 	aliases {
 		ethernet0 = "/ethernet@2490000";
-		sdhci0 = "/sdhci@3460000";
-		sdhci1 = "/sdhci@3400000";
+		mmc0 = "/mmc@3460000";
+		mmc1 = "/mmc@3400000";
 		serial0 = &uarta;
 		i2c0 = "/bpmp/i2c";
 		i2c1 = "/i2c@3160000";
@@ -135,7 +135,7 @@ i2c@31e0000 {
 	};
 
 	/* SDMMC1 (SD/MMC) */
-	sdhci@3400000 {
+	mmc@3400000 {
 		cd-gpios = <&gpio TEGRA186_MAIN_GPIO(P, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA186_MAIN_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
 
@@ -143,12 +143,12 @@ sdhci@3400000 {
 	};
 
 	/* SDMMC3 (SDIO) */
-	sdhci@3440000 {
+	mmc@3440000 {
 		status = "okay";
 	};
 
 	/* SDMMC4 (eMMC) */
-	sdhci@3460000 {
+	mmc@3460000 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index e86b682f8645..927c646620cb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -333,7 +333,7 @@ gen9_i2c: i2c@31e0000 {
 		status = "disabled";
 	};
 
-	sdmmc1: sdhci@3400000 {
+	sdmmc1: mmc@3400000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03400000 0x0 0x10000>;
 		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
@@ -362,7 +362,7 @@ sdmmc1: sdhci@3400000 {
 		status = "disabled";
 	};
 
-	sdmmc2: sdhci@3420000 {
+	sdmmc2: mmc@3420000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03420000 0x0 0x10000>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
@@ -386,7 +386,7 @@ sdmmc2: sdhci@3420000 {
 		status = "disabled";
 	};
 
-	sdmmc3: sdhci@3440000 {
+	sdmmc3: mmc@3440000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03440000 0x0 0x10000>;
 		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
@@ -412,7 +412,7 @@ sdmmc3: sdhci@3440000 {
 		status = "disabled";
 	};
 
-	sdmmc4: sdhci@3460000 {
+	sdmmc4: mmc@3460000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03460000 0x0 0x10000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index f3781e86f321..442e333ac13f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -9,8 +9,8 @@ / {
 
 	aliases {
 		ethernet0 = "/cbb@0/ethernet@2490000";
-		sdhci0 = "/cbb@0/sdhci@3460000";
-		sdhci1 = "/cbb@0/sdhci@3400000";
+		mmc0 = "/cbb@0/mmc@3460000";
+		mmc1 = "/cbb@0/mmc@3400000";
 		serial0 = &tcu;
 		i2c0 = "/bpmp/i2c";
 		i2c1 = "/cbb@0/i2c@3160000";
@@ -58,12 +58,12 @@ serial@3110000 {
 		};
 
 		/* SDMMC1 (SD/MMC) */
-		sdhci@3400000 {
+		mmc@3400000 {
 			cd-gpios = <&gpio TEGRA194_MAIN_GPIO(A, 0) GPIO_ACTIVE_LOW>;
 		};
 
 		/* SDMMC4 (eMMC) */
-		sdhci@3460000 {
+		mmc@3460000 {
 			status = "okay";
 			bus-width = <8>;
 			non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 9a7d136b467f..0f9868b6fd6b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -28,7 +28,7 @@ ddc: i2c@31c0000 {
 		};
 
 		/* SDMMC1 (SD/MMC) */
-		sdhci@3400000 {
+		mmc@3400000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index f056158a2634..d5246c75b782 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -456,7 +456,7 @@ pwm8: pwm@32f0000 {
 			#pwm-cells = <2>;
 		};
 
-		sdmmc1: sdhci@3400000 {
+		sdmmc1: mmc@3400000 {
 			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03400000 0x10000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
@@ -481,7 +481,7 @@ sdmmc1: sdhci@3400000 {
 			status = "disabled";
 		};
 
-		sdmmc3: sdhci@3440000 {
+		sdmmc3: mmc@3440000 {
 			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03440000 0x10000>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
@@ -507,7 +507,7 @@ sdmmc3: sdhci@3440000 {
 			status = "disabled";
 		};
 
-		sdmmc4: sdhci@3460000 {
+		sdmmc4: mmc@3460000 {
 			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03460000 0x10000>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 751775357d51..251c6099482a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -293,7 +293,7 @@ pmc@7000e400 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index 9ace2d9ea085..f9158dc943f9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -34,7 +34,7 @@ pmc@7000e400 {
 	};
 
 	/* eMMC */
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index f72afdf547ee..fb0db05647c4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1500,7 +1500,7 @@ usb3-1 {
 	};
 
 	/* MMC/SD */
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 615a8f5a6cf2..579d5b8a757d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1580,7 +1580,7 @@ pmc@7000e400 {
 		status = "okay";
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		bus-width = <8>;
 		non-removable;
 		status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index e6f4a36efa73..4a354f5293fc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -535,7 +535,7 @@ usb3-0 {
 		};
 	};
 
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 
@@ -553,7 +553,7 @@ usb@700d0000 {
 		hvdd-usb-supply = <&vdd_1v8>;
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		status = "okay";
 		bus-width = <4>;
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 0b5b6ffbff43..d32053934f3c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1693,7 +1693,7 @@ usb3-0 {
 		};
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		bus-width = <8>;
 		non-removable;
 		status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 41ffa0531cd8..1f7dc518b394 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1175,7 +1175,7 @@ usb3-3 {
 		};
 	};
 
-	sdhci@700b0000 {
+	mmc@700b0000 {
 		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -1203,7 +1203,7 @@ sdhci@700b0000 {
 		status = "disabled";
 	};
 
-	sdhci@700b0200 {
+	mmc@700b0200 {
 		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -1220,7 +1220,7 @@ sdhci@700b0200 {
 		status = "disabled";
 	};
 
-	sdhci@700b0400 {
+	mmc@700b0400 {
 		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -1243,7 +1243,7 @@ sdhci@700b0400 {
 		status = "disabled";
 	};
 
-	sdhci@700b0600 {
+	mmc@700b0600 {
 		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.24.1
