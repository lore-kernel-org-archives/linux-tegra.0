From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: [PATCH v3 4/5] ARM: tegra: Add PMC thermtrip programming to Jetson TK1 device tree
Date: Sat,  6 Sep 2014 11:54:44 +0300
Message-ID: <1409993685-21911-5-git-send-email-cyndis@kapsi.fi>
References: <1409993685-21911-1-git-send-email-cyndis@kapsi.fi>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409993685-21911-1-git-send-email-cyndis-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This adds the required information to reset the board during an overheating
situation to the Jetson TK1 device tree. The thermal reset is handled by the
PMC by sending an I2C message to the PMIC. The entries specify the I2C
message to be sent.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v3
- updated to new binding

 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index d4ddabd..d8894e2 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1422,7 +1422,7 @@
 	};
 
 	/* Expansion PWR_I2C_*, on-board components */
-	i2c@0,7000d000 {
+	pmic_bus: i2c@0,7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
@@ -1637,6 +1637,13 @@
 		nvidia,core-pwr-off-time = <61036>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+
+		i2c-thermtrip {
+			nvidia,i2c-bus = <&pmic_bus>;
+			nvidia,bus-addr = <0x40>;
+			nvidia,reg-addr = <0x36>;
+			nvidia,reg-data = <0x2>;
+		};
 	};
 
 	padctl@0,7009f000 {
-- 
2.1.0
