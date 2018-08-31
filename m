From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 30/34] ARM: tegra: apalis_t30: rename hdmiddc to hdmi_ddc
Date: Fri, 31 Aug 2018 18:38:12 +0200
Message-ID: <20180831163817.23970-31-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
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

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 9d9dda6c0246..9381f65a9bf5 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -103,7 +103,7 @@
 	};
 
 	/* DDC: I2C2_SDA/SCL on MXM3 pin 205/207 (e.g. display EDID) */
-	hdmiddc: i2c@7000c700 {
+	i2c@7000c700 {
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index e7793f3b19d2..f15954995231 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -46,7 +46,7 @@
 
 	host1x@50000000 {
 		hdmi@54280000 {
-			nvidia,ddc-i2c-bus = <&hdmiddc>;
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 			pll-supply = <&reg_1v8_avdd_hdmi_pll>;
@@ -831,7 +831,7 @@
 		compatible = "nvidia,tegra30-hsuart";
 	};
 
-	hdmiddc: i2c@7000c700 {
+	hdmi_ddc: i2c@7000c700 {
 		clock-frequency = <10000>;
 	};
 
-- 
2.14.4
