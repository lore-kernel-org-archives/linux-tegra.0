From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/3] ARM: tegra: enable audio on Beaver
Date: Wed, 12 Jun 2013 11:37:15 -0600
Message-ID: <1371058636-25244-2-git-send-email-swarren@wwwdotorg.org>
References: <1371058636-25244-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371058636-25244-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Beaver uses the RT5640 audio CODEC. Instantiate this on the I2C bus, and
add the top-level "sound" node to hook everything together and provide a
"sound card" device.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-beaver.dts | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index a7a34b9..87c5f7b 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -116,6 +116,15 @@
 		status = "okay";
 		clock-frequency = <100000>;
 
+		rt5640: rt5640 {
+			compatible = "realtek,rt5640";
+			reg = <0x1c>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+			realtek,ldo1-en-gpios =
+				<&gpio TEGRA_GPIO(X, 2) GPIO_ACTIVE_HIGH>;
+		};
+
 		tps62361 {
 			compatible = "ti,tps62361";
 			reg = <0x60>;
@@ -404,4 +413,24 @@
 			gpios = <&gpio TEGRA_GPIO(L, 0) GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	sound {
+		compatible = "nvidia,tegra-audio-rt5640-beaver",
+			     "nvidia,tegra-audio-rt5640";
+		nvidia,model = "NVIDIA Tegra Beaver";
+
+		nvidia,audio-routing =
+			"Headphones", "HPOR",
+			"Headphones", "HPOL";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&rt5640>;
+
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
+
+		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA30_CLK_EXTERN1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+	};
 };
-- 
1.8.1.5
