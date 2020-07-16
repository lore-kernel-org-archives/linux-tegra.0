From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] arm64: tegra: Add the GPU on Tegra194
Date: Thu, 16 Jul 2020 14:01:38 +0200
Message-ID: <20200716120138.532906-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Debarshi Dutta <ddutta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The GPU found on NVIDIA Tegra194 SoCs is a Volta generation GPU called
GV11B.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 259e40469908..f559fe983ebe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1395,6 +1395,39 @@ sor3: sor@15bc0000 {
 				nvidia,interface = <3>;
 			};
 		};
+
+		gpu@17000000 {
+			compatible = "nvidia,gv11b";
+			reg = <0x17000000 0x10000000>,
+			      <0x18000000 0x10000000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "stall", "nonstall";
+			clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
+				 <&bpmp TEGRA194_CLK_GPU_PWR>;
+			clock-names = "gpu", "pwr";
+			resets = <&bpmp TEGRA194_RESET_GPU>;
+			reset-names = "gpu";
+			status = "disabled";
+
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
+			interconnect-names = "dma-mem", "read-0-hp", "write-0",
+					     "read-1", "read-1-hp", "write-1",
+					     "read-2", "read-2-hp", "write-2",
+					     "read-3", "read-3-hp", "write-3";
+		};
 	};
 
 	pcie@14100000 {
-- 
2.27.0
