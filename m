From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 23/23] arm64: tegra: Add support for APE sound card on Jetson Nano and TX1
Date: Sat, 27 Jun 2020 10:23:45 +0530
Message-ID: <1593233625-14961-24-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1593233625-14961-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds APE sound card support on Jetson Nano and TX1 which is based
on simple-card driver. Earlier in the series simple-card driver is
enhanced to work with multiple ASoC components. Based on board design
required I/O interfaces are exposed for I2S and DMIC. More complicated
audio paths will be added going forward.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 94 ++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 49 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 67 +++++++++++++++
 3 files changed, 210 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 3c21137..7c4b521 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -166,4 +166,98 @@
 			};
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		simple-audio-card,name = "jetson-tx1-ape";
+
+		simple-audio-card,widgets =
+			"Microphone",   "MIC",
+			"Speaker",	"SPK";
+
+		simple-audio-card,routing =
+			"SPK",		  "I2S1 Playback",
+			"SPK",		  "I2S2 Playback",
+			"SPK",		  "I2S3 Playback",
+			"SPK",		  "I2S4 Playback",
+			"SPK",		  "I2S5 Playback",
+			"I2S1 Capture",   "MIC",
+			"I2S2 Capture",   "MIC",
+			"I2S3 Capture",   "MIC",
+			"I2S4 Capture",   "MIC",
+			"I2S5 Capture",   "MIC",
+			"DMIC1 Capture",  "MIC",
+			"DMIC2 Capture",  "MIC",
+			"DMIC3 Capture",  "MIC";
+
+		/* BE links */
+		simple-audio-card,dai-link@1 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s1>;
+			frame-master = <&cpu_i2s1>;
+
+			cpu_i2s1: cpu@0 {
+				sound-dai = <&tegra_i2s1 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@2 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s2>;
+			frame-master = <&cpu_i2s2>;
+
+			cpu_i2s2: cpu@0 {
+				sound-dai = <&tegra_i2s2 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@3 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s3>;
+			frame-master = <&cpu_i2s3>;
+
+			cpu_i2s3: cpu@0 {
+				sound-dai = <&tegra_i2s3 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@4 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s4>;
+			frame-master = <&cpu_i2s4>;
+
+			cpu_i2s4: cpu@0 {
+				sound-dai = <&tegra_i2s4 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@5 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s5>;
+			frame-master = <&cpu_i2s5>;
+
+			cpu_i2s5: cpu@0 {
+				sound-dai = <&tegra_i2s5 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@6 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic1 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@7 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic2 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@8 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic3 0>;
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 721f66c..31994f6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -842,4 +842,53 @@
 			};
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		simple-audio-card,name = "jetson-nano-ape";
+		simple-audio-card,widgets =
+			"Microphone",   "MIC",
+			"Speaker",	"SPK";
+		simple-audio-card,routing =
+			"SPK",		  "I2S3 Playback",
+			"SPK",		  "I2S4 Playback",
+			"I2S3 Capture",   "MIC",
+			"I2S4 Capture",   "MIC",
+			"DMIC1 Capture",  "MIC",
+			"DMIC2 Capture",  "MIC";
+
+		/* BE links */
+		simple-audio-card,dai-link@1 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s1>;
+			frame-master = <&cpu_i2s1>;
+
+			cpu_i2s1: cpu@0 {
+				sound-dai = <&tegra_i2s3 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@2 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s2>;
+			frame-master = <&cpu_i2s2>;
+
+			cpu_i2s2: cpu@0 {
+				sound-dai = <&tegra_i2s4 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@3 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic1 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@4 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic2 0>;
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 73ae58f..f1925f1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1841,4 +1841,71 @@
 			};
 		};
 	};
+
+	tegra_sound {
+		status = "disabled";
+
+		compatible = "simple-cc-audio-card";
+
+		clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+			 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA210_CLK_EXTERN1>;
+		clock-names = "pll_a", "plla_out0", "aud_mclk";
+		assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+				  <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+				  <&tegra_car TEGRA210_CLK_EXTERN1>;
+		assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+		assigned-clock-rates = <368640000>, <49152000>, <12288000>;
+
+		simple-audio-card,aux-devs = <&tegra_ahub>;
+
+		/* FE links */
+		simple-audio-card,dai-link@0 {
+			cpu@0 {
+				sound-dai = <&tegra_admaif 0>;
+			};
+
+			cpu@1 {
+				sound-dai = <&tegra_admaif 1>;
+			};
+
+			cpu@2 {
+				sound-dai = <&tegra_admaif 2>;
+			};
+
+			cpu@3 {
+				sound-dai = <&tegra_admaif 3>;
+			};
+
+			cpu@4 {
+				sound-dai = <&tegra_admaif 4>;
+			};
+
+			cpu@5 {
+				sound-dai = <&tegra_admaif 5>;
+			};
+
+			cpu@6 {
+				sound-dai = <&tegra_admaif 6>;
+			};
+
+			cpu@7 {
+				sound-dai = <&tegra_admaif 7>;
+			};
+
+			cpu@8 {
+				sound-dai = <&tegra_admaif 8>;
+			};
+
+			cpu@9 {
+				sound-dai = <&tegra_admaif 9>;
+			};
+
+			/*
+			 * Empty codec list.
+			 * Router MUX controls take care of audio path by
+			 * connecting multiple components.
+			 */
+		};
+	};
 };
-- 
2.7.4
