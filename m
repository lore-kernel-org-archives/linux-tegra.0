From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm/dt: Fix ventana SDHCI power-gpios
Date: Wed, 19 Oct 2011 10:53:57 -0600
Message-ID: <1319043237-1474-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Ventana uses the same SDHCI GPIOs as Seaboard; PI6 (70) is the power GPIO
for the SD port, and there is no power GPIO for the MMC chip.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note: This bug doesn't actually prevent anything from working; since the
GPIO for sdhci@c8000400 was specified for sdhci@c8000600, it ended up
getting enabled anyway, and hence a card in sdhci@c8000400 would work fine.
Enabling GPIO 155/PT3 doesn't cause any harm on Ventana; it's not connected
to anything.

 arch/arm/boot/dts/tegra-ventana.dts |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-ventana.dts b/arch/arm/boot/dts/tegra-ventana.dts
index 9b29a62..3f9abd6 100644
--- a/arch/arm/boot/dts/tegra-ventana.dts
+++ b/arch/arm/boot/dts/tegra-ventana.dts
@@ -22,11 +22,10 @@
 	sdhci@c8000400 {
 		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
 		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
-		power-gpios = <&gpio 155 0>; /* gpio PT3 */
+		power-gpios = <&gpio 70 0>; /* gpio PI6 */
 	};
 
 	sdhci@c8000600 {
-		power-gpios = <&gpio 70 0>; /* gpio PI6 */
 		support-8bit;
 	};
 };
-- 
1.7.0.4
