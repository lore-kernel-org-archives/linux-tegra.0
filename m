From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH] ARM: tegra: nyan: Mark all USB ports as host
Date: Sun, 18 Sep 2016 12:28:52 +0200
Message-ID: <20160918102852.6593-1-contact@paulk.fr>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Nyan boards only have host USB ports (2 external, 1 internal), there is
no OTG-enabled connector.

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 18db797..254b2ee 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -435,7 +435,7 @@
 			usb2-0 {
 				vbus-supply = <&vdd_usb1_vbus>;
 				status = "okay";
-				mode = "otg";
+				mode = "host";
 			};
 
 			usb2-1 {
-- 
2.9.3
