From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] ARM: tegra: Add Tegra114 powergate support
Date: Wed, 16 Oct 2013 19:19:02 +0200
Message-ID: <1381943942-30375-3-git-send-email-treding@nvidia.com>
References: <1381943942-30375-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381943942-30375-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Extend the list of power gates found on Tegra114. Note that there are
now holes in the list, so perhaps a simple array is no longer the best
data structure to represent it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- remove entries from powergate list that aren't available on Tegra114
- rename disa/DISA to dis/DIS for consistency with the TRM
- update debugfs to cope with holes in powergate list
---
 arch/arm/mach-tegra/powergate.c | 43 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/tegra-powergate.h |  9 ++++++++-
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index bd10822..85d28e7 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -45,6 +45,13 @@ static int tegra_num_cpu_domains;
 static const u8 *tegra_cpu_domains;
 
 static const u8 tegra30_cpu_domains[] = {
+	TEGRA_POWERGATE_CPU,
+	TEGRA_POWERGATE_CPU1,
+	TEGRA_POWERGATE_CPU2,
+	TEGRA_POWERGATE_CPU3,
+};
+
+static const u8 tegra114_cpu_domains[] = {
 	TEGRA_POWERGATE_CPU0,
 	TEGRA_POWERGATE_CPU1,
 	TEGRA_POWERGATE_CPU2,
@@ -190,6 +197,11 @@ int __init tegra_powergate_init(void)
 		tegra_num_cpu_domains = 4;
 		tegra_cpu_domains = tegra30_cpu_domains;
 		break;
+	case TEGRA114:
+		tegra_num_powerdomains = 23;
+		tegra_num_cpu_domains = 4;
+		tegra_cpu_domains = tegra114_cpu_domains;
+		break;
 	default:
 		/* Unknown Tegra variant. Disable powergating */
 		tegra_num_powerdomains = 0;
@@ -230,6 +242,27 @@ static const char * const powergate_name_t30[] = {
 	[TEGRA_POWERGATE_3D1]	= "3d1",
 };
 
+static const char * const powergate_name_t114[] = {
+	[TEGRA_POWERGATE_CPU]	= "cpu0",
+	[TEGRA_POWERGATE_3D]	= "3d",
+	[TEGRA_POWERGATE_VENC]	= "venc",
+	[TEGRA_POWERGATE_VDEC]	= "vdec",
+	[TEGRA_POWERGATE_MPE]	= "mpe",
+	[TEGRA_POWERGATE_HEG]	= "heg",
+	[TEGRA_POWERGATE_CPU1]	= "cpu1",
+	[TEGRA_POWERGATE_CPU2]	= "cpu2",
+	[TEGRA_POWERGATE_CPU3]	= "cpu3",
+	[TEGRA_POWERGATE_CELP]	= "celp",
+	[TEGRA_POWERGATE_CPU0]	= "cpu0",
+	[TEGRA_POWERGATE_C0NC]	= "c0nc",
+	[TEGRA_POWERGATE_C1NC]	= "c1nc",
+	[TEGRA_POWERGATE_DIS]	= "dis",
+	[TEGRA_POWERGATE_DISB]	= "disb",
+	[TEGRA_POWERGATE_XUSBA]	= "xusba",
+	[TEGRA_POWERGATE_XUSBB]	= "xusbb",
+	[TEGRA_POWERGATE_XUSBC]	= "xusbc",
+};
+
 static int powergate_show(struct seq_file *s, void *data)
 {
 	int i;
@@ -237,9 +270,14 @@ static int powergate_show(struct seq_file *s, void *data)
 	seq_printf(s, " powergate powered\n");
 	seq_printf(s, "------------------\n");
 
-	for (i = 0; i < tegra_num_powerdomains; i++)
+	for (i = 0; i < tegra_num_powerdomains; i++) {
+		if (!powergate_name[i])
+			continue;
+
 		seq_printf(s, " %9s %7s\n", powergate_name[i],
 			tegra_powergate_is_powered(i) ? "yes" : "no");
+	}
+
 	return 0;
 }
 
@@ -266,6 +304,9 @@ int __init tegra_powergate_debugfs_init(void)
 	case TEGRA30:
 		powergate_name = powergate_name_t30;
 		break;
+	case TEGRA114:
+		powergate_name = powergate_name_t114;
+		break;
 	}
 
 	if (powergate_name) {
diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-powergate.h
index 55c29a8..c98cfa4 100644
--- a/include/linux/tegra-powergate.h
+++ b/include/linux/tegra-powergate.h
@@ -34,8 +34,15 @@ struct clk;
 #define TEGRA_POWERGATE_CPU3	11
 #define TEGRA_POWERGATE_CELP	12
 #define TEGRA_POWERGATE_3D1	13
+#define TEGRA_POWERGATE_CPU0	14
+#define TEGRA_POWERGATE_C0NC	15
+#define TEGRA_POWERGATE_C1NC	16
+#define TEGRA_POWERGATE_DIS	18
+#define TEGRA_POWERGATE_DISB	19
+#define TEGRA_POWERGATE_XUSBA	20
+#define TEGRA_POWERGATE_XUSBB	21
+#define TEGRA_POWERGATE_XUSBC	22
 
-#define TEGRA_POWERGATE_CPU0	TEGRA_POWERGATE_CPU
 #define TEGRA_POWERGATE_3D0	TEGRA_POWERGATE_3D
 
 int tegra_powergate_is_powered(int id);
-- 
1.8.4
