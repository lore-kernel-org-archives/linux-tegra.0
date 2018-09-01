From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 09/34] ARM: tegra: colibri_t30: drop pwmleds
Date: Sat,  1 Sep 2018 10:12:23 +0200
Message-ID: <20180901081248.22639-10-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop pwmleds in favour of using regular PWMs.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 8c492daac165..2aaf87ba0c42 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -165,26 +165,6 @@
 		power-supply = <&reg_3v3>;
 	};
 
-	pwmleds {
-		compatible = "pwm-leds";
-
-		pwmb {
-			label = "PWM<B>";
-			pwms = <&pwm 1 19600>;
-			max-brightness = <255>;
-		};
-		pwmc {
-			label = "PWM<C>";
-			pwms = <&pwm 2 19600>;
-			max-brightness = <255>;
-		};
-		pwmd {
-			label = "PWM<D>";
-			pwms = <&pwm 3 19600>;
-			max-brightness = <255>;
-		};
-	};
-
 	reg_3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "3.3V_SW";
-- 
2.14.4
