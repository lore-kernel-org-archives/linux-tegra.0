From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 30/37] ARM: tegra: colibri_t20: iris: add colibri ssp support
Date: Sun,  2 Sep 2018 12:08:59 +0200
Message-ID: <20180902100906.25792-31-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add Colibri SSP aka SPI support using the SPI4 instance.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index dbdf596dd151..b16e04dfa31f 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -164,6 +164,12 @@
 		vbus-supply = <&reg_usbh_vbus>;
 	};
 
+	/* SPI4: Colibri SSP */
+	spi@7000da00 {
+		status = "okay";
+		spi-max-frequency = <25000000>;
+	};
+
 	/* SD/MMC */
 	sdhci@c8000600 {
 		status = "okay";
-- 
2.14.4
