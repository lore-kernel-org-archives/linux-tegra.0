From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] ARM: tegra: jetson-tk1: mark eMMC as non-removable
Date: Tue,  3 Jun 2014 14:48:46 +0200
Message-ID: <1401799726-8161-1-git-send-email-l.stach@pengutronix.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The eMMC is soldered to the board, reflect this in the DT.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index e31fb61a81d3..16082c0bdaca 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1633,6 +1633,7 @@
 	sdhci@0,700b0600 {
 		status = "okay";
 		bus-width = <8>;
+		non-removable;
 	};
 
 	ahub@0,70300000 {
-- 
2.0.0.rc2
