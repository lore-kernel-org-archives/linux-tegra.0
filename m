From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: tegra20: Remove obsolete vbus-gpio properties
Date: Wed, 26 Jun 2013 12:59:41 +0300
Message-ID: <1372240781-1017-5-git-send-email-mperttunen@nvidia.com>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372240781-1017-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

USB VBUS regulators are now specified with the vbus-supply property
instead of vbus-gpio, so remove the obsolete properties.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-seaboard.dts  | 1 -
 arch/arm/boot/dts/tegra20-trimslice.dts | 1 -
 arch/arm/boot/dts/tegra20-whistler.dts  | 2 --
 3 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index ab177b4..2ab4775 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -566,7 +566,6 @@
 
 	usb@c5000000 {
 		status = "okay";
-		nvidia,vbus-gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		dr_mode = "otg";
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 1701599..bea4aaa 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -312,7 +312,6 @@
 
 	usb@c5000000 {
 		status = "okay";
-		nvidia,vbus-gpio = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 	};
 
 	usb-phy@c5000000 {
diff --git a/arch/arm/boot/dts/tegra20-whistler.dts b/arch/arm/boot/dts/tegra20-whistler.dts
index ea078ab..e07f210 100644
--- a/arch/arm/boot/dts/tegra20-whistler.dts
+++ b/arch/arm/boot/dts/tegra20-whistler.dts
@@ -509,7 +509,6 @@
 
 	usb@c5000000 {
 		status = "okay";
-		nvidia,vbus-gpio = <&tca6416 0 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb-phy@c5000000 {
@@ -519,7 +518,6 @@
 
 	usb@c5008000 {
 		status = "okay";
-		nvidia,vbus-gpio = <&tca6416 1 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb-phy@c5008000 {
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
