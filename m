From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Subject: [PATCH v2 1/4] arm64: tegra: Enable signal voltage switching on Tegra194 SDMMC1 and SDMMC3
Date: Thu, 23 Jul 2020 23:09:29 +0200
Message-ID: <20200723210932.8076-2-tszucs@protonmail.ch>
References: <20200723210932.8076-1-tszucs@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200723210932.8076-1-tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add pad voltage configuration nodes for SDMMC pads with configurable voltages
and enable supported SD card, SDIO and eMMC modes.

Signed-off-by: Tamás Szűcs <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 48160f48003a..8351035bb6a7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+#include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
 #include <dt-bindings/power/tegra194-powergate.h>
 #include <dt-bindings/reset/tegra194-reset.h>
 #include <dt-bindings/thermal/tegra194-bpmp-thermal.h>
@@ -467,6 +468,9 @@
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRA &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA &emc>;
 			interconnect-names = "dma-mem", "write";
+			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+			pinctrl-0 = <&sdmmc1_3v3>;
+			pinctrl-1 = <&sdmmc1_1v8>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
 			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
@@ -478,6 +482,15 @@
 			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
 			nvidia,default-tap = <0x9>;
 			nvidia,default-trim = <0x5>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			sd-uhs-sdr12;
+			sd-uhs-sdr25;
+			sd-uhs-sdr50;
+			sd-uhs-sdr104;
+			cap-sdio-irq;
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
 			status = "disabled";
 		};
 
@@ -492,6 +505,9 @@
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCR &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW &emc>;
 			interconnect-names = "dma-mem", "write";
+			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+			pinctrl-0 = <&sdmmc3_3v3>;
+			pinctrl-1 = <&sdmmc3_1v8>;
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x07>;
@@ -504,6 +520,15 @@
 			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
 			nvidia,default-tap = <0x9>;
 			nvidia,default-trim = <0x5>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			sd-uhs-sdr12;
+			sd-uhs-sdr25;
+			sd-uhs-sdr50;
+			sd-uhs-sdr104;
+			cap-sdio-irq;
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
 			status = "disabled";
 		};
 
@@ -1029,6 +1054,26 @@
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
+
+			sdmmc1_3v3: sdmmc1-3v3 {
+				pins = "sdmmc1-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
+			};
+
+			sdmmc1_1v8: sdmmc1-1v8 {
+				pins = "sdmmc1-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
+			};
+
+			sdmmc3_3v3: sdmmc3-3v3 {
+				pins = "sdmmc3-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
+			};
+
+			sdmmc3_1v8: sdmmc3-1v8 {
+				pins = "sdmmc3-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
+			};
 		};
 
 		host1x@13e00000 {
-- 
2.20.1
