From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 09/26] ARM: tegra: colibri_t30: reorder backlight properties
Date: Mon, 23 Jul 2018 14:36:40 +0200
Message-ID: <20180723123658.980-10-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder backlight properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 70d3a89825a4..a3c607d07a1b 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -127,13 +127,12 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		/* PWM<A> */
-		pwms = <&pwm 0 5000000>;
 		brightness-levels = <255 128 64 32 16 8 4 0>;
 		default-brightness-level = <6>;
 		/* BL_ON */
 		enable-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		power-supply = <&reg_3v3>;
+		pwms = <&pwm 0 5000000>; /* PWM<A> */
 	};
 
 	clocks {
-- 
2.14.4
