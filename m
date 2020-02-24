From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM64: tegra: Populate LP8557 backlight regulator
Date: Mon, 24 Feb 2020 14:34:36 +0000
Message-ID: <20200224143436.5438-4-jonathanh@nvidia.com>
References: <20200224143436.5438-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200224143436.5438-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following warning is observed on Jetson TX1 platform because the
supply regulator is not specified for the backlight.

 WARNING KERN lp855x 0-002c: 0-002c supply power not found, using dummy regulator

The backlight supply is provided by the 3.3V SYS rail and so add this
as the supply for the backlight.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index c70a610f8e3a..ea0e1efa6973 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -56,6 +56,7 @@
 		backlight: backlight@2c {
 			compatible = "ti,lp8557";
 			reg = <0x2c>;
+			power-supply = <&vdd_3v3_sys>;
 
 			dev-ctrl = /bits/ 8 <0x80>;
 			init-brt = /bits/ 8 <0xff>;
-- 
2.17.1
