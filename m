From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 19/21] ARM: tegra: clock: Add function to set SDMMC tap delay
Date: Sat, 19 Feb 2011 14:26:08 -0800
Message-ID: <1298154371-5641-21-git-send-email-ccross__49583.1348388039$1298154674$gmane$org@android.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298154371-5641-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The SDMMC controllers have extra bits in the clock source
register that adjust the delay between the clock and data
to compenstate for delays on the PCB.  The values need to
be set from the clock code so the clock can be locked
during the read-modify-write on the clock source register.

Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-tegra/clock.c            |   12 ++++++++++++
 arch/arm/mach-tegra/clock.h            |    1 +
 arch/arm/mach-tegra/include/mach/clk.h |    2 ++
 arch/arm/mach-tegra/tegra2_clocks.c    |   19 +++++++++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index 9798585..0df6206 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -433,6 +433,18 @@ int __init tegra_disable_boot_clocks(void)
 late_initcall(tegra_disable_boot_clocks);
 #endif
 
+/* The SDMMC controllers have extra bits in the clock source register that
+ * adjust the delay between the clock and data to compenstate for delays
+ * on the PCB. */
+void tegra_sdmmc_tap_delay(struct clk *c, int delay)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&c->spinlock, flags);
+	tegra2_sdmmc_tap_delay(c, delay);
+	spin_unlock_irqrestore(&c->spinlock, flags);
+}
+
 #ifdef CONFIG_DEBUG_FS
 
 static int __clk_lock_all_spinlocks(void)
diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
index ebe6ea8..688316a 100644
--- a/arch/arm/mach-tegra/clock.h
+++ b/arch/arm/mach-tegra/clock.h
@@ -155,5 +155,6 @@ int clk_reparent(struct clk *c, struct clk *parent);
 void tegra_clk_init_from_table(struct tegra_clk_init_table *table);
 unsigned long clk_get_rate_locked(struct clk *c);
 int clk_set_rate_locked(struct clk *c, unsigned long rate);
+void tegra2_sdmmc_tap_delay(struct clk *c, int delay);
 
 #endif
diff --git a/arch/arm/mach-tegra/include/mach/clk.h b/arch/arm/mach-tegra/include/mach/clk.h
index fa7f9ca..c8baf8f 100644
--- a/arch/arm/mach-tegra/include/mach/clk.h
+++ b/arch/arm/mach-tegra/include/mach/clk.h
@@ -26,4 +26,6 @@ void tegra_periph_reset_deassert(struct clk *c);
 void tegra_periph_reset_assert(struct clk *c);
 
 unsigned long clk_get_rate_all_locked(struct clk *c);
+void tegra_sdmmc_tap_delay(struct clk *c, int delay);
+
 #endif
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 395d006..cc2616c 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -74,6 +74,10 @@
 #define PERIPH_CLK_SOURCE_DIVU16_MASK	0xFFFF
 #define PERIPH_CLK_SOURCE_DIV_SHIFT	0
 
+#define SDMMC_CLK_INT_FB_SEL		(1 << 23)
+#define SDMMC_CLK_INT_FB_DLY_SHIFT	16
+#define SDMMC_CLK_INT_FB_DLY_MASK	(0xF << SDMMC_CLK_INT_FB_DLY_SHIFT)
+
 #define PLL_BASE			0x0
 #define PLL_BASE_BYPASS			(1<<31)
 #define PLL_BASE_ENABLE			(1<<30)
@@ -1079,6 +1083,21 @@ static struct clk_ops tegra_periph_clk_ops = {
 	.reset			= &tegra2_periph_clk_reset,
 };
 
+/* The SDMMC controllers have extra bits in the clock source register that
+ * adjust the delay between the clock and data to compenstate for delays
+ * on the PCB. */
+void tegra2_sdmmc_tap_delay(struct clk *c, int delay)
+{
+	u32 reg;
+
+	delay = clamp(delay, 0, 15);
+	reg = clk_readl(c->reg);
+	reg &= ~SDMMC_CLK_INT_FB_DLY_MASK;
+	reg |= SDMMC_CLK_INT_FB_SEL;
+	reg |= delay << SDMMC_CLK_INT_FB_DLY_SHIFT;
+	clk_writel(reg, c->reg);
+}
+
 /* External memory controller clock ops */
 static void tegra2_emc_clk_init(struct clk *c)
 {
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
