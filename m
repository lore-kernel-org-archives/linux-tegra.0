From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 7/7] arm64: tegra: Enable IOMMU for Host1x on Tegra210
Date: Wed, 14 Dec 2016 13:16:17 +0200
Message-ID: <20161214111617.24548-8-mperttunen@nvidia.com>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214111617.24548-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Host1x driver now supports operation behind an IOMMU,
so add its IOMMU domain to the device tree.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index e12390f..8d229c7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -26,6 +26,8 @@
 
 		ranges = <0x0 0x54000000 0x0 0x54000000 0x0 0x01000000>;
 
+		iommus = <&mc TEGRA_SWGROUP_HC>;
+
 		dpaux1: dpaux@54040000 {
 			compatible = "nvidia,tegra210-dpaux";
 			reg = <0x0 0x54040000 0x0 0x00040000>;
-- 
2.10.2
