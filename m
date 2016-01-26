From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: tegra: Fixed typo
Date: Tue, 26 Jan 2016 17:59:17 +0100
Message-ID: <1453827558-10954-2-git-send-email-ralf@ramses-pyramidenbau.de>
References: <1453827558-10954-1-git-send-email-ralf@ramses-pyramidenbau.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453827558-10954-1-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 +-
 arch/arm/boot/dts/tegra124.dtsi | 2 +-
 arch/arm/boot/dts/tegra20.dtsi  | 2 +-
 arch/arm/boot/dts/tegra30.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index d845bd1..5017ed8 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -256,7 +256,7 @@
 	 * driver and APB DMA based serial driver for higher baudrate
 	 * and performace. To enable the 8250 based driver, the compatible
 	 * is "nvidia,tegra114-uart", "nvidia,tegra20-uart" and to enable
-	 * the APB DMA based serial driver, the comptible is
+	 * the APB DMA based serial driver, the compatible is
 	 * "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart".
 	 */
 	uarta: serial@70006000 {
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 68669f7..995289b 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -322,7 +322,7 @@
 	 * driver and APB DMA based serial driver for higher baudrate
 	 * and performace. To enable the 8250 based driver, the compatible
 	 * is "nvidia,tegra124-uart", "nvidia,tegra20-uart" and to enable
-	 * the APB DMA based serial driver, the comptible is
+	 * the APB DMA based serial driver, the compatible is
 	 * "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart".
 	 */
 	uarta: serial@0,70006000 {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 33173e1..8fb61b9 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -309,7 +309,7 @@
 	 * driver and APB DMA based serial driver for higher baudrate
 	 * and performace. To enable the 8250 based driver, the compatible
 	 * is "nvidia,tegra20-uart" and to enable the APB DMA based serial
-	 * driver, the comptible is "nvidia,tegra20-hsuart".
+	 * driver, the compatible is "nvidia,tegra20-hsuart".
 	 */
 	uarta: serial@70006000 {
 		compatible = "nvidia,tegra20-uart";
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 313e260..c6edc8c 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -371,7 +371,7 @@
 	 * driver and APB DMA based serial driver for higher baudrate
 	 * and performace. To enable the 8250 based driver, the compatible
 	 * is "nvidia,tegra30-uart", "nvidia,tegra20-uart" and to enable
-	 * the APB DMA based serial driver, the comptible is
+	 * the APB DMA based serial driver, the compatible is
 	 * "nvidia,tegra30-hsuart", "nvidia,tegra20-hsuart".
 	 */
 	uarta: serial@70006000 {
-- 
2.4.10
