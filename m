From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 10/10] arm64: tegra: Audio graph sound card for Jetson Nano and TX1
Date: Sun, 19 Jul 2020 10:40:17 +0530
Message-ID: <1595135417-16589-11-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595135417-16589-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable support for audio-graph based sound card on Jetson-Nano and
Jetson-TX1. Depending on the platform, required I/O interfaces are
enabled.

 * Jetson-Nano: Enable I2S3, I2S4, DMIC1 and DMIC2.
 * Jetson-TX1: Enable all I2S and DMIC interfaces.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 196 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 110 ++++++++++++
 2 files changed, 306 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 56adf28..d228f02 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -3,6 +3,7 @@
 
 #include "tegra210-p2180.dtsi"
 #include "tegra210-p2597.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson TX1 Developer Kit";
@@ -126,4 +127,199 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		dais = /* FE */
+		       <&admaif_port>,
+		       /* Router */
+		       <&xbar_port>,
+		       /* I/O DAP Ports */
+		       <&i2s1_port>, <&i2s2_port>, <&i2s3_port>, <&i2s4_port>, <&i2s5_port>,
+		       <&dmic1_port>, <&dmic2_port>, <&dmic3_port>;
+
+		label = "jetson-tx1-ape";
+	};
+};
+
+&tegra_admaif {
+	status = "okay";
+};
+
+&tegra_ahub {
+	status = "okay";
+
+	port@1 {
+		xbar_i2s1: endpoint@a {
+			reg = <0xa>;
+			remote-endpoint = <&i2s1_cif>;
+		};
+		xbar_i2s2: endpoint@b {
+			reg = <0xb>;
+			remote-endpoint = <&i2s2_cif>;
+		};
+		xbar_i2s3: endpoint@c {
+			reg = <0xc>;
+			remote-endpoint = <&i2s3_cif>;
+		};
+		xbar_i2s4: endpoint@d {
+			reg = <0xd>;
+			remote-endpoint = <&i2s4_cif>;
+		};
+		xbar_i2s5: endpoint@e {
+			reg = <0xe>;
+			remote-endpoint = <&i2s5_cif>;
+		};
+		xbar_dmic1: endpoint@f {
+			reg = <0xf>;
+			remote-endpoint = <&dmic1_cif>;
+		};
+		xbar_dmic2: endpoint@10 {
+			reg = <0x10>;
+			remote-endpoint = <&dmic2_cif>;
+		};
+		xbar_dmic3: endpoint@11 {
+			reg = <0x11>;
+			remote-endpoint = <&dmic3_cif>;
+		};
+	};
+};
+
+&tegra_i2s1 {
+	status = "okay";
+
+	port@0 {
+		i2s1_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s1>;
+		};
+	};
+
+	i2s1_port: port@1 {
+		i2s1_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s2 {
+	status = "okay";
+
+	port@0 {
+		i2s2_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s2>;
+		};
+	};
+
+	i2s2_port: port@1 {
+		i2s2_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	port@0 {
+		i2s3_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s3>;
+		};
+	};
+
+	i2s3_port: port@1 {
+		i2s3_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	port@0 {
+		i2s4_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s4>;
+		};
+	};
+
+	i2s4_port: port@1 {
+		i2s4_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s5 {
+	status = "okay";
+
+	port@0 {
+		i2s5_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s5>;
+		};
+	};
+
+	i2s5_port: port@1 {
+		i2s5_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	port@0 {
+		dmic1_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic1>;
+		};
+	};
+
+	dmic1_port: port@1 {
+		dmic1_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	port@0 {
+		dmic2_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic2>;
+		};
+	};
+
+	dmic2_port: port@1 {
+		dmic2_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic3 {
+	status = "okay";
+
+	port@0 {
+		dmic3_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic3>;
+		};
+	};
+
+	dmic3_port: port@1 {
+		dmic3_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 0325fc0..0226297 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 #include "tegra210.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson Nano Developer Kit";
@@ -818,4 +819,113 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		dais = /* FE */
+		       <&admaif_port>,
+		       /* Router */
+		       <&xbar_port>,
+		       /* I/O DAP Ports */
+		       <&i2s3_port>, <&i2s4_port>,
+		       <&dmic1_port>, <&dmic2_port>;
+
+		label = "jetson-nano-ape";
+	};
+};
+
+&tegra_admaif {
+	status = "okay";
+};
+
+&tegra_ahub {
+	status = "okay";
+
+	port@1 {
+		xbar_i2s3: endpoint@c {
+			reg = <0xc>;
+			remote-endpoint = <&i2s3_cif>;
+		};
+		xbar_i2s4: endpoint@d {
+			reg = <0xd>;
+			remote-endpoint = <&i2s4_cif>;
+		};
+		xbar_dmic1: endpoint@f {
+			reg = <0xf>;
+			remote-endpoint = <&dmic1_cif>;
+		};
+		xbar_dmic2: endpoint@10 {
+			reg = <0x10>;
+			remote-endpoint = <&dmic2_cif>;
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	port@0 {
+		i2s3_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s3>;
+		};
+	};
+
+	i2s3_port: port@1 {
+		i2s3_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	port@0 {
+		i2s4_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s4>;
+		};
+	};
+
+	i2s4_port: port@1 {
+		i2s4_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	port@0 {
+		dmic1_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic1>;
+		};
+	};
+
+	dmic1_port: port@1 {
+		dmic1_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	port@0 {
+		dmic2_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic2>;
+		};
+	};
+
+	dmic2_port: port@1 {
+		dmic2_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
 };
-- 
2.7.4
