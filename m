From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 3/4] ARM: tegra: enable ULPI phy on Colibri T20
Date: Sun, 21 Jul 2013 23:28:51 +0200
Message-ID: <1374442132-24040-4-git-send-email-dev@lynxeye.de>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374442132-24040-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This was missed when splitting out the phy from the controller node in
commit 9dffe3be3f32 (ARM: tegra: modify ULPI reset GPIO properties).

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index fbb52e0..92551ba 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -457,6 +457,7 @@
 	};
 
 	usb-phy@c5004000 {
+		status = "okay";
 		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
 			GPIO_ACTIVE_LOW>;
 	};
-- 
1.8.3.1
