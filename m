From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 32/37] ARM: tegra: colibri_t20: rename i2c_ddc to hdmi_ddc
Date: Sun,  2 Sep 2018 12:09:01 +0200
Message-ID: <20180902100906.25792-33-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename i2c_ddc to hdmi_ddc to be more in-line with other device trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra20-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index b4d429f672da..36463fb3c0b3 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -19,7 +19,7 @@
 
 	host1x@50000000 {
 		hdmi@54280000 {
-			nvidia,ddc-i2c-bus = <&i2c_ddc>;
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 			pll-supply = <&reg_1v8_avdd_hdmi_pll>;
@@ -459,7 +459,7 @@
 	};
 
 	/* DDC_SCL/SDA on X3 pin 15/16 (e.g. display EDID) */
-	i2c_ddc: i2c@7000c400 {
+	hdmi_ddc: i2c@7000c400 {
 		clock-frequency = <10000>;
 	};
 
-- 
2.14.4
