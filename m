From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH] ARM: tegra: add serial aliases to Tegra124 DT
Date: Mon,  3 Nov 2014 23:20:04 +0100
Message-ID: <1415053204-30114-1-git-send-email-dev@lynxeye.de>
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
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Provides consistent numbering of consoles across boards.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
These aliases are already present in the base DTs for all
other Tegra SoCs.
---
 arch/arm/boot/dts/tegra124.dtsi | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 478c555..9b53649 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -12,6 +12,13 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		serial0 = &uarta;
+		serial1 = &uartb;
+		serial2 = &uartc;
+		serial3 = &uartd;
+	};
+
 	pcie-controller@0,01003000 {
 		compatible = "nvidia,tegra124-pcie";
 		device_type = "pci";
@@ -286,7 +293,7 @@
 	 * the APB DMA based serial driver, the comptible is
 	 * "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart".
 	 */
-	serial@0,70006000 {
+	uarta: serial@0,70006000 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006000 0x0 0x40>;
 		reg-shift = <2>;
@@ -299,7 +306,7 @@
 		status = "disabled";
 	};
 
-	serial@0,70006040 {
+	uartb: serial@0,70006040 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006040 0x0 0x40>;
 		reg-shift = <2>;
@@ -312,7 +319,7 @@
 		status = "disabled";
 	};
 
-	serial@0,70006200 {
+	uartc: serial@0,70006200 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006200 0x0 0x40>;
 		reg-shift = <2>;
@@ -325,7 +332,7 @@
 		status = "disabled";
 	};
 
-	serial@0,70006300 {
+	uartd: serial@0,70006300 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006300 0x0 0x40>;
 		reg-shift = <2>;
-- 
1.9.3
