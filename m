From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] ARM: tegra: dalmore: fix irq trigger type
Date: Tue, 11 Feb 2014 21:11:32 +0100
Message-ID: <4fcfcfdbc86c37c6d47ec32cdbd987f3b406e9b5.1392147256.git.stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com, josephl@nvidia.com
Cc: linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

Trigger type needs to be IRQ_TYPE_LEVEL_HIGH since the interrupt
signal gets inverted by the PMC (configured by the invert-interrupt
property).

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
I could not test that patch since I don't have such hardware.
However, I stumbled on that error while tracing a similar error
on Colibri T30.

 arch/arm/boot/dts/tegra114-dalmore.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 73aecfb..f5025fc 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -888,8 +888,9 @@
 		palmas: tps65913@58 {
 			compatible = "ti,palmas";
 			reg = <0x58>;
-			interrupts = <0 86 IRQ_TYPE_LEVEL_LOW>;
 
+			/* active-low configured by PMC invert-interrupt */
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 
-- 
1.8.5.4
