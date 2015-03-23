From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] soc/tegra: Remove duplicate powergate definitions
Date: Mon, 23 Mar 2015 11:50:02 +0100
Message-ID: <1427107802-3266-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The defines for the powergate partitions are already defined in the DT
bindings header, so include that rather than duplicating the list in a
second header file.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/soc/tegra/pmc.h | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 75878006174f..c39edb9383f1 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -21,6 +21,7 @@
 
 #include <linux/reboot.h>
 
+#include <dt-bindings/power/tegra-powergate.h>
 #include <soc/tegra/pm.h>
 
 struct clk;
@@ -44,39 +45,6 @@ int tegra_pmc_cpu_remove_clamping(int cpuid);
  * powergate and I/O rail APIs
  */
 
-#define TEGRA_POWERGATE_CPU	0
-#define TEGRA_POWERGATE_3D	1
-#define TEGRA_POWERGATE_VENC	2
-#define TEGRA_POWERGATE_PCIE	3
-#define TEGRA_POWERGATE_VDEC	4
-#define TEGRA_POWERGATE_L2	5
-#define TEGRA_POWERGATE_MPE	6
-#define TEGRA_POWERGATE_HEG	7
-#define TEGRA_POWERGATE_SATA	8
-#define TEGRA_POWERGATE_CPU1	9
-#define TEGRA_POWERGATE_CPU2	10
-#define TEGRA_POWERGATE_CPU3	11
-#define TEGRA_POWERGATE_CELP	12
-#define TEGRA_POWERGATE_3D1	13
-#define TEGRA_POWERGATE_CPU0	14
-#define TEGRA_POWERGATE_C0NC	15
-#define TEGRA_POWERGATE_C1NC	16
-#define TEGRA_POWERGATE_SOR	17
-#define TEGRA_POWERGATE_DIS	18
-#define TEGRA_POWERGATE_DISB	19
-#define TEGRA_POWERGATE_XUSBA	20
-#define TEGRA_POWERGATE_XUSBB	21
-#define TEGRA_POWERGATE_XUSBC	22
-#define TEGRA_POWERGATE_VIC	23
-#define TEGRA_POWERGATE_IRAM	24
-#define TEGRA_POWERGATE_NVDEC	25
-#define TEGRA_POWERGATE_NVJPG	26
-#define TEGRA_POWERGATE_AUD	27
-#define TEGRA_POWERGATE_DFD	28
-#define TEGRA_POWERGATE_VE2	29
-
-#define TEGRA_POWERGATE_3D0	TEGRA_POWERGATE_3D
-
 #define TEGRA_IO_RAIL_CSIA	0
 #define TEGRA_IO_RAIL_CSIB	1
 #define TEGRA_IO_RAIL_DSI	2
-- 
2.3.2
