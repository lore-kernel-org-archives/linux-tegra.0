From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Combine VBUS enable pins into one node
Date: Tue, 25 Feb 2014 16:45:04 +0100
Message-ID: <1393343104-2647-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Both USB_VBUS_EN0 and USB_VBUS_EN1 are configured the same way, so they
can be combined into a single node. While at it, don't configure them as
pull-up since they already have external pull-ups. Also U-Boot doesn't
configure them as pull-up either.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index e71aeb9929b4..c950c76185d2 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -402,19 +402,11 @@
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 			usb_vbus_en0_pn4 {
-				nvidia,pins = "usb_vbus_en0_pn4";
+				nvidia,pins = "usb_vbus_en0_pn4",
+					      "usb_vbus_en1_pn5";
 				nvidia,function = "usb";
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
-			};
-			usb_vbus_en1_pn5 {
-				nvidia,pins = "usb_vbus_en1_pn5";
-				nvidia,function = "usb";
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,lock = <TEGRA_PIN_DISABLE>;
 				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
-- 
1.8.4.2
