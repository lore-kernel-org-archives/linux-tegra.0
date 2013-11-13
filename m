From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 1/3] ARM: tegra: add AC97 clock to the host controller node
Date: Wed, 13 Nov 2013 20:17:21 +0100
Message-ID: <1384370243-17178-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
--
CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index d5c9bca..f186e64 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -448,6 +448,7 @@
 			GPIO_ACTIVE_HIGH>;
 		nvidia,codec-sync-gpio = <&gpio TEGRA_GPIO(P, 0)
 			GPIO_ACTIVE_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_AC97>;
 	};
 
 	usb@c5004000 {
-- 
1.8.3.1
