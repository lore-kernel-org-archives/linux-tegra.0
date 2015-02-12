From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v5 06/11] ARM: tegra: Use pwrseq-simple for the wifi in Nyan
Date: Thu, 12 Feb 2015 09:51:00 +0100
Message-ID: <1423731078-26681-7-git-send-email-tomeu.vizoso@collabora.com>
References: <1423731078-26681-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423731078-26681-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Simon Glass <sjg@chromium.org>, Dylan Reid <dgreid@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Nyan boards have a Marvell 88w8897 wifi card connected through SDIO
that needs the reset line to be asserted before mmc power up and deasserted
afterwards.

This patch also adds references to the power supplies of the card so that
the regulators are enabled when it's probed.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 579b0b9..d3a95f9 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -207,7 +207,6 @@
 					regulator-name = "+1.8V_VDDIO";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
-					regulator-boot-on;
 					regulator-always-on;
 				};
 
@@ -364,12 +363,20 @@
 		status = "okay";
 	};
 
+	sdhci0_pwrseq: sdhci0_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
+	};
+
 	sdhci@0,700b0000 { /* WiFi/BT on this bus */
 		status = "okay";
-		power-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		no-1-8-v;
 		non-removable;
+		mmc-pwrseq = <&sdhci0_pwrseq>;
+		vmmc-supply = <&vdd_3v3_lp0>;
+		vqmmc-supply = <&vddio_1v8>;
 	};
 
 	sdhci@0,700b0400 { /* SD Card on this bus */
-- 
1.9.3
