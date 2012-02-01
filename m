From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/2] ARM: dt: Add SD controller configuration to Tegra Cardhu
Date: Wed,  1 Feb 2012 16:29:57 -0700
Message-ID: <1328138997-25665-2-git-send-email-swarren@nvidia.com>
References: <1328138997-25665-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328138997-25665-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Cardhu uses Tegra's SD ports as follows:
SDMMC1: User SD slot, with GPIOs for power, CD, and WP.
SDMMC2: Not used
SDMMC3: WiFi (currently disabled pending future investigation)
SDMMC4: Internal eMMC

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-cardhu.dts |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
index 70c41fc..7326350 100644
--- a/arch/arm/boot/dts/tegra-cardhu.dts
+++ b/arch/arm/boot/dts/tegra-cardhu.dts
@@ -33,4 +33,22 @@
 	i2c@7000d000 {
 		clock-frequency = <100000>;
 	};
+
+	sdhci@78000000 {
+		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
+		wp-gpios = <&gpio 155 0>; /* gpio PT3 */
+		power-gpios = <&gpio 31 0>; /* gpio PD7 */
+	};
+
+	sdhci@78000200 {
+		status = "disable";
+	};
+
+	sdhci@78000400 {
+		status = "disable";
+	};
+
+	sdhci@78000400 {
+		support-8bit;
+	};
 };
-- 
1.7.0.4
