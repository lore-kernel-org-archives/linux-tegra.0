From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 17/28] ARM: tegra: apalis_t30: drop pwmleds
Date: Sun, 22 Jul 2018 18:49:25 +0200
Message-ID: <20180722164936.20581-18-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop pwmleds in favour of using regular PWMs.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index c4153e8e8b8c..6978e3626fae 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -223,28 +223,6 @@
 		power-supply = <&reg_3v3>;
 	};
 
-	pwmleds {
-		compatible = "pwm-leds";
-
-		pwm1 {
-			label = "PWM1";
-			pwms = <&pwm 3 19600>;
-			max-brightness = <255>;
-		};
-
-		pwm2 {
-			label = "PWM2";
-			pwms = <&pwm 2 19600>;
-			max-brightness = <255>;
-		};
-
-		pwm3 {
-			label = "PWM3";
-			pwms = <&pwm 1 19600>;
-			max-brightness = <255>;
-		};
-	};
-
 	reg_3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "3.3V_SW";
-- 
2.14.4
