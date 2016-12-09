From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] ARM: tegra: mark panel regulator as enabled on boot
Date: Fri,  9 Dec 2016 10:20:38 +0100
Message-ID: <1d6749b2aa21112cb73e162a73e9e0e36b32a677.1481273581.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-dWgojZr1M5Qdnm+yROfE0A@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Current u-boot enables the display already. Fixes sporadic panel
initialization failure with tegra_defconfig.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 4e361a8c167e..1be690cce9aa 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -570,6 +570,7 @@
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			gpio = <&gpio TEGRA_GPIO(A, 4) GPIO_ACTIVE_HIGH>;
+			regulator-boot-on;
 			enable-active-high;
 		};
 	};
-- 
2.11.0
