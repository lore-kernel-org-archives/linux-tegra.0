From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm64: tegra: Drop clock and reset names for XUSB powergates
Date: Tue, 16 Aug 2016 14:40:57 +0100
Message-ID: <1471354857-1408-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Drop the clock and reset names for the Tegra210 XUSB powergates because
these are not currently used and not required by the Tegra PMC binding
documentation.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index c4cfdcf60d26..a3d17d154915 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -650,25 +650,19 @@
 
 			pd_xusbss: xusba {
 				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
-				clock-names = "xusb-ss";
 				resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
-				reset-names = "xusb-ss";
 				#power-domain-cells = <0>;
 			};
 
 			pd_xusbdev: xusbb {
 				clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>;
-				clock-names = "xusb-dev";
 				resets = <&tegra_car 95>;
-				reset-names = "xusb-dev";
 				#power-domain-cells = <0>;
 			};
 
 			pd_xusbhost: xusbc {
 				clocks = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
-				clock-names = "xusb-host";
 				resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
-				reset-names = "xusb-host";
 				#power-domain-cells = <0>;
 			};
 		};
-- 
2.1.4
