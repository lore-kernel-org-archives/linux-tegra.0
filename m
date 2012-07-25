From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ARM: dt: tegra trimslice: add vbus-gpio property
Date: Wed, 25 Jul 2012 14:02:44 -0600
Message-ID: <1343246564-21527-2-git-send-email-swarren@wwwdotorg.org>
References: <1343246564-21527-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343246564-21527-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On TrimSlice, Tegra's USB1 port may be routed to either an external micro
USB port, or an internal USB->SATA bridge for SSD or HDD. This muxing is
controlled by a GPIO. Whilst not strictly a VBUS GPIO, the TrimSlice
board files caused this GPIO to be set appropriately to enable the SATA
bridge by passing it as the VBUS GPIO to the USB driver. Echo this same
configuration in device tree to enable the SATA bridge.

An alternative might be to implement a full USB bus mux driver. However,
that seems over-complex right now.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.5 (file is named tegra-trimslice.dts there)
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-trimslice.dts |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 84a9523..27fb8a6 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -276,6 +276,7 @@
 
 	usb@c5000000 {
 		status = "okay";
+		nvidia,vbus-gpio = <&gpio 170 0>; /* gpio PV2 */
 	};
 
 	usb@c5004000 {
-- 
1.7.0.4
