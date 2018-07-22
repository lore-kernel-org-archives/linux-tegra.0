From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 16/28] ARM: tegra: apalis_t30: reorder backlight properties
Date: Sun, 22 Jul 2018 18:49:24 +0200
Message-ID: <20180722164936.20581-17-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder backlight properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 4bb571bffc7f..c4153e8e8b8c 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -193,13 +193,12 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		/* PWM_BKL1 */
-		pwms = <&pwm 0 5000000>;
 		brightness-levels = <255 231 223 207 191 159 127 0>;
 		default-brightness-level = <6>;
 		/* BKL1_ON */
 		enable-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		power-supply = <&reg_3v3>;
+		pwms = <&pwm 0 5000000>; /* BKL1_PWM */
 	};
 
 	gpio-keys {
-- 
2.14.4
