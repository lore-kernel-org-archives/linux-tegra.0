From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v7 11/20] tegra: fdt: Add clock bindings for Tegra2 Seaboard
Date: Tue, 28 Feb 2012 10:07:49 -0800
Message-ID: <1330452478-5039-12-git-send-email-sjg@chromium.org>
References: <1330452478-5039-10-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330452478-5039-10-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the definition of the oscillator clock frequency and the 32KHz clock.
The latter is provided by a PMIC on I2C which we don't actually use at
present, but we expect this definition to be used in the kernel and want
to keep our .dts the same.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v6:
- Add new patch to bring in clock bindings to seaboard

Changes in v7:
- Add in i2c pmic information and 32KHz clock

 board/nvidia/dts/tegra2-seaboard.dts |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index dde5d03..452679f 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -16,6 +16,33 @@
 		reg = < 0x00000000 0x40000000 >;
 	};
 
+	/* This is not used in U-Boot, but is expected to be in kernel .dts */
+	i2c@7000d000 {
+		pmic@34 {
+			compatible = "ti,tps6586x";
+			reg = <0x34>;
+
+			clk_32k: clock {
+				compatible = "fixed-clock";
+				/*
+				 * leave out for now due to CPP:
+				 * #clock-cells = <0>;
+				 */
+				clock-frequency = <32768>;
+			};
+		};
+	};
+
+	clocks {
+		osc {
+			clock-frequency = <12000000>;
+		};
+	};
+
+	clock@60006000 {
+		clocks = <&clk_32k &osc>;
+	};
+
 	serial@70006300 {
 		clock-frequency = < 216000000 >;
 	};
-- 
1.7.7.3
