From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: tegra20: Rename USB UTMI parameters according to new definitions
Date: Wed, 26 Jun 2013 14:58:46 +0300
Message-ID: <1372247927-28470-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9653fd8..e457083 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -477,13 +477,13 @@
 			 <&tegra_car TEGRA20_CLK_USBD>;
 		clock-names = "reg", "pll_u", "timer", "utmi-pads";
 		nvidia,has-legacy-mode;
-		hssync_start_delay = <9>;
-		idle_wait_delay = <17>;
-		elastic_limit = <16>;
-		term_range_adj = <6>;
-		xcvr_setup = <9>;
-		xcvr_lsfslew = <1>;
-		xcvr_lsrslew = <1>;
+		nvidia,hssync-start-delay = <9>;
+		nvidia,idle-wait-delay = <17>;
+		nvidia,elastic-limit = <16>;
+		nvidia,term-range-adj = <6>;
+		nvidia,xcvr-setup = <9>;
+		nvidia,xcvr-lsfslew = <1>;
+		nvidia,xcvr-lsrslew = <1>;
 		status = "disabled";
 	};
 
@@ -527,13 +527,13 @@
 			 <&tegra_car TEGRA20_CLK_CLK_M>,
 			 <&tegra_car TEGRA20_CLK_USBD>;
 		clock-names = "reg", "pll_u", "timer", "utmi-pads";
-		hssync_start_delay = <9>;
-		idle_wait_delay = <17>;
-		elastic_limit = <16>;
-		term_range_adj = <6>;
-		xcvr_setup = <9>;
-		xcvr_lsfslew = <2>;
-		xcvr_lsrslew = <2>;
+		nvidia,hssync-start-delay = <9>;
+		nvidia,idle-wait-delay = <17>;
+		nvidia,elastic-limit = <16>;
+		nvidia,term-range-adj = <6>;
+		nvidia,xcvr-setup = <9>;
+		nvidia,xcvr-lsfslew = <2>;
+		nvidia,xcvr-lsrslew = <2>;
 		status = "disabled";
 	};
 
-- 
1.8.1.5
