From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: Special-case the 3D clamps on Tegra124
Date: Fri, 13 Dec 2013 17:31:04 +0100
Message-ID: <1386952264-6773-2-git-send-email-treding@nvidia.com>
References: <1386952264-6773-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386952264-6773-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

A separate register is used to remove the clamps for the GPU on
Tegra124. In order to be able to use the same API, special-case
this particular partition.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index dd0d52b329de..3d0c537d9b94 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -56,6 +56,8 @@
 #define IO_DPD2_STATUS		0x1c4
 #define SEL_DPD_TIM		0x1c8
 
+#define GPU_RG_CNTRL		0x2d4
+
 static int tegra_num_powerdomains;
 static int tegra_num_cpu_domains;
 static const u8 *tegra_cpu_domains;
@@ -152,6 +154,17 @@ int tegra_powergate_remove_clamping(int id)
 		return -EINVAL;
 
 	/*
+	 * The Tegra124 GPU has a separate register (with different semantics)
+	 * to remove clamps.
+	 */
+	if (tegra_chip_id == TEGRA124) {
+		if (id == TEGRA_POWERGATE_3D) {
+			pmc_write(0, GPU_RG_CNTRL);
+			return 0;
+		}
+	}
+
+	/*
 	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
 	 * swapped relatively to the partition ids
 	 */
-- 
1.8.4.2
