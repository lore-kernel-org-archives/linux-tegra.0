From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 65/73] arm64: tegra: Do not mark display hub as simple bus
Date: Tue, 16 Jun 2020 15:52:30 +0200
Message-ID: <20200616135238.3001888-66-thierry.reding@gmail.com>
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

The display hub on Tegra186 and Tegra194 is not a simple bus, so drop
the corresponding compatible string.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index a73050ec61a7..3a41203deba2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -990,7 +990,7 @@ i2c-bus {
 		};
 
 		display-hub@15200000 {
-			compatible = "nvidia,tegra186-display", "simple-bus";
+			compatible = "nvidia,tegra186-display";
 			reg = <0x15200000 0x00040000>;
 			resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_MISC>,
 				 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP0>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4d6f2127dd4a..3089ebecfbef 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1055,7 +1055,7 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 
 			display-hub@15200000 {
-				compatible = "nvidia,tegra194-display", "simple-bus";
+				compatible = "nvidia,tegra194-display";
 				reg = <0x15200000 0x00040000>;
 				resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_MISC>,
 					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP0>,
-- 
2.24.1
