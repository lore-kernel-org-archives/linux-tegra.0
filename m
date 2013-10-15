From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 11/13] ARM: tegra: Add Tegra114 gr3d support
Date: Tue, 15 Oct 2013 17:28:01 +0200
Message-ID: <1381850883-12722-12-git-send-email-treding@nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add the gr3d device tree node. The gr3d block on Tegra114 is backwards-
compatible with the one on Tegra20.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index d8a3d61..710c542 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -34,6 +34,12 @@
 			clocks = <&tegra_car TEGRA114_CLK_GR2D>;
 		};
 
+		gr3d@54180000 {
+			compatible = "nvidia,tegra114-gr3d", "nvidia,tegra20-gr3d";
+			reg = <0x54180000 0x00040000>;
+			clocks = <&tegra_car TEGRA114_CLK_GR3D>;
+		};
+
 		dc@54200000 {
 			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
 			reg = <0x54200000 0x00040000>;
-- 
1.8.4
