From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/11] arm64: tegra: Add PMC controller on Tegra186
Date: Thu, 23 Feb 2017 18:30:43 +0100
Message-ID: <20170223173053.19701-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 62fa85ae0271..d6955bb46ae0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -307,6 +307,15 @@
 		#interrupt-cells = <2>;
 	};
 
+	pmc@c360000 {
+		compatible = "nvidia,tegra186-pmc";
+		reg = <0 0x0c360000 0 0x10000>,
+		      <0 0x0c370000 0 0x10000>,
+		      <0 0x0c380000 0 0x10000>,
+		      <0 0x0c390000 0 0x10000>;
+		reg-names = "pmc", "wake", "aotag", "scratch";
+	};
+
 	sysram@30000000 {
 		compatible = "nvidia,tegra186-sysram", "mmio-sram";
 		reg = <0x0 0x30000000 0x0 0x50000>;
-- 
2.11.1
