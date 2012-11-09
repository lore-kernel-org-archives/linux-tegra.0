From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: tec: Remove redundant DT properties
Date: Fri,  9 Nov 2012 14:04:51 +0100
Message-ID: <1352466291-27333-2-git-send-email-thierry.reding@avionic-design.de>
References: <1352466291-27333-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352466291-27333-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

These properties are already set by the tegra20-tamonten.dtsi, so they
don't need to be repeated.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-tec.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra20-tec.dts
index 9aff31b..916bec1 100644
--- a/arch/arm/boot/dts/tegra20-tec.dts
+++ b/arch/arm/boot/dts/tegra20-tec.dts
@@ -7,9 +7,6 @@
 	compatible = "ad,tec", "ad,tamonten", "nvidia,tegra20";
 
 	i2c@7000c000 {
-		clock-frequency = <400000>;
-		status = "okay";
-
 		wm8903: wm8903@1a {
 			compatible = "wlf,wm8903";
 			reg = <0x1a>;
-- 
1.8.0
