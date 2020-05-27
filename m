From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RESEND PATCH v3 1/2] arm64: dts: tegra: Rename sysram node to "sram"
Date: Wed, 27 May 2020 21:36:49 +0200
Message-ID: <20200527193650.17617-1-krzk@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The device node name should reflect generic class of a device so rename
the "sysram" node to "sram".  This will be also in sync with upcoming DT
schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 58100fb9cd8b..3ed7d7a26219 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1213,7 +1213,7 @@
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
 	};
 
-	sysram@30000000 {
+	sram@30000000 {
 		compatible = "nvidia,tegra186-sysram", "mmio-sram";
 		reg = <0x0 0x30000000 0x0 0x50000>;
 		#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4bc187a4eacd..0533c45b9237 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1737,7 +1737,7 @@
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 	};
 
-	sysram@40000000 {
+	sram@40000000 {
 		compatible = "nvidia,tegra194-sysram", "mmio-sram";
 		reg = <0x0 0x40000000 0x0 0x50000>;
 		#address-cells = <1>;
-- 
2.17.1
