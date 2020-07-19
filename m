From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 09/10] arm64: tegra: Audio graph header for Tegra210
Date: Sun, 19 Jul 2020 10:40:16 +0530
Message-ID: <1595135417-16589-10-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595135417-16589-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Expose a header which describes DT bindings required to use audio-graph
based sound card. All Tegra210 based platforms can include this header
and add platform specific information. Currently, from SoC point of view,
all links are exposed for ADMAIF, AHUB, I2S and DMIC components.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
new file mode 100644
index 0000000..1cf2c87
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	tegra_sound {
+		status = "disabled";
+
+		compatible = "audio-graph-cc-card";
+
+		clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+			 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA210_CLK_EXTERN1>;
+		clock-names = "pll_a", "plla_out0", "aud_mclk";
+
+		assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+				  <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+				  <&tegra_car TEGRA210_CLK_EXTERN1>;
+		assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+		assigned-clock-rates = <368640000>, <49152000>, <12288000>;
+	};
+};
+
+&tegra_admaif {
+	admaif_port: port {
+		admaif0: endpoint@0 {
+			remote-endpoint = <&xbar_admaif0>;
+		};
+		admaif1: endpoint@1 {
+			remote-endpoint = <&xbar_admaif1>;
+		};
+		admaif2: endpoint@2 {
+			remote-endpoint = <&xbar_admaif2>;
+		};
+		admaif3: endpoint@3 {
+			remote-endpoint = <&xbar_admaif3>;
+		};
+		admaif4: endpoint@4 {
+			remote-endpoint = <&xbar_admaif4>;
+		};
+		admaif5: endpoint@5 {
+			remote-endpoint = <&xbar_admaif5>;
+		};
+		admaif6: endpoint@6 {
+			remote-endpoint = <&xbar_admaif6>;
+		};
+		admaif7: endpoint@7 {
+			remote-endpoint = <&xbar_admaif7>;
+		};
+		admaif8: endpoint@8 {
+			remote-endpoint = <&xbar_admaif8>;
+		};
+		admaif9: endpoint@9 {
+			remote-endpoint = <&xbar_admaif9>;
+		};
+	};
+};
+
+&tegra_ahub {
+	port@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Audio Crossbar Codec endpoints.
+		 * Connected with FE endpoints.
+		 */
+
+		xbar_admaif0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&admaif0>;
+		};
+		xbar_admaif1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&admaif1>;
+		};
+		xbar_admaif2: endpoint@2 {
+			reg = <2>;
+			remote-endpoint = <&admaif2>;
+		};
+		xbar_admaif3: endpoint@3 {
+			reg = <3>;
+			remote-endpoint = <&admaif3>;
+		};
+		xbar_admaif4: endpoint@4 {
+			reg = <4>;
+			remote-endpoint = <&admaif4>;
+		};
+		xbar_admaif5: endpoint@5 {
+			reg = <5>;
+			remote-endpoint = <&admaif5>;
+		};
+		xbar_admaif6: endpoint@6 {
+			reg = <6>;
+			remote-endpoint = <&admaif6>;
+		};
+		xbar_admaif7: endpoint@7 {
+			reg = <7>;
+			remote-endpoint = <&admaif7>;
+		};
+		xbar_admaif8: endpoint@8 {
+			reg = <8>;
+			remote-endpoint = <&admaif8>;
+		};
+		xbar_admaif9: endpoint@9 {
+			reg = <9>;
+			remote-endpoint = <&admaif9>;
+		};
+	};
+
+	xbar_port: port@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Audio crossbar CPU endpoints:
+		 * Describe connections to HW accelerators (which will
+		 * be addded going forward) and I/O interfaces (which
+		 * are specified in Platform DT files).
+		 */
+	};
+};
-- 
2.7.4
