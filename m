From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: [RESEND PATCH] ARM: tegra: fix erroneous address in dts
Date: Mon, 18 Jul 2016 11:46:48 +0200
Message-ID: <1468835208-13426-1-git-send-email-ralf@ramses-pyramidenbau.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

c90bb7b enabled the high speed UARTs of the Jetson TK1. Due to a merge
quirk, wrong addresses were introduced. Fix it and use the correct
addresses.

Thierry let me know, that there is another patch (b5896f67ab3c in
linux-next) in preparation which removes all the '0,' prefixes of unit
addresses on Tegra124 and is planned to go upstream in 4.8, so
this patch will get reverted then.

But for the moment, this patch is necessary to fix current misbehaviour.

Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 device tree")
Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Acked-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 941f362..f4d8125 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1386,7 +1386,7 @@
 	 *   Pin 41: BR_UART1_TXD
 	 *   Pin 44: BR_UART1_RXD
 	 */
-	serial@70006000 {
+	serial@0,70006000 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
@@ -1398,7 +1398,7 @@
 	 *   Pin 71: UART2_CTS_L
 	 *   Pin 74: UART2_RTS_L
 	 */
-	serial@70006040 {
+	serial@0,70006040 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
 		status = "okay";
 	};
-- 
2.7.3
