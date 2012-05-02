From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/3] ARM: tegra: trimslice: enable PCIe when booting from device tree
Date: Wed,  2 May 2012 17:00:13 -0600
Message-ID: <1335999615-6119-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

There currently aren't bindings for the Tegra PCIe controller. Work on
this is in progress, but not yet complete. Manually initialize PCIe when
booting from device tree, in order to bring DT support to the same
feature level as board files, which will in turn allow board files to be
deprecated.

PCIe hosts the wired Ethernet controller on TrimSlice.

To support this, add infra-structure to board-dt-tegra20.c for board-
specific initialization code. Once device tree support for the relevant
features is in place, this code will be removed.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note that this patch should be re-written to depend on Shawn Guo's late
init hook series, since it adds a new late_initcall.
---
 arch/arm/mach-tegra/board-dt-tegra20.c |   35 ++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index fac3eb1..8fd6f31 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -98,6 +98,41 @@ static void __init tegra_dt_init(void)
 				tegra20_auxdata_lookup, NULL);
 }
 
+#ifdef CONFIG_MACH_TRIMSLICE
+static void __init trimslice_init(void)
+{
+	int ret;
+
+	ret = tegra_pcie_init(true, true);
+	if (ret)
+		pr_err("tegra_pci_init() failed: %d\n", ret);
+}
+#endif
+
+static struct {
+	char *machine;
+	void (*init)(void);
+} board_init_funcs[] = {
+#ifdef CONFIG_MACH_TRIMSLICE
+	{ "compulab,trimslice", trimslice_init },
+#endif
+};
+
+static int __init tegra_dt_init_board_specific(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(board_init_funcs); i++) {
+		if (of_machine_is_compatible(board_init_funcs[i].machine)) {
+			board_init_funcs[i].init();
+			break;
+		}
+	}
+
+	return 0;
+}
+late_initcall(tegra_dt_init_board_specific);
+
 static const char *tegra20_dt_board_compat[] = {
 	"nvidia,tegra20",
 	NULL
-- 
1.7.0.4
