From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 03/15] ARM: tegra: apalis-tk1: reorder host1x/hdmi properties
Date: Tue, 24 Jul 2018 12:42:57 +0200
Message-ID: <20180724104309.21741-4-marcel@ziswiler.com>
References: <20180724104309.21741-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724104309.21741-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder Host1x/HDMI properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 4 ++--
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index cb7e53c86408..9ea65723c40c 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -52,11 +52,11 @@
 
 	host1x@50000000 {
 		hdmi@54280000 {
-			pll-supply = <&reg_1v05_avdd_hdmi_pll>;
-			vdd-supply = <&reg_3v3_avdd_hdmi>;
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+			pll-supply = <&reg_1v05_avdd_hdmi_pll>;
+			vdd-supply = <&reg_3v3_avdd_hdmi>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index d73ee974648a..69ca362c1ef3 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -87,11 +87,11 @@
 
 	host1x@50000000 {
 		hdmi@54280000 {
-			pll-supply = <&reg_1v05_avdd_hdmi_pll>;
-			vdd-supply = <&reg_3v3_avdd_hdmi>;
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+			pll-supply = <&reg_1v05_avdd_hdmi_pll>;
+			vdd-supply = <&reg_3v3_avdd_hdmi>;
 		};
 	};
 
-- 
2.14.4
