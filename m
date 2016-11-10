From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 7/8] arm64: tegra: Enable VIC on T210
Date: Thu, 10 Nov 2016 20:23:44 +0200
Message-ID: <20161110182345.31777-8-mperttunen@nvidia.com>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110182345.31777-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable the VIC (Video Image Compositor) host1x
unit on Tegra210 systems.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 46045fe..e12390f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -122,7 +122,14 @@
 		vic@54340000 {
 			compatible = "nvidia,tegra210-vic";
 			reg = <0x0 0x54340000 0x0 0x00040000>;
-			status = "disabled";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA210_CLK_VIC03>;
+			clock-names = "vic";
+			resets = <&tegra_car 178>;
+			reset-names = "vic";
+
+			iommus = <&mc TEGRA_SWGROUP_VIC>;
+			power-domains = <&pd_vic>;
 		};
 
 		nvjpg@54380000 {
@@ -692,6 +699,14 @@
 				resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
 				#power-domain-cells = <0>;
 			};
+
+			pd_vic: vic {
+				clocks = <&tegra_car TEGRA210_CLK_VIC03>;
+				clock-names = "vic";
+				resets = <&tegra_car TEGRA210_CLK_VIC03>;
+				reset-names = "vic";
+				#power-domain-cells = <0>;
+			};
 		};
 	};
 
-- 
2.10.2
