From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] ARM64: tegra: Fix Tegra186 SOR supply
Date: Mon, 24 Feb 2020 14:34:35 +0000
Message-ID: <20200224143436.5438-3-jonathanh@nvidia.com>
References: <20200224143436.5438-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200224143436.5438-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The following warning is observed on the Jetson TX2 platform ...

 WARNING KERN tegra-sor 15540000.sor: 15540000.sor supply \
              vdd-hdmi-dp-pll not found, using dummy regulator

The problem is caused because the regulator for the SOR device is
missing the '-supply' suffix in Device-Tree. Therefore, add the
'-supply' suffix to fix this warning.

Fixes: 3fdfaf8718fa arm64: tegra: Enable DP support on Jetson TX2

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 961b1be0c56b..1af7f9ffb7b6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -278,7 +278,7 @@
 			status = "okay";
 
 			avdd-io-hdmi-dp-supply = <&vdd_hdmi_1v05>;
-			vdd-hdmi-dp-pll = <&vdd_1v8_ap>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8_ap>;
 
 			nvidia,dpaux = <&dpaux>;
 		};
-- 
2.17.1
