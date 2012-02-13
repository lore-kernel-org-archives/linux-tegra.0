From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH 2/2] ASoC: DT: Add digital microphone binding to PAZ00 board.
Date: Mon, 13 Feb 2012 21:29:51 +0200
Message-ID: <1329161391-10197-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds device tree binding of digital microphone to PAZ00
board.

Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
---
 .../bindings/sound/tegra-audio-alc5632.txt         |    2 ++
 arch/arm/boot/dts/tegra-paz00.dts                  |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
index 300f2da..9e305bb 100644
--- a/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
+++ b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
@@ -25,12 +25,14 @@ Required properties:
   * MIC2_P
   * MIC2_N
   * MICBIAS1
+  * DMICDAT
 
   Board connectors:
 
   * Headset Stereophone
   * Int Spk
   * Headset Mic
+  * Digital Mic
 
 - nvidia,i2s-controller : The phandle of the Tegra I2S controller
 - nvidia,audio-codec : The phandle of the ALC5632 audio codec
diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index fa9dd9e..07e6f5a 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -60,7 +60,8 @@
 			"Headset Mic", "MICBIAS1",
 			"MIC1", "Headset Mic",
 			"Headset Stereophone", "HPR",
-			"Headset Stereophone", "HPL";
+			"Headset Stereophone", "HPL",
+			"DMICDAT", "Digital Mic";
 
 		nvidia,audio-codec = <&alc5632>;
 		nvidia,i2s-controller = <&tegra_i2s1>;
-- 
1.7.3.4
