From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] ARM: tegra: beaver: allow SD card voltage to be changed
Date: Mon, 29 Feb 2016 22:01:18 +0100
Message-ID: <1456779678-20173-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This allows to switch the card signal voltage level to 1.8V,
which is needed for any ultra high speed modes to work.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
This needs the SDMMC memcomp pad calibration patches I just
sent out to be applied, otherwise the card voltage change will
fail with a message in the kernel log and a fall back to
high speed operation.
---
 arch/arm/boot/dts/tegra30-beaver.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 1daed40..6b237f2 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1848,7 +1848,7 @@
 
 				ldo5_reg: ldo5 {
 					regulator-name = "vddio_sdmmc,avdd_vdac";
-					regulator-min-microvolt = <3300000>;
+					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-always-on;
 				};
@@ -1919,6 +1919,7 @@
 
 	sdhci@78000000 {
 		status = "okay";
+		vqmmc-supply = <&ldo5_reg>;
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(T, 3) GPIO_ACTIVE_HIGH>;
 		power-gpios = <&gpio TEGRA_GPIO(D, 7) GPIO_ACTIVE_HIGH>;
-- 
2.5.0
