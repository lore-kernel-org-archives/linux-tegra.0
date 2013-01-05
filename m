From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 2/3] ASoC: tegra:  add ac97 host controller to device tree
Date: Sat,  5 Jan 2013 02:18:44 +0100
Message-ID: <1357348725-32139-3-git-send-email-dev@lynxeye.de>
References: <1357348725-32139-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357348725-32139-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add default entry for the AC97 host controller.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
v2:
- only add .dtsi parts here
---
 arch/arm/boot/dts/tegra20.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index b8effa1..1dc0423 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -177,6 +177,15 @@
 		compatible = "nvidia,tegra20-das";
 		reg = <0x70000c00 0x80>;
 	};
+	
+	tegra_ac97: ac97 {
+		compatible = "nvidia,tegra20-ac97";
+		reg = <0x70002000 0x200>;
+		interrupts = <0 81 0x04>;
+		nvidia,dma-request-selector = <&apbdma 12>;
+		clocks = <&tegra_car 3>;
+		status = "disabled";
+	};
 
 	tegra_i2s1: i2s@70002800 {
 		compatible = "nvidia,tegra20-i2s";
-- 
1.8.0.1
