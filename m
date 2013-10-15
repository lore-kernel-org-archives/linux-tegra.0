From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 13/13] WIP: ARM: tegra: Add Tegra114 powergate support
Date: Tue, 15 Oct 2013 17:28:03 +0200
Message-ID: <1381850883-12722-14-git-send-email-treding@nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Extend the list of power gates found on Tegra114. Note that there are
now holes in the list, so perhaps a simple array is no longer the best
data structure to represent it. But perhaps this is good enough for now
and can be cleaned up in a follow up patch?

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/tegra-powergate.h |  9 ++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index f076f0f..8d9ab20 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -44,6 +44,13 @@ static int tegra_num_powerdomains;
 static int tegra_num_cpu_domains;
 static u8 *tegra_cpu_domains;
 static u8 tegra30_cpu_domains[] = {
+	TEGRA_POWERGATE_CPU,
+	TEGRA_POWERGATE_CPU1,
+	TEGRA_POWERGATE_CPU2,
+	TEGRA_POWERGATE_CPU3,
+};
+
+static u8 tegra114_cpu_domains[] = {
 	TEGRA_POWERGATE_CPU0,
 	TEGRA_POWERGATE_CPU1,
 	TEGRA_POWERGATE_CPU2,
@@ -189,6 +196,11 @@ int __init tegra_powergate_init(void)
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
@@ -229,6 +241,32 @@ static const char * const powergate_name_t30[] = {
 	[TEGRA_POWERGATE_3D1]	= "3d1",
 };
 
+static const char * const powergate_name_t114[] = {
+	[TEGRA_POWERGATE_CPU]	= "cpu0",
+	[TEGRA_POWERGATE_3D]	= "3d",
+	[TEGRA_POWERGATE_VENC]	= "venc",
+	[TEGRA_POWERGATE_VDEC]	= "vdec",
+	[TEGRA_POWERGATE_PCIE]	= "n/a",
+	[TEGRA_POWERGATE_L2]	= "n/a",
+	[TEGRA_POWERGATE_MPE]	= "mpe",
+	[TEGRA_POWERGATE_HEG]	= "heg",
+	[TEGRA_POWERGATE_SATA]	= "n/a",
+	[TEGRA_POWERGATE_CPU1]	= "cpu1",
+	[TEGRA_POWERGATE_CPU2]	= "cpu2",
+	[TEGRA_POWERGATE_CPU3]	= "cpu3",
+	[TEGRA_POWERGATE_CELP]	= "celp",
+	[TEGRA_POWERGATE_3D1]	= "n/a",
+	[TEGRA_POWERGATE_CPU0]	= "cpu0",
+	[TEGRA_POWERGATE_C0NC]	= "c0nc",
+	[TEGRA_POWERGATE_C1NC]	= "c1nc",
+	[17]			= "n/a",
+	[TEGRA_POWERGATE_DISA]	= "disa",
+	[TEGRA_POWERGATE_DISB]	= "disb",
+	[TEGRA_POWERGATE_XUSBA]	= "xusba",
+	[TEGRA_POWERGATE_XUSBB]	= "xusbb",
+	[TEGRA_POWERGATE_XUSBC]	= "xusbc",
+};
+
 static int powergate_show(struct seq_file *s, void *data)
 {
 	int i;
@@ -265,6 +303,9 @@ int __init tegra_powergate_debugfs_init(void)
 	case TEGRA30:
 		powergate_name = powergate_name_t30;
 		break;
+	case TEGRA114:
+		powergate_name = powergate_name_t114;
+		break;
 	}
 
 	if (powergate_name) {
diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-powergate.h
index 55c29a8..b2df1c6 100644
--- a/include/linux/tegra-powergate.h
+++ b/include/linux/tegra-powergate.h
@@ -34,8 +34,15 @@ struct clk;
 #define TEGRA_POWERGATE_CPU3	11
 #define TEGRA_POWERGATE_CELP	12
 #define TEGRA_POWERGATE_3D1	13
+#define TEGRA_POWERGATE_CPU0	14
+#define TEGRA_POWERGATE_C0NC	15
+#define TEGRA_POWERGATE_C1NC	16
+#define TEGRA_POWERGATE_DISA	18
+#define TEGRA_POWERGATE_DISB	19
+#define TEGRA_POWERGATE_XUSBA	20
+#define TEGRA_POWERGATE_XUSBB	21
+#define TEGRA_POWERGATE_XUSBC	22
 
-#define TEGRA_POWERGATE_CPU0	TEGRA_POWERGATE_CPU
 #define TEGRA_POWERGATE_3D0	TEGRA_POWERGATE_3D
 
 int tegra_powergate_is_powered(int id);
-- 
1.8.4
