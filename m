From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: use correct audio CODEC on Jetson TK1
Date: Fri, 25 Apr 2014 10:23:32 -0600
Message-ID: <1398443012-17212-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Jetson TK1 contains an RT5639 not an RT5640. While the two are extremely
similar and mostly compatible, we should still use the correct device
name in the device tree. I had meant to fix this before applying the
initial DT, but this issue slipped my mind.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index dd3076d94727..b8931f0ee026 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1346,8 +1346,8 @@
 		status = "okay";
 		clock-frequency = <100000>;
 
-		rt5640: audio-codec@1c {
-			compatible = "realtek,rt5640";
+		rt5639: audio-codec@1c {
+			compatible = "realtek,rt5639";
 			reg = <0x1c>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
@@ -1779,7 +1779,7 @@
 			"IN2P", "Mic Jack";
 
 		nvidia,i2s-controller = <&tegra_i2s1>;
-		nvidia,audio-codec = <&rt5640>;
+		nvidia,audio-codec = <&rt5639>;
 
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_LOW>;
 
-- 
1.8.1.5
