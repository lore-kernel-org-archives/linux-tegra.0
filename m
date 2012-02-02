From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH v2 2/4] ARM: dt: tegra: Enable headset autodetection on PAZ00 board.
Date: Thu,  2 Feb 2012 22:13:36 +0200
Message-ID: <1328213618-15870-3-git-send-email-leon@leon.nu>
References: <1328213618-15870-1-git-send-email-leon@leon.nu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328213618-15870-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch is adding device tree support of headset autodetection on PAZ00 board.

Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index e6809b7..fa9dd9e 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -64,6 +64,7 @@
 
 		nvidia,audio-codec = <&alc5632>;
 		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
 	};
 
 	serial@70006000 {
-- 
1.7.3.4
