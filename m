From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/7] ARM: tegra: Hook up SDMMC3 power-supply on Venice2
Date: Wed, 26 Feb 2014 17:20:24 +0100
Message-ID: <1393431629-7040-2-git-send-email-thierry.reding@gmail.com>
References: <1393431629-7040-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393431629-7040-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The SDMMC3 interface is supplied with 1.8V by the PMICs LDO6.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 50993ef84e67..dfe44807058a 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -763,12 +763,10 @@
 					regulator-max-microvolt = <1200000>;
 				};
 
-				ldo6 {
+				vddio_sdmmc3: ldo6 {
 					regulator-name = "+VDDIO_SDMMC3";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
-					regulator-boot-on;
-					regulator-always-on;
 				};
 
 				ldo7 {
@@ -930,6 +928,7 @@
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		status = "okay";
 		bus-width = <4>;
+		vmmc-supply = <&vddio_sdmmc3>;
 	};
 
 	sdhci@700b0600 {
-- 
1.8.4.2
