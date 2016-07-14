From: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
Subject: [PATCH] ARM: tegra: fix erroneous address in dts
Date: Thu, 14 Jul 2016 18:48:57 +0200
Message-ID: <1468514937-23250-1-git-send-email-ralf@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ralf Ramsauer <ralf@ramses-pyramidenbau.de>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

c90bb7b enabled the high speed UARTs of the Jetson TK1. The address
specification inside the dts is wrong. Fix it and use the correct
address.

Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 device tree")
Signed-off-by: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
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
