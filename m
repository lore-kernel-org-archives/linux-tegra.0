From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/5] ARM: tegra: paz00: fix wrong SD1 power gpio
Date: Sat, 28 Jan 2012 20:03:04 +0100
Message-ID: <c20ded634d91103a1c23a3c8359c0efd93561211.1327776641.git.marvin24@gmx.de>
References: <cover.1327776641.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The power gpio for the external memory card was specified wrongly.
Replace it with the correct value (tested with warmboot with fastboot).

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |    2 +-
 arch/arm/mach-tegra/board-paz00.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 4d1bcdc..1e08934 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -72,7 +72,7 @@
 	sdhci@c8000000 {
 		cd-gpios = <&gpio 173 0>; /* gpio PV5 */
 		wp-gpios = <&gpio 57 0>;  /* gpio PH1 */
-		power-gpios = <&gpio 155 0>; /* gpio PT3 */
+		power-gpios = <&gpio 169 0>; /* gpio PV1 */
 	};
 
 	sdhci@c8000200 {
diff --git a/arch/arm/mach-tegra/board-paz00.h b/arch/arm/mach-tegra/board-paz00.h
index ffa83f5..3c9f8da 100644
--- a/arch/arm/mach-tegra/board-paz00.h
+++ b/arch/arm/mach-tegra/board-paz00.h
@@ -22,7 +22,7 @@
 /* SDCARD */
 #define TEGRA_GPIO_SD1_CD		TEGRA_GPIO_PV5
 #define TEGRA_GPIO_SD1_WP		TEGRA_GPIO_PH1
-#define TEGRA_GPIO_SD1_POWER		TEGRA_GPIO_PT3
+#define TEGRA_GPIO_SD1_POWER		TEGRA_GPIO_PV1
 
 /* ULPI */
 #define TEGRA_ULPI_RST			TEGRA_GPIO_PV0
-- 
1.7.5.4
