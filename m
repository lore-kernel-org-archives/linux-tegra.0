From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: Tegra: dt: HACK: Support Seaboard not Harmony
Date: Sat, 23 Apr 2011 22:35:24 -0600
Message-ID: <1303619724-27652-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

(Do not apply)

This is only necessary at present since the devicetree support relies on
some aspects of some existing hard-coded board file for some parts of
initialization. In the long run, that code can be ported to devicetree
too.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I needed to test devicetree support on Tegra Seaboard rather than Harmony.
This patch is the changes I needed to make to have that work. It builds on
the previous patches I recently posted. It's only an FYI just in case
anyone else finds it useful. 

 arch/arm/boot/dts/tegra-harmony.dts |   14 ++++++--------
 arch/arm/mach-tegra/board-dt.c      |   14 ++------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index 82fa0c2..6fe09d7 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -9,7 +9,8 @@
 	interrupt-parent = <&intc>;
 
 	chosen {
-		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootdelay=2";
+		/*bootargs = "            vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootdelay=2";*/
+		bootargs   = "earlyprintk                            console=ttyS0,115200n8 root=/dev/mmcblk1p3 ro rootwait noinitrd lp0_vec=0x2000@0x1C406000 loglevel=8 kcrashmem=0x100000@0x02000000 mem=384M@0M nvmem=128M@384M mem=512M@512M";
 	};
 
 	memory {
@@ -90,24 +91,21 @@
 		compatible = "nvidia,tegra250-sdhci";
 		reg = <0xc8000200 0x200>;
 		interrupts = < 47 >;
-		gpios = <&gpio 69 0>, /* cd, gpio PI5 */
-			<&gpio 57 0>, /* wp, gpio PH1 */
-			<&gpio 155 0>; /* power, gpio PT3 */
+		status = "disabled";
 	};
 
 	sdhci@c8000400 {
 		compatible = "nvidia,tegra250-sdhci";
 		reg = <0xc8000400 0x200>;
 		interrupts = < 51 >;
-		status = "disabled";
+		gpios = <&gpio 69 0>, /* cd, gpio PI5 */
+			<&gpio 57 0>, /* wp, gpio PH1 */
+			<&gpio 70 0>; /* power, gpio PI6 */
 	};
 
 	sdhci@c8000600 {
 		compatible = "nvidia,tegra250-sdhci";
 		reg = <0xc8000600 0x200>;
 		interrupts = < 63 >;
-		gpios = <&gpio 58 0>, /* cd, gpio PH2 */
-			<&gpio 59 0>, /* wp, gpio PH3 */
-			<&gpio 70 0>; /* power, gpio PI6 */
 	};
 };
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index 7b9d469..b67c382 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -36,7 +36,7 @@
 #include <mach/irqs.h>
 
 #include "board.h"
-#include "board-harmony.h"
+#include "board-seaboard.h"
 #include "clock.h"
 
 static struct resource sdhci_resource1[] = {
@@ -126,16 +126,6 @@ static struct platform_device *harmony_devices[] __initdata = {
 	&tegra_sdhci_device4,
 };
 
-static void __init tegra_dt_fixup(struct machine_desc *desc,
-	struct tag *tags, char **cmdline, struct meminfo *mi)
-{
-	mi->nr_banks = 2;
-	mi->bank[0].start = PHYS_OFFSET;
-	mi->bank[0].size = 448 * SZ_1M;
-	mi->bank[1].start = SZ_512M;
-	mi->bank[1].size = SZ_512M;
-}
-
 static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "uartd",	"pll_p",	216000000,	true },
@@ -158,7 +148,7 @@ static void __init tegra_dt_init(void)
 
 	tegra_clk_init_from_table(tegra_dt_clk_init_table);
 
-	harmony_pinmux_init();
+	seaboard_pinmux_init();
 
 	platform_add_devices(harmony_devices, ARRAY_SIZE(harmony_devices));
 
-- 
1.7.1
