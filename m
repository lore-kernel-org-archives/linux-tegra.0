From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: [PATCH v2 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1 device tree
Date: Tue, 26 Jan 2016 17:59:18 +0100
Message-ID: <1453827558-10954-3-git-send-email-ralf@ramses-pyramidenbau.de>
References: <1453827558-10954-1-git-send-email-ralf@ramses-pyramidenbau.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453827558-10954-1-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch enables the APB DMA high speed UARTs of the Jetson TK1. So
far, they were only enabled in NVidia's official BSP.

Those additional UARTs are exposed on the expansion connector J3A2:

 UART1:
  Pin 41: BR_UART1_TXD
  Pin 44: BR_UART1_RXD

 UART2:
  Pin 65: UART2_RXD
  Pin 68: UART2_TXD
  Pin 71: UART2_CTS_L
  Pin 74: UART2_RTS_L

Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 66b4451..4ee2e63 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -12,7 +12,11 @@
 	aliases {
 		rtc0 = "/i2c@0,7000d000/pmic@40";
 		rtc1 = "/rtc@0,7000e000";
+
+		/* This order keeps the mapping DB9 connector <-> ttyS0 */
 		serial0 = &uartd;
+		serial1 = &uarta;
+		serial2 = &uartb;
 	};
 
 	memory {
@@ -1367,6 +1371,28 @@
 		};
 	};
 
+	/*
+	 * First high speed UART, exposed on the expansion connector J3A2
+	 *   Pin 41: BR_UART1_TXD
+	 *   Pin 44: BR_UART1_RXD
+	 */
+	serial@0,70006000 {
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		status = "okay";
+	};
+
+	/*
+	 * Second high speed UART, exposed on the expansion connector J3A2
+	 *   Pin 65: UART2_RXD
+	 *   Pin 68: UART2_TXD
+	 *   Pin 71: UART2_CTS_L
+	 *   Pin 74: UART2_RTS_L
+	 */
+	serial@0,70006040 {
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		status = "okay";
+	};
+
 	/* DB9 serial port */
 	serial@0,70006300 {
 		status = "okay";
-- 
2.4.10
