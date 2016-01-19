From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: Add high speed UARTs to Jetson TK1 device tree
Date: Tue, 19 Jan 2016 14:12:35 +0100
Message-ID: <1453209155-6213-3-git-send-email-ralf@ramses-pyramidenbau.de>
References: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453209155-6213-1-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch enables the APB DMA high speed UARTs of the Jetson TK1.

Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 66b4451..0bd9be7 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -12,7 +12,12 @@
 	aliases {
 		rtc0 = "/i2c@0,7000d000/pmic@40";
 		rtc1 = "/rtc@0,7000e000";
+
+		/* This order keeps the mapping DB9 connector <-> ttyS0 */
 		serial0 = &uartd;
+		serial1 = &uarta;
+		serial2 = &uartb;
+		serial3 = &uartc;
 	};
 
 	memory {
@@ -1367,6 +1372,24 @@
 		};
 	};
 
+	/* First high speed UART */
+	serial@0,70006000 {
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		status = "okay";
+	};
+
+	/* Second high speed UART */
+	serial@0,70006040 {
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		status = "okay";
+	};
+
+	/* Third high speed UART */
+	serial@0,70006200 {
+		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		status = "okay";
+	};
+
 	/* DB9 serial port */
 	serial@0,70006300 {
 		status = "okay";
-- 
2.4.10
