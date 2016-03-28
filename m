From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 4/5] arm64: tegra210: Add reference clock to GM20B
Date: Mon, 28 Mar 2016 18:23:03 +0900
Message-ID: <1459156984-32644-5-git-send-email-acourbot@nvidia.com>
References: <1459156984-32644-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459156984-32644-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This clock is required for the GPU to operate.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 362c269946ff..04898cb25f0c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -309,8 +309,9 @@
 			     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "stall", "nonstall";
 		clocks = <&tegra_car TEGRA210_CLK_GPU>,
-			 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>;
-		clock-names = "gpu", "pwr";
+			 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>,
+			 <&tegra_car TEGRA210_CLK_PLL_G_REF>;
+		clock-names = "gpu", "pwr", "ref";
 		resets = <&tegra_car 184>;
 		reset-names = "gpu";
 		status = "disabled";
-- 
2.7.3
