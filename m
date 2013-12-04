From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra: add sound card to Venice2 DT
Date: Wed,  4 Dec 2013 15:26:56 -0700
Message-ID: <1386196016-25128-4-git-send-email-swarren@wwwdotorg.org>
References: <1386196016-25128-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386196016-25128-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Venice2 uses the MAX98090 audio CODEC, and supports built-in speakers,
and a combo headphones/microphone jack. Add a top-level sound card node
to represent this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 7aa711b7b4e3..89690238f3ff 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -17,6 +17,13 @@
 	i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
+
+		acodec: audio-codec@10 {
+			compatible = "maxim,max98090";
+			reg = <0x10>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+		};
 	};
 
 	i2c@7000c400 {
@@ -62,6 +69,12 @@
 		bus-width = <8>;
 	};
 
+	ahub@70300000 {
+		i2s@70301100 {
+			status = "okay";
+		};
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -74,4 +87,26 @@
 			clock-frequency = <32768>;
 		};
 	};
+
+	sound {
+		compatible = "nvidia,tegra-audio-max98090-venice2",
+			     "nvidia,tegra-audio-max98090";
+		nvidia,model = "NVIDIA Tegra Venice2";
+
+		nvidia,audio-routing =
+			"Headphones", "HPR",
+			"Headphones", "HPL",
+			"Speakers", "SPKR",
+			"Speakers", "SPKL",
+			"Mic Jack", "MICBIAS",
+			"IN34", "Mic Jack";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&acodec>;
+
+		clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
+			 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA124_CLK_EXTERN1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+	};
 };
-- 
1.8.1.5
