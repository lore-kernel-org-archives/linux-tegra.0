From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 3/3] arm64: tegra210: Add XUSB powergates
Date: Tue, 28 Jun 2016 12:20:44 +0100
Message-ID: <1467112844-26927-4-git-send-email-jonathanh@nvidia.com>
References: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467112844-26927-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra210 XUSB subsystem has 3 power partitions which are XUSBA
(super-speed logic), XUSBB (USB device logic) and XUSBC (USB host
logic). Populate the device-tree nodes for these XUSB partitions.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 65b829b762bb..efb0fd98b789 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -670,6 +670,30 @@
 					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
 				#power-domain-cells = <0>;
 			};
+
+			pd_xusbss: xusba {
+				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+				clock-names = "xusb_ss";
+				resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+				reset-names = "xusb_ss";
+				#power-domain-cells = <0>;
+			};
+
+			pd_xusbdev: xusbb {
+				clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>;
+				clock-names = "xusb_dev";
+				resets = <&tegra_car 95>;
+				reset-names = "xusb_dev";
+				#power-domain-cells = <0>;
+			};
+
+			pd_xusbhost: xusbc {
+				clocks = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
+				clock-names = "xusb_host";
+				resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
+				reset-names = "xusb_host";
+				#power-domain-cells = <0>;
+			};
 		};
 	};
 
-- 
2.1.4
