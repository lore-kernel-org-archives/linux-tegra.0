From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 28/34] ARM: tegra: colibri_t30: rename hdmiddc to hdmi_ddc
Date: Sat,  1 Sep 2018 10:12:42 +0200
Message-ID: <20180901081248.22639-29-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename hdmiddc to hdmi_ddc to be more in-line with other device trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index c08e09908578..49771ea379ed 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -71,7 +71,7 @@
 	};
 
 	/* DDC_CLOCK/DATA on X3 pin 15/16 (e.g. display EDID) */
-	hdmiddc: i2c@7000c700 {
+	i2c@7000c700 {
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index f4aee43402d1..03047d2bba9d 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -12,7 +12,7 @@
 
 	host1x@50000000 {
 		hdmi@54280000 {
-			nvidia,ddc-i2c-bus = <&hdmiddc>;
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 			pll-supply = <&reg_1v8_avdd_hdmi_pll>;
@@ -707,7 +707,7 @@
 		compatible = "nvidia,tegra30-hsuart";
 	};
 
-	hdmiddc: i2c@7000c700 {
+	hdmi_ddc: i2c@7000c700 {
 		clock-frequency = <10000>;
 	};
 
-- 
2.14.4
