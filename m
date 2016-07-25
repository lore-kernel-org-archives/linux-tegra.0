From: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
Subject: [PATCH] ARM: tegra: fix erroneous address in dts
Date: Mon, 25 Jul 2016 22:02:52 +0200
Message-ID: <1469476972-3624-1-git-send-email-ralf@ramses-pyramidenbau.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, arm@kernel.org
Cc: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

c90bb7b enabled the high speed UARTs of the Jetson TK1. Due to a merge
quirk, wrong addresses were introduced. Fix it and use the correct
addresses.

This patch is only required for 4.7.x, as there is another patch in the
queue for 4.8 that will remove all '0,' prefixes (b5896f67ab3c in
linux-next).

Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 device tree")
Signed-off-by: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
Acked-by: Thierry Reding <thierry.reding@gmail.com>
Cc: stable@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
---
Stable maintainers,

this is targetted at v4.7 only, the offending patch was merged in 4.7-rc1.
We tried to get this in via ARM-SoC maintainers, but it was too late for 4.7.

Only 4.7.x is affected, as there is another patch in the queue that will fix this
issue in 4.8.

  Ralf
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
