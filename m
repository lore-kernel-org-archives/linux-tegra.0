From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: dt: tegra: whistler: configure power off
Date: Tue, 11 Sep 2012 13:20:37 -0600
Message-ID: <1347391237-31044-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add DT property to tell the MAX8907 that it should provide the
pm_power_off() implementation. This allows "shutdown" to work.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I will probably squash this into "ARM: dt: configure power off for some
boards" when applying.

 arch/arm/boot/dts/tegra20-whistler.dts |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-whistler.dts b/arch/arm/boot/dts/tegra20-whistler.dts
index 4ae1e5d..c636d00 100644
--- a/arch/arm/boot/dts/tegra20-whistler.dts
+++ b/arch/arm/boot/dts/tegra20-whistler.dts
@@ -267,6 +267,8 @@
 			reg = <0x3c>;
 			interrupts = <0 86 0x4>;
 
+			maxim,system-power-controller;
+
 			mbatt-supply = <&usb0_vbus_reg>;
 			in-v1-supply = <&mbatt_reg>;
 			in-v2-supply = <&mbatt_reg>;
-- 
1.7.0.4
