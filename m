From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH] ASoC: DT: Add digital microphone binding to PAZ00 board.
Date: Mon, 27 Feb 2012 21:19:35 +0200
Message-ID: <1330370375-19367-1-git-send-email-leon@leon.nu>
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
 arch/arm/boot/dts/tegra-paz00.dts                  |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
