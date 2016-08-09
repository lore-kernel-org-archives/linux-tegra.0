From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/7] arm64: tegra: Add the various audio devices for Tegra210 Smaug
Date: Tue, 9 Aug 2016 16:21:21 +0100
Message-ID: <1470756082-19099-7-git-send-email-jonathanh@nvidia.com>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470756082-19099-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra210 Smaug includes the Realtek RT5677 audio codec, Nuvoton
NAU8825 headset codec and the Maxim MAX98357a audio amplifier. Add
the nodes for these devices for the Tegra210 Smaug.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 2c4672527d75..8cdd71f4d9ba 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1562,6 +1562,45 @@
 		};
 	};
 
+	i2c@7000d100 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		nau8825@1a {
+			compatible = "nuvoton,nau8825";
+			reg = <0x1a>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(E, 6) IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&tegra_car TEGRA210_CLK_CLK_OUT_2>;
+			clock-names = "mclk";
+
+			nuvoton,jkdet-enable;
+			nuvoton,jkdet-polarity = <GPIO_ACTIVE_LOW>;
+			nuvoton,vref-impedance = <2>;
+			nuvoton,micbias-voltage = <6>;
+			nuvoton,sar-threshold-num = <4>;
+			nuvoton,sar-threshold = <0xc 0x1e 0x38 0x60>;
+			nuvoton,sar-hysteresis = <1>;
+			nuvoton,sar-voltage = <0>;
+			nuvoton,sar-compare-time = <0>;
+			nuvoton,sar-sampling-time = <0>;
+			nuvoton,short-key-debounce = <2>;
+			nuvoton,jack-insert-debounce = <7>;
+			nuvoton,jack-eject-debounce = <7>;
+			status = "okay";
+		};
+
+		audio-codec@2d {
+			compatible = "realtek,rt5677";
+			reg = <0x2d>;
+			interrupts-extended = <&gpio TEGRA_GPIO(X, 0) IRQ_TYPE_LEVEL_HIGH>;
+			realtek,reset-gpio = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_LOW>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "okay";
+		};
+	};
+
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <0>;
@@ -1664,6 +1703,11 @@
 		};
 	};
 
+	max98357a {
+		compatible = "maxim,max98357a";
+		status = "okay";
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.1.4
