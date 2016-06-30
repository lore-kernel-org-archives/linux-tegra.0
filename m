From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: beaver: Allow SD card voltage to be changed
Date: Thu, 30 Jun 2016 17:32:08 +0200
Message-ID: <20160630153208.22761-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>

This allows to switch the card signal voltage level to 1.8 V, which is
needed for any ultra high speed modes to work.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi ARM-SoC maintainers,

Can you please apply this for v4.7? It fixes a regression with UHS modes
that I had hoped could be fixed in the MMC core, but it turns out that a
fairly invasive change will be required and it's not going to make v4.7.

I should note that this is not a workaround. It is the proper fix to
enable UHS modes, but it exposes a weakness in the SDHCI driver which
will happily switch to UHS modes whether or not the power supply can be
configured to output the required voltage. Ideally the SDHCI driver will
be taught to reject UHS modes if the available supply voltages aren't
suitable. There is work underway to do that, but it won't make v4.7.

Thanks,
Thierry

 arch/arm/boot/dts/tegra30-beaver.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 1eca3b28ac64..b6da15d823a6 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1843,7 +1843,7 @@
 
 				ldo5_reg: ldo5 {
 					regulator-name = "vddio_sdmmc,avdd_vdac";
-					regulator-min-microvolt = <3300000>;
+					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-always-on;
 				};
@@ -1914,6 +1914,7 @@
 
 	sdhci@78000000 {
 		status = "okay";
+		vqmmc-supply = <&ldo5_reg>;
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(T, 3) GPIO_ACTIVE_HIGH>;
 		power-gpios = <&gpio TEGRA_GPIO(D, 7) GPIO_ACTIVE_HIGH>;
-- 
2.8.3
