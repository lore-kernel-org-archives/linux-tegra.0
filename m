From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.7 109/186] ARM: tegra: fix erroneous address in dts
Date: Thu, 18 Aug 2016 15:58:46 +0200
Message-ID: <20160818135936.913962919@linuxfoundation.org>
References: <20160818135932.219369981@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160818135932.219369981@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Ralf Ramsauer <ralf@ramses-pyramidenbau.de>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

4.7-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>

commit b5c86b7496d74f6e454bcab5166efa023e1f0459 upstream.

c90bb7b enabled the high speed UARTs of the Jetson TK1. Due to a merge
quirk, wrong addresses were introduced. Fix it and use the correct
addresses.

Thierry let me know, that there is another patch (b5896f67ab3c in
linux-next) in preparation which removes all the '0,' prefixes of unit
addresses on Tegra124 and is planned to go upstream in 4.8, so
this patch will get reverted then.

But for the moment, this patch is necessary to fix current misbehaviour.

Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 device tree")
Signed-off-by: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
Acked-by: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
