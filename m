From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 28/34] ARM: tegra: apalis_t30: drop obsolete spidev nodes
Date: Fri, 31 Aug 2018 18:38:10 +0200
Message-ID: <20180831163817.23970-29-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
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

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 97e2f1822a94..bbde98fd9712 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -111,24 +111,12 @@
 	spi@7000d400 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-
-		spidev0: spidev@1 {
-			compatible = "spidev";
-			reg = <1>;
-			spi-max-frequency = <25000000>;
-		};
 	};
 
 	/* SPI5: Apalis SPI2 */
 	spi@7000dc00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-
-		spidev1: spidev@2 {
-			compatible = "spidev";
-			reg = <2>;
-			spi-max-frequency = <25000000>;
-		};
 	};
 
 	hda@70030000 {
-- 
2.14.4
