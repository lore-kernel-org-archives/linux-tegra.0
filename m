From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/9] tegra: Rename NV_PA_PMC_BASE to TEGRA2_PMC_BASE
Date: Fri,  3 Feb 2012 17:13:52 -0800
Message-ID: <1328318041-10943-2-git-send-email-sjg@chromium.org>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328318041-10943-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Change this name to fit with the current convention in the Tegra
header file.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

 arch/arm/cpu/armv7/tegra2/ap20.c          |   10 +++++-----
 arch/arm/cpu/armv7/tegra2/board.c         |    2 +-
 arch/arm/include/asm/arch-tegra2/tegra2.h |    4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/cpu/armv7/tegra2/ap20.c b/arch/arm/cpu/armv7/tegra2/ap20.c
index 4c44bb3..3ea2e26 100644
--- a/arch/arm/cpu/armv7/tegra2/ap20.c
+++ b/arch/arm/cpu/armv7/tegra2/ap20.c
@@ -105,14 +105,14 @@ static void enable_cpu_clock(int enable)
 
 static int is_cpu_powered(void)
 {
-	struct pmc_ctlr *pmc = (struct pmc_ctlr *)NV_PA_PMC_BASE;
+	struct pmc_ctlr *pmc = (struct pmc_ctlr *)TEGRA2_PMC_BASE;
 
 	return (readl(&pmc->pmc_pwrgate_status) & CPU_PWRED) ? 1 : 0;
 }
 
 static void remove_cpu_io_clamps(void)
 {
-	struct pmc_ctlr *pmc = (struct pmc_ctlr *)NV_PA_PMC_BASE;
+	struct pmc_ctlr *pmc = (struct pmc_ctlr *)TEGRA2_PMC_BASE;
 	u32 reg;
 
 	/* Remove the clamps on the CPU I/O signals */
@@ -126,7 +126,7 @@ static void remove_cpu_io_clamps(void)
 
 static void powerup_cpu(void)
 {
-	struct pmc_ctlr *pmc = (struct pmc_ctlr *)NV_PA_PMC_BASE;
+	struct pmc_ctlr *pmc = (struct pmc_ctlr *)TEGRA2_PMC_BASE;
 	u32 reg;
 	int timeout = IO_STABILIZATION_DELAY;
 
@@ -157,7 +157,7 @@ static void powerup_cpu(void)
 
 static void enable_cpu_power_rail(void)
 {
-	struct pmc_ctlr *pmc = (struct pmc_ctlr *)NV_PA_PMC_BASE;
+	struct pmc_ctlr *pmc = (struct pmc_ctlr *)TEGRA2_PMC_BASE;
 	u32 reg;
 
 	reg = readl(&pmc->pmc_cntrl);
@@ -277,7 +277,7 @@ void enable_scu(void)
 
 void init_pmc_scratch(void)
 {
-	struct pmc_ctlr *const pmc = (struct pmc_ctlr *)NV_PA_PMC_BASE;
+	struct pmc_ctlr *const pmc = (struct pmc_ctlr *)TEGRA2_PMC_BASE;
 	int i;
 
 	/* SCRATCH0 is initialized by the boot ROM and shouldn't be cleared */
diff --git a/arch/arm/cpu/armv7/tegra2/board.c b/arch/arm/cpu/armv7/tegra2/board.c
index 410d0bd..77a627d 100644
--- a/arch/arm/cpu/armv7/tegra2/board.c
+++ b/arch/arm/cpu/armv7/tegra2/board.c
@@ -47,7 +47,7 @@ enum {
 
 unsigned int query_sdram_size(void)
 {
-	struct pmc_ctlr *const pmc = (struct pmc_ctlr *)NV_PA_PMC_BASE;
+	struct pmc_ctlr *const pmc = (struct pmc_ctlr *)TEGRA2_PMC_BASE;
 	u32 reg;
 
 	reg = readl(&pmc->pmc_scratch20);
diff --git a/arch/arm/include/asm/arch-tegra2/tegra2.h b/arch/arm/include/asm/arch-tegra2/tegra2.h
index baae2eb..ca1881e 100644
--- a/arch/arm/include/asm/arch-tegra2/tegra2.h
+++ b/arch/arm/include/asm/arch-tegra2/tegra2.h
@@ -39,7 +39,7 @@
 #define NV_PA_APB_UARTD_BASE	(NV_PA_APB_MISC_BASE + 0x6300)
 #define NV_PA_APB_UARTE_BASE	(NV_PA_APB_MISC_BASE + 0x6400)
 #define TEGRA2_SPI_BASE		(NV_PA_APB_MISC_BASE + 0xC380)
-#define NV_PA_PMC_BASE		0x7000E400
+#define TEGRA2_PMC_BASE		(NV_PA_APB_MISC_BASE + 0xE400)
 #define NV_PA_CSITE_BASE	0x70040000
 #define TEGRA_USB1_BASE		0xC5000000
 #define TEGRA_USB3_BASE		0xC5008000
@@ -55,7 +55,7 @@ struct timerus {
 	unsigned int cntr_1us;
 };
 #else  /* __ASSEMBLY__ */
-#define PRM_RSTCTRL		NV_PA_PMC_BASE
+#define PRM_RSTCTRL		TEGRA2_PMC_BASE
 #endif
 
 #endif	/* TEGRA2_H */
-- 
1.7.7.3
