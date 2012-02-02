From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH v2 1/4] ARM: dt: tegra: Enable device tree audio codec on PAZ00 board.
Date: Thu,  2 Feb 2012 22:13:35 +0200
Message-ID: <1328213618-15870-2-git-send-email-leon@leon.nu>
References: <1328213618-15870-1-git-send-email-leon@leon.nu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328213618-15870-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds initial device tree support of ALC5632 sound codec and
machine driver for PAZ00 board. The implementation is based on the WM8903 codec.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |   29 +++++++++++++++++++++++------
 1 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 4d1bcdc..e6809b7 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -12,6 +12,13 @@
 
 	i2c@7000c000 {
 		clock-frequency = <400000>;
+
+		alc5632: alc5632@1e {
+			compatible = "realtek,alc5632";
+			reg = <0x1e>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
 	};
 
 	i2c@7000c400 {
@@ -37,16 +44,26 @@
 		clock-frequency = <400000>;
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
+		compatible = "nvidia,tegra-audio-alc5632-paz00",
+			"nvidia,tegra-audio-alc5632";
+
+		nvidia,model = "Compal PAZ00";
+
+		nvidia,audio-routing =
+			"Int Spk", "SPKOUT",
+			"Int Spk", "SPKOUTN",
+			"Headset Mic", "MICBIAS1",
+			"MIC1", "Headset Mic",
+			"Headset Stereophone", "HPR",
+			"Headset Stereophone", "HPL";
+
+		nvidia,audio-codec = <&alc5632>;
+		nvidia,i2s-controller = <&tegra_i2s1>;
 	};
 
 	serial@70006000 {
-- 
1.7.3.4
