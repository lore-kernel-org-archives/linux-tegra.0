From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Add Tegra124 powergate support
Date: Fri, 13 Dec 2013 17:31:03 +0100
Message-ID: <1386952264-6773-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Three new gates have been added for Tegra124: SOR, VIC and IRAM. In
addition, PCIe and SATA gates are again supported, like on Tegra20 and
Tegra30.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 42 +++++++++++++++++++++++++++++++++++++++++
 include/linux/tegra-powergate.h |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index 547f63f69f1e..dd0d52b329de 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -74,6 +74,13 @@ static const u8 tegra114_cpu_domains[] = {
 	TEGRA_POWERGATE_CPU3,
 };
 
+static const u8 tegra124_cpu_domains[] = {
+	TEGRA_POWERGATE_CPU0,
+	TEGRA_POWERGATE_CPU1,
+	TEGRA_POWERGATE_CPU2,
+	TEGRA_POWERGATE_CPU3,
+};
+
 static DEFINE_SPINLOCK(tegra_powergate_lock);
 
 static void __iomem *pmc = IO_ADDRESS(TEGRA_PMC_BASE);
@@ -221,6 +228,11 @@ int __init tegra_powergate_init(void)
 		tegra_num_cpu_domains = 4;
 		tegra_cpu_domains = tegra114_cpu_domains;
 		break;
+	case TEGRA124:
+		tegra_num_powerdomains = 25;
+		tegra_num_cpu_domains = 4;
+		tegra_cpu_domains = tegra124_cpu_domains;
+		break;
 	default:
 		/* Unknown Tegra variant. Disable powergating */
 		tegra_num_powerdomains = 0;
@@ -282,6 +294,33 @@ static const char * const powergate_name_t114[] = {
 	[TEGRA_POWERGATE_XUSBC]	= "xusbc",
 };
 
+static const char * const powergate_name_t124[] = {
+	[TEGRA_POWERGATE_CPU]	= "crail",
+	[TEGRA_POWERGATE_3D]	= "3d",
+	[TEGRA_POWERGATE_VENC]	= "venc",
+	[TEGRA_POWERGATE_PCIE]	= "pcie",
+	[TEGRA_POWERGATE_VDEC]	= "vdec",
+	[TEGRA_POWERGATE_L2]	= "l2",
+	[TEGRA_POWERGATE_MPE]	= "mpe",
+	[TEGRA_POWERGATE_HEG]	= "heg",
+	[TEGRA_POWERGATE_SATA]	= "sata",
+	[TEGRA_POWERGATE_CPU1]	= "cpu1",
+	[TEGRA_POWERGATE_CPU2]	= "cpu2",
+	[TEGRA_POWERGATE_CPU3]	= "cpu3",
+	[TEGRA_POWERGATE_CELP]	= "celp",
+	[TEGRA_POWERGATE_CPU0]	= "cpu0",
+	[TEGRA_POWERGATE_C0NC]	= "c0nc",
+	[TEGRA_POWERGATE_C1NC]	= "c1nc",
+	[TEGRA_POWERGATE_SOR]	= "sor",
+	[TEGRA_POWERGATE_DIS]	= "dis",
+	[TEGRA_POWERGATE_DISB]	= "disb",
+	[TEGRA_POWERGATE_XUSBA]	= "xusba",
+	[TEGRA_POWERGATE_XUSBB]	= "xusbb",
+	[TEGRA_POWERGATE_XUSBC]	= "xusbc",
+	[TEGRA_POWERGATE_VIC]	= "vic",
+	[TEGRA_POWERGATE_IRAM]	= "iram",
+};
+
 static int powergate_show(struct seq_file *s, void *data)
 {
 	int i;
@@ -326,6 +365,9 @@ int __init tegra_powergate_debugfs_init(void)
 	case TEGRA114:
 		powergate_name = powergate_name_t114;
 		break;
+	case TEGRA124:
+		powergate_name = powergate_name_t124;
+		break;
 	}
 
 	if (powergate_name) {
diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-powergate.h
index faa2bdb090d7..e6f2ab3014a7 100644
--- a/include/linux/tegra-powergate.h
+++ b/include/linux/tegra-powergate.h
@@ -38,11 +38,14 @@ struct reset_control;
 #define TEGRA_POWERGATE_CPU0	14
 #define TEGRA_POWERGATE_C0NC	15
 #define TEGRA_POWERGATE_C1NC	16
+#define TEGRA_POWERGATE_SOR	17
 #define TEGRA_POWERGATE_DIS	18
 #define TEGRA_POWERGATE_DISB	19
 #define TEGRA_POWERGATE_XUSBA	20
 #define TEGRA_POWERGATE_XUSBB	21
 #define TEGRA_POWERGATE_XUSBC	22
+#define TEGRA_POWERGATE_VIC	23
+#define TEGRA_POWERGATE_IRAM	24
 
 #define TEGRA_POWERGATE_3D0	TEGRA_POWERGATE_3D
 
-- 
1.8.4.2
