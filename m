From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Fix Jetson Nano GPU regulator
Date: Thu, 20 Jun 2019 09:17:02 +0100
Message-ID: <20190620081702.17209-4-jonathanh@nvidia.com>
References: <20190620081702.17209-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190620081702.17209-1-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There are a few issues with the GPU regulator defined for Jetson Nano
which are:

1. The GPU regulator is a PWM based regulator and not a fixed voltage
   regulator.
2. The output voltages for the GPU regulator are not correct.
3. The regulator enable ramp delay is too short for the regulator and
   needs to be increased. 2ms should be sufficient.
4. This is the same regulator used on Jetson TX1 and so make the ramp
   delay and settling time the same as Jetson TX1.

Cc: stable@vger.kernel.org
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 63df72eecf21..9d17ec707bce 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -88,6 +88,10 @@
 		status = "okay";
 	};
 
+	pwm@7000a000 {
+		status = "okay";
+	};
+
 	i2c@7000c500 {
 		status = "okay";
 		clock-frequency = <100000>;
@@ -664,17 +668,16 @@
 		};
 
 		vdd_gpu: regulator@6 {
-			compatible = "regulator-fixed";
+			compatible = "pwm-regulator";
 			reg = <6>;
-
+			pwms = <&pwm 1 4880>;
 			regulator-name = "VDD_GPU";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-enable-ramp-delay = <250>;
-
-			gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-
+			regulator-min-microvolt = <710000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-ramp-delay = <80>;
+			regulator-enable-ramp-delay = <2000>;
+			regulator-settling-time-us = <160>;
+			enable-gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 			vin-supply = <&vdd_5v0_sys>;
 		};
 	};
-- 
2.17.1
