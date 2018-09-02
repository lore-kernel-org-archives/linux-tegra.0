From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 07/37] ARM: tegra: colibri_t20: iris: use no-1-8-v
Date: Sun,  2 Sep 2018 12:08:36 +0200
Message-ID: <20180902100906.25792-8-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Use no-1-8-v property rather than vmmc/vqmmc supplies and drop now
obsolete and anyway non-existent vcc_sd.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index cc9e372a3b58..3d430fa93e8c 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -101,8 +101,7 @@
 	sdhci@c8000600 {
 		status = "okay";
 		bus-width = <4>;
-		vmmc-supply = <&vcc_sd_reg>;
-		vqmmc-supply = <&vcc_sd_reg>;
+		no-1-8-v;
 	};
 
 	regulators {
@@ -116,15 +115,5 @@
 			regulator-always-on;
 			gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
 		};
-
-		vcc_sd_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vcc_sd";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-boot-on;
-			regulator-always-on;
-		};
 	};
 };
-- 
2.14.4
