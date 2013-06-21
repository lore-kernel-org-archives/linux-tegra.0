From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: Fix Beaver's PCIe lane configuration
Date: Fri, 21 Jun 2013 14:23:52 -0600
Message-ID: <1371846232-31163-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Beaver's PCIe lane configuration most closely matches x2 x2 x2 rather
than x4 x1 x1, since clocks 0 and 2 are used, and lanes 0 and 5 are used,
and the only way those align is with a x2 x2 x2 configuration.

Also, disable root port 1; there's nothing connected to it. Root port 0
is the on-board PCIe Ethernet, and port 2 is the mini-PCIe slot.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This is to be applied to Thierry's WIP PCIe driver branch.

 arch/arm/boot/dts/tegra30-beaver.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index c42dd9b..e0b8e9c 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -18,16 +18,16 @@
 
 		pci@1,0 {
 			status = "okay";
-			nvidia,num-lanes = <4>;
+			nvidia,num-lanes = <2>;
 		};
 
 		pci@2,0 {
-			status = "okay";
-			nvidia,num-lanes = <1>;
+			nvidia,num-lanes = <2>;
 		};
 
 		pci@3,0 {
-			nvidia,num-lanes = <1>;
+			status = "okay";
+			nvidia,num-lanes = <2>;
 		};
 	};
 
-- 
1.8.1.5
