From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 13/19] ARM: tegra: apalis-tk1: reorder SD card properties
Date: Sat,  1 Sep 2018 15:04:58 +0200
Message-ID: <20180901130504.14318-14-marcel@ziswiler.com>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder SD card properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 4 ++--
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index d9805fc97f5e..08f60636441d 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -180,18 +180,18 @@
 	/* Apalis MMC1 */
 	sdhci@700b0000 {
 		status = "okay";
+		bus-width = <4>;
 		/* MMC1_CD# */
 		cd-gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_LOW>;
-		bus-width = <4>;
 		vqmmc-supply = <&vddio_sdmmc1>;
 	};
 
 	/* Apalis SD1 */
 	sdhci@700b0400 {
 		status = "okay";
+		bus-width = <4>;
 		/* SD1_CD# */
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
-		bus-width = <4>;
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index 89783fe76f65..97c56e82c51d 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -146,18 +146,18 @@
 	/* Apalis MMC1 */
 	sdhci@700b0000 {
 		status = "okay";
+		bus-width = <4>;
 		/* MMC1_CD# */
 		cd-gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_LOW>;
-		bus-width = <4>;
 		vqmmc-supply = <&vddio_sdmmc1>;
 	};
 
 	/* Apalis SD1 */
 	sdhci@700b0400 {
 		status = "okay";
+		bus-width = <4>;
 		/* SD1_CD# */
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
-		bus-width = <4>;
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
-- 
2.14.4
