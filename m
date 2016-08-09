From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/7] arm64: tegra: Add AGIC node for Tegra210
Date: Tue, 9 Aug 2016 16:21:16 +0100
Message-ID: <1470756082-19099-2-git-send-email-jonathanh@nvidia.com>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470756082-19099-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Populate the Audio GIC (AGIC) node for Tegra210. This interrupt
controller is used by the Audio Processing Engine to route interrupts
to the main CPU interrupt controller. The AGIC is based on the ARM
GIC400 and so uses the clock name "clk" as specified by the GIC binding
document for GIC400 devices.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index c4cfdcf60d26..f9b0759e4f9d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -961,6 +961,18 @@
 		#size-cells = <1>;
 		ranges = <0x702c0000 0x0 0x702c0000 0x00040000>;
 		status = "disabled";
+
+		tegra_agic: agic@702f9000 {
+			compatible = "nvidia,tegra210-agic";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x702f9000 0x2000>,
+			      <0x702fa000 0x2000>;
+			interrupts = <0 102 0xf04>;
+			clocks = <&tegra_car TEGRA210_CLK_APE>;
+			clock-names = "clk";
+			status = "disabled";
+		};
 	};
 
 	spi@70410000 {
-- 
2.1.4
