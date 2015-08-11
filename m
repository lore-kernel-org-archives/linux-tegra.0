From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] arm: rpi: Device tree modifications for U-Boot
Date: Tue, 11 Aug 2015 08:25:53 -0600
Message-ID: <1439303153-12171-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This updates the device tree from the kernel version to something suitable
for U-Boot:

- Add stdout-path alias for console
- Mark the /soc node to be available pre-relocation so that the early
serial console works (we need the 'ranges' property to be available)

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 arch/arm/boot/dts/bcm2835.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index 301c73f..bd6bff6 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -8,6 +8,7 @@
 
 	chosen {
 		bootargs = "earlyprintk console=ttyAMA0";
+		stdout-path = &uart;
 	};
 
 	soc {
@@ -16,6 +17,7 @@
 		#size-cells = <1>;
 		ranges = <0x7e000000 0x20000000 0x02000000>;
 		dma-ranges = <0x40000000 0x00000000 0x20000000>;
+		u-boot,dm-pre-reloc;
 
 		timer@7e003000 {
 			compatible = "brcm,bcm2835-system-timer";
@@ -92,7 +94,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		uart@7e201000 {
+		uart: uart@7e201000 {
 			compatible = "brcm,bcm2835-pl011", "arm,pl011", "arm,primecell";
 			reg = <0x7e201000 0x1000>;
 			interrupts = <2 25>;
-- 
2.5.0.rc2.392.g76e840b
