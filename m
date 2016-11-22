From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 5/6] apalis-tk1: working sd card detect on v1.1 hw
Date: Tue, 22 Nov 2016 01:14:06 +0100
Message-ID: <1479773647-14726-6-git-send-email-marcel.ziswiler@toradex.com>
References: <1479773647-14726-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479773647-14726-1-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add sd card detect SD1_CD# applicable for V1.1 modules using GPIO_PV2.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
---

 arch/arm/boot/dts/tegra124-apalis-eval.dts | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index 2b5a0f3..2715692 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -187,14 +187,8 @@
 	/* Apalis SD1 */
 	sdhci@700b0400 {
 		status = "okay";
-		/*
-		 * Don't use SD1_CD# aka SDMMC3_CLK_LB_OUT for now as it
-		 * features some magic properties even though the external
-		 * loopback is disabled and the internal loopback used as per
-		 * SDMMC_VENDOR_MISC_CNTRL_0 register's SDMMC_SPARE1 bits being
-		 * set to 0xfffd according to the TRM!
-		 * cd-gpios = <&gpio TEGRA_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
-		 */
+		/* SD1_CD# */
+		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		bus-width = <4>;
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
-- 
2.5.5
