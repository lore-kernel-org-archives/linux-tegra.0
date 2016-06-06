From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/8] arm64: tegra: Add Tegra210 XUSB controller
Date: Mon,  6 Jun 2016 18:36:35 +0200
Message-ID: <20160606163637.14234-6-thierry.reding@gmail.com>
References: <20160606163637.14234-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160606163637.14234-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add a device tree node for the Tegra XUSB controller. It contains a
phandle to the XUSB pad controller for control of the PHYs assigned
to the USB ports.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 694228b9cdf4..ac1fb886ca4c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -621,6 +621,41 @@
 		status = "disabled";
 	};
 
+	usb@70090000 {
+		compatible = "nvidia,tegra210-xusb";
+		reg = <0x0 0x70090000 0x0 0x8000>,
+		      <0x0 0x70098000 0x0 0x1000>,
+		      <0x0 0x70099000 0x0 0x1000>;
+		reg-names = "hcd", "fpci", "ipfs";
+
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&tegra_car TEGRA210_CLK_XUSB_HOST>,
+			 <&tegra_car TEGRA210_CLK_XUSB_HOST_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_FALCON_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SS>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SS_DIV2>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SS_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>,
+			 <&tegra_car TEGRA210_CLK_PLL_U_480M>,
+			 <&tegra_car TEGRA210_CLK_CLK_M>,
+			 <&tegra_car TEGRA210_CLK_PLL_E>;
+		clock-names = "xusb_host", "xusb_host_src",
+			      "xusb_falcon_src", "xusb_ss",
+			      "xusb_ss_div2", "xusb_ss_src",
+			      "xusb_hs_src", "xusb_fs_src",
+			      "pll_u_480m", "clk_m", "pll_e";
+		resets = <&tegra_car 89>, <&tegra_car 156>,
+			 <&tegra_car 143>;
+		reset-names = "xusb_host", "xusb_ss", "xusb_src";
+
+		nvidia,xusb-padctl = <&padctl>;
+
+		status = "disabled";
+	};
+
 	padctl: padctl@7009f000 {
 		compatible = "nvidia,tegra210-xusb-padctl";
 		reg = <0x0 0x7009f000 0x0 0x1000>;
-- 
2.8.3
