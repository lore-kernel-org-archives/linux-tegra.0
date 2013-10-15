From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 12/13] ARM: tegra: Use symbolic names for gr3d clocks
Date: Tue, 15 Oct 2013 17:28:02 +0200
Message-ID: <1381850883-12722-13-git-send-email-treding@nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Commit 05849c9381354be4bd4a2a878b5ecb12d375a1a0 (ARM: tegra30: convert
device tree files to use CLK defines) updated the Tegra30 device tree to
use symbolic clock names but forgot to update this node.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index d3d71ab..2bd55cf 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -136,7 +136,8 @@
 		gr3d {
 			compatible = "nvidia,tegra30-gr3d";
 			reg = <0x54180000 0x00040000>;
-			clocks = <&tegra_car 24 &tegra_car 98>;
+			clocks = <&tegra_car TEGRA30_CLK_GR3D
+				  &tegra_car TEGRA30_CLK_GR3D2>;
 			clock-names = "3d", "3d2";
 		};
 
-- 
1.8.4
