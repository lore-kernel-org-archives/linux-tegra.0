From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 15/19] ARM: tegra: apalis-tk1: drop obsolete spidev nodes
Date: Sat,  1 Sep 2018 15:05:00 +0200
Message-ID: <20180901130504.14318-16-marcel@ziswiler.com>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop obsolete spidev device tree nodes as nowadays one should do this
by binding the spidev driver to specific instances/chip selects at
runtime.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 12 ------------
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 12 ------------
 2 files changed, 24 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index 08f60636441d..2710eb79b63e 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -142,24 +142,12 @@
 	spi@7000d400 {
 		status = "okay";
 		spi-max-frequency = <50000000>;
-
-		spidev0: spidev@0 {
-			compatible = "spidev";
-			reg = <0>;
-			spi-max-frequency = <50000000>;
-		};
 	};
 
 	/* SPI4: Apalis SPI2 */
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <50000000>;
-
-		spidev1: spidev@0 {
-			compatible = "spidev";
-			reg = <0>;
-			spi-max-frequency = <50000000>;
-		};
 	};
 
 	/* Apalis Serial ATA */
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index 97c56e82c51d..574780250031 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -108,24 +108,12 @@
 	spi@7000d400 {
 		status = "okay";
 		spi-max-frequency = <50000000>;
-
-		spidev0: spidev@0 {
-			compatible = "spidev";
-			reg = <0>;
-			spi-max-frequency = <50000000>;
-		};
 	};
 
 	/* SPI4: Apalis SPI2 */
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <50000000>;
-
-		spidev1: spidev@0 {
-			compatible = "spidev";
-			reg = <0>;
-			spi-max-frequency = <50000000>;
-		};
 	};
 
 	/* Apalis Serial ATA */
-- 
2.14.4
