From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 4/4] arm64: tegra: Add ACONNECT bus node for Tegra210
Date: Tue, 10 May 2016 12:35:40 +0100
Message-ID: <1462880140-5938-5-git-send-email-jonathanh@nvidia.com>
References: <1462880140-5938-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462880140-5938-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the ACONNECT bus node for Tegra210 which is used to interface to
the various devices in the Audio Processing Engine (APE).

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index d649aef0455f..4f1923542558 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -682,6 +682,18 @@
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
+	aconnect@702c0000 {
+		compatible = "nvidia,tegra210-aconnect";
+		clocks = <&tegra_car TEGRA210_CLK_APE>,
+			 <&tegra_car TEGRA210_CLK_APB2APE>;
+		clock-names = "ape", "apb2ape";
+		power-domains = <&pd_audio>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x702c0000 0x0 0x702c0000 0x00040000>;
+		status = "disabled";
+	};
+
 	spi@70410000 {
 		compatible = "nvidia,tegra210-qspi";
 		reg = <0x0 0x70410000 0x0 0x1000>;
-- 
2.1.4
