From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2] ARM: tegra: clock: Disable clocks left on by bootloader
Date: Tue, 22 Feb 2011 12:08:01 -0800
Message-ID: <1298405281-27852-1-git-send-email-ccross@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Iterates through all clocks, disabling any for which the
refcount is 0 but the clock init detected the bootloader
left the clock on.  Can be disabled with command line
tegra_keep_boot_clocks

Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-tegra/clock.c |   45 +++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index e028320..6a50726 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -416,6 +416,51 @@ void tegra_sdmmc_tap_delay(struct clk *c, int delay)
 	spin_unlock_irqrestore(&c->spinlock, flags);
 }
 
+static bool tegra_keep_boot_clocks = false;
+static int __init tegra_keep_boot_clocks_setup(char *__unused)
+{
+	tegra_keep_boot_clocks = true;
+	return 1;
+}
+__setup("tegra_keep_boot_clocks", tegra_keep_boot_clocks_setup);
+
+/*
+ * Iterate through all clocks, disabling any for which the refcount is 0
+ * but the clock init detected the bootloader left the clock on.
+ */
+static int __init tegra_init_disable_boot_clocks(void)
+{
+	struct clk *c;
+
+	mutex_lock(&clock_list_lock);
+
+	list_for_each_entry(c, &clocks, node) {
+		spin_lock_irq(&c->spinlock);
+
+		if (c->refcnt == 0 && c->state == ON &&
+				c->ops && c->ops->disable) {
+			pr_warn_once("%s clocks left on by bootloader:\n",
+				tegra_keep_boot_clocks ?
+					"Prevented disabling" :
+					"Disabling");
+
+			pr_warn("   %s\n", c->name);
+
+			if (!tegra_keep_boot_clocks) {
+				c->ops->disable(c);
+				c->state = OFF;
+			}
+		}
+
+		spin_unlock_irq(&c->spinlock);
+	}
+
+	mutex_unlock(&clock_list_lock);
+
+	return 0;
+}
+late_initcall(tegra_init_disable_boot_clocks);
+
 #ifdef CONFIG_DEBUG_FS
 
 static int __clk_lock_all_spinlocks(void)
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
