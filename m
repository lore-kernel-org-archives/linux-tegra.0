From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 73/73] arm64: tegra: Fix order of XUSB controller clocks
Date: Tue, 16 Jun 2020 15:52:38 +0200
Message-ID: <20200616135238.3001888-74-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is purely to make the json-schema validation tools happy because
they cannot deal with string arrays that may be in arbitrary order.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index c265211f8a84..b9c6ba707ef9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -997,8 +997,8 @@ usb@70090000 {
 			 <&tegra_car TEGRA210_CLK_XUSB_HOST_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_FALCON_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_SS>,
-			 <&tegra_car TEGRA210_CLK_XUSB_SS_DIV2>,
 			 <&tegra_car TEGRA210_CLK_XUSB_SS_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SS_DIV2>,
 			 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>,
 			 <&tegra_car TEGRA210_CLK_PLL_U_480M>,
@@ -1006,7 +1006,7 @@ usb@70090000 {
 			 <&tegra_car TEGRA210_CLK_PLL_E>;
 		clock-names = "xusb_host", "xusb_host_src",
 			      "xusb_falcon_src", "xusb_ss",
-			      "xusb_ss_div2", "xusb_ss_src",
+			      "xusb_ss_src", "xusb_ss_div2",
 			      "xusb_hs_src", "xusb_fs_src",
 			      "pll_u_480m", "clk_m", "pll_e";
 		resets = <&tegra_car 89>, <&tegra_car 156>,
-- 
2.24.1
