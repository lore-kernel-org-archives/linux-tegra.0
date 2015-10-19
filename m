From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra210: gpu: configure WPR region
Date: Mon, 19 Oct 2015 13:57:04 +0900
Message-ID: <1445230624-30314-5-git-send-email-acourbot@nvidia.com>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445230624-30314-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T210's GPU secure firmware loading requires a write-protected region
to be set up.

This patch reserves the upper 256KB of RAM as the WPR region and locks
it so the kernel can initiate secure firmware loading.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/include/asm/arch-tegra210/mc.h | 12 +++++++++
 arch/arm/mach-tegra/board.c             |  4 +++
 arch/arm/mach-tegra/gpu.c               | 47 ++++++++++++++++++++++++++++++++-
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/arch-tegra210/mc.h b/arch/arm/include/asm/arch-tegra210/mc.h
index 77e9aa51f60f..e6d1758d372f 100644
--- a/arch/arm/include/asm/arch-tegra210/mc.h
+++ b/arch/arm/include/asm/arch-tegra210/mc.h
@@ -62,6 +62,16 @@ struct mc_ctlr {
 	u32 mc_video_protect_bom;		/* offset 0x648 */
 	u32 mc_video_protect_size_mb;		/* offset 0x64c */
 	u32 mc_video_protect_reg_ctrl;		/* offset 0x650 */
+	u32 reserved11[385];			/* offset 0x654 - 0xc54 */
+	u32 mc_security_carveout2_cfg0;		/* offset 0xc58 */
+	u32 mc_security_carveout2_bom;		/* offset 0xc5c */
+	u32 mc_security_carveout2_bom_hi;	/* offset 0xc60 */
+	u32 mc_security_carveout2_size_128k;	/* offset 0xc64 */
+	u32 reserved12[16];			/* offset 0xc68 - 0xca4 */
+	u32 mc_security_carveout3_cfg0;		/* offset 0xca8 */
+	u32 mc_security_carveout3_bom;		/* offset 0xcac */
+	u32 mc_security_carveout3_bom_hi;	/* offset 0xcb0 */
+	u32 mc_security_carveout3_size_128k;	/* offset 0xcb4 */
 };
 
 #define TEGRA_MC_SMMU_CONFIG_ENABLE (1 << 0)
@@ -69,4 +79,6 @@ struct mc_ctlr {
 #define TEGRA_MC_VIDEO_PROTECT_REG_WRITE_ACCESS_ENABLED		(0 << 0)
 #define TEGRA_MC_VIDEO_PROTECT_REG_WRITE_ACCESS_DISABLED	(1 << 0)
 
+#define TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED			(1 << 1)
+
 #endif	/* _TEGRA210_MC_H_ */
diff --git a/arch/arm/mach-tegra/board.c b/arch/arm/mach-tegra/board.c
index b00e4b5c1e25..0bff063b00f4 100644
--- a/arch/arm/mach-tegra/board.c
+++ b/arch/arm/mach-tegra/board.c
@@ -111,6 +111,10 @@ static phys_size_t query_sdram_size(void)
 	if (size_bytes == SZ_2G)
 		size_bytes -= SZ_1M;
 #endif
+#if defined(CONFIG_TEGRA210)
+	/* Reserve GPU WPR area, 2 * 128KB */
+	size_bytes = round_down(size_bytes - (SZ_128K * 2), SZ_128K);
+#endif
 
 	return size_bytes;
 }
diff --git a/arch/arm/mach-tegra/gpu.c b/arch/arm/mach-tegra/gpu.c
index c7d705d8efe9..61d734fd5767 100644
--- a/arch/arm/mach-tegra/gpu.c
+++ b/arch/arm/mach-tegra/gpu.c
@@ -23,9 +23,11 @@
 
 #include <fdt_support.h>
 
+DECLARE_GLOBAL_DATA_PTR;
+
 static bool _configured;
 
-void tegra_gpu_config(void)
+static void config_vpr(void)
 {
 	struct mc_ctlr *mc = (struct mc_ctlr *)NV_PA_MC_BASE;
 
@@ -37,6 +39,49 @@ void tegra_gpu_config(void)
 	readl(&mc->mc_video_protect_reg_ctrl);
 
 	debug("configured VPR\n");
+}
+
+#if defined(CONFIG_TEGRA210)
+static void config_wpr(void)
+{
+	struct mc_ctlr *mc = (struct mc_ctlr *)NV_PA_MC_BASE;
+	u64 wpr_start = NV_PA_SDRAM_BASE + gd->ram_size;
+	u32 reg;
+
+	/*
+	 * Carveout2 uses the upper 256KB of upper memory that we reserved as
+	 * WPR region for secure firmware loading
+	 */
+	writel(lower_32_bits(wpr_start), &mc->mc_security_carveout2_bom);
+	writel(upper_32_bits(wpr_start), &mc->mc_security_carveout2_bom_hi);
+	writel(0x2, &mc->mc_security_carveout2_size_128k);
+	reg = readl(&mc->mc_security_carveout2_cfg0);
+	reg |= TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED;
+	writel(reg, &mc->mc_security_carveout2_cfg0);
+
+	/* Carveout3 is left empty */
+	writel(0x0, &mc->mc_security_carveout3_bom);
+	writel(0x0, &mc->mc_security_carveout3_bom_hi);
+	writel(0x0, &mc->mc_security_carveout3_size_128k);
+	reg = readl(&mc->mc_security_carveout3_cfg0);
+	reg |= TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED;
+	writel(reg, &mc->mc_security_carveout3_cfg0);
+
+	/* read back to ensure the write went through */
+	readl(&mc->mc_security_carveout3_cfg0);
+
+	debug("configured WPR\n");
+}
+#else
+static inline void config_wpr(void)
+{
+}
+#endif
+
+void tegra_gpu_config(void)
+{
+	config_vpr();
+	config_wpr();
 
 	_configured = true;
 }
-- 
2.6.1
