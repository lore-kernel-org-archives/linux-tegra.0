From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove UART5/UARTE from tegra124.dtsi
Date: Thu,  1 May 2014 10:43:28 -0600
Message-ID: <1398962608-11867-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(This is commit 862f0eea38409ff0d7f226c1245b787e3f0e2607 upstream)

Tegra124 only has 4 UARTs. Parts of the documentation hint at a fifth
UART, but this appears to be left-over from earlier SoC documentation.
Remove the non-existent DT node for UART5.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.14
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
This is a backport of the upstream commit specifically for 3.13.
The following commits in mainline follow on from this:
9ef1af9ea28c dt: tegra: remove non-existent clock IDs
9ba71705706a clk: tegra: remove non-existent clocks
... and can be directly cherry-picked without conflict, after this.
---
 arch/arm/boot/dts/tegra124.dtsi | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index ec0698a8354a..9c2ba74a8b60 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -164,19 +164,6 @@
 		status = "disabled";
 	};
 
-	serial@70006400 {
-		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
-		reg = <0x70006400 0x40>;
-		reg-shift = <2>;
-		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car TEGRA124_CLK_UARTE>;
-		resets = <&tegra_car 66>;
-		reset-names = "serial";
-		dmas = <&apbdma 20>, <&apbdma 20>;
-		dma-names = "rx", "tx";
-		status = "disabled";
-	};
-
 	pwm@7000a000 {
 		compatible = "nvidia,tegra124-pwm", "nvidia,tegra20-pwm";
 		reg = <0x7000a000 0x100>;
-- 
1.8.1.5
