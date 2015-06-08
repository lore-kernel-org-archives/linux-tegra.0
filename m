From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: roth: Add MMC pwrseq to power wifi on
Date: Mon, 8 Jun 2015 16:41:32 +0900
Message-ID: <1433749292-13890-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The wifi chip on roth needs to have its reset deasserted in order to be
probed. Add a mmc-pwrseq-simple to allow this to happen and get wifi
working at boot time.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-roth.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index ea1772a686c2..04762532a178 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -972,6 +972,11 @@
 		nvidia,invert-interrupt;
 	};
 
+	sdhci0_pwrseq: sdhci0_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LOW>;
+	};
+
 	/* Wifi */
 	sdhci@78000000 {
 		status = "okay";
@@ -979,6 +984,7 @@
 		broken-cd;
 		keep-power-in-suspend;
 		cap-sdio-irq;
+		mmc-pwrseq = <&sdhci0_pwrseq>;
 	};
 
 	/* SD card */
-- 
2.4.2
