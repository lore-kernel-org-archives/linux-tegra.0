From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: dt: tegra trimslice: add support for audio
Date: Fri, 27 Apr 2012 13:34:39 -0600
Message-ID: <1335555279-9297-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

* Add node for the audio codec
* Enable Tegra's I2S1 controller and DAS
* Add node for top-level sound complex

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Mark, I can take this one through the Tegra tree.

 arch/arm/boot/dts/tegra-trimslice.dts |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-trimslice.dts b/arch/arm/boot/dts/tegra-trimslice.dts
index 23ffa9e..0c1a54c 100644
--- a/arch/arm/boot/dts/tegra-trimslice.dts
+++ b/arch/arm/boot/dts/tegra-trimslice.dts
@@ -251,6 +251,11 @@
 	i2c@7000c500 {
 		clock-frequency = <400000>;
 
+		codec: codec@1a {
+			compatible = "ti,tlv320aic23";
+			reg = <0x1a>;
+		};
+
 		rtc@56 {
 			compatible = "emmicro,em3027";
 			reg = <0x56>;
@@ -261,16 +266,14 @@
 		status = "disable";
 	};
 
-	i2s@70002800 {
-		status = "disable";
-	};
-
 	i2s@70002a00 {
 		status = "disable";
 	};
 
-	das@70000c00 {
-		status = "disable";
+	sound {
+		compatible = "nvidia,tegra-audio-trimslice";
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&codec>;
 	};
 
 	serial@70006000 {
-- 
1.7.0.4
