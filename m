From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/4] arm64: tegra210: Add XUSB powergates
Date: Thu, 30 Jun 2016 11:56:27 +0100
Message-ID: <1467284187-13320-5-git-send-email-jonathanh@nvidia.com>
References: <1467284187-13320-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467284187-13320-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra210 XUSB subsystem has 3 power partitions which are XUSBA
(super-speed logic), XUSBB (USB device logic) and XUSBC (USB host
logic). Populate the device-tree nodes for these XUSB partitions.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
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
