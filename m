From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 9/9] arm64: tegra: enable AHUB modules for few Tegra chips
Date: Mon, 20 Jan 2020 19:53:18 +0530
Message-ID: <1579530198-13431-10-git-send-email-spujar@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1579530198-13431-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch enables AHUB, ADMAIF modules for following Tegra platforms.
Along with this specific instances of I/O modules are enabled as per
the board design.

 * Jetson TX1
   - I2S1, I2S2, I2S3, I2S4 and I2S5
   - DMIC1, DMIC2 and DMIC3

 * Jetson TX2
   - I2S1, I2S2, I2S3, I2S4, I2S5 and I2S6
   - DMIC1, DMIC2 and DMIC3
   - DSPK2

 * Jetson AGX Xavier
   - I2S1, I2S2, I2S4 and I2S6
   - DMIC2 and DMIC3
   - DSPK1

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 48 ++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 36 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 40 ++++++++++++++++++
 3 files changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index f1de4ff..717993c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -20,6 +20,54 @@
 		interrupt-controller@2a40000 {
 			status = "okay";
 		};
+
+		ahub@2900800 {
+			status = "okay";
+
+			admaif@290f000 {
+				status = "okay";
+			};
+
+			i2s@2901000 {
+				status = "okay";
+			};
+
+			i2s@2901100 {
+				status = "okay";
+			};
+
+			i2s@2901200 {
+				status = "okay";
+			};
+
+			i2s@2901300 {
+				status = "okay";
+			};
+
+			i2s@2901400 {
+				status = "okay";
+			};
+
+			i2s@2901500 {
+				status = "okay";
+			};
+
+			dmic@2904000 {
+				status = "okay";
+			};
+
+			dmic@2904100 {
+				status = "okay";
+			};
+
+			dmic@2904200 {
+				status = "okay";
+			};
+
+			dspk@2905100 {
+				status = "okay";
+			};
+		};
 	};
 
 	i2c@3160000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 985e7d8..f5d5832 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -21,6 +21,42 @@
 			interrupt-controller@2a40000 {
 				status = "okay";
 			};
+
+			ahub@2900800 {
+				status = "okay";
+
+				admaif@290f000 {
+					status = "okay";
+				};
+
+				i2s@2901000 {
+					status = "okay";
+				};
+
+				i2s@2901100 {
+					status = "okay";
+				};
+
+				i2s@2901300 {
+					status = "okay";
+				};
+
+				i2s@2901500 {
+					status = "okay";
+				};
+
+				dmic@2904100 {
+					status = "okay";
+				};
+
+				dmic@2904200 {
+					status = "okay";
+				};
+
+				dspk@2905000 {
+					status = "okay";
+				};
+			};
 		};
 
 		ddc: i2c@31c0000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index a3cafe3..c8d2c21 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -123,5 +123,45 @@
 		agic@702f9000 {
 			status = "okay";
 		};
+
+		ahub@702d0800 {
+			status = "okay";
+
+			admaif@702d0000 {
+				status = "okay";
+			};
+
+			i2s@702d1000 {
+				status = "okay";
+			};
+
+			i2s@702d1100 {
+				status = "okay";
+			};
+
+			i2s@702d1200 {
+				status = "okay";
+			};
+
+			i2s@702d1300 {
+				status = "okay";
+			};
+
+			i2s@702d1400 {
+				status = "okay";
+			};
+
+			dmic@702d4000 {
+				status = "okay";
+			};
+
+			dmic@702d4100 {
+				status = "okay";
+			};
+
+			dmic@702d4200 {
+				status = "okay";
+			};
+		};
 	};
 };
-- 
2.7.4
