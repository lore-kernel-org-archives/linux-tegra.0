From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v7 03/14] arm/tegra: prepare clock code for multiple tegra variants
Date: Wed, 14 Dec 2011 17:03:15 +0200
Message-ID: <1323875032-18221-4-git-send-email-pdeschrijver@nvidia.com>
References: <1323875032-18221-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323875032-18221-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Rework the tegra20 clock code to support multiple tegra variants :

 * remove tegra2_periph_reset_assert/tegra2_periph_reset_deassert. This
   functionality should be in clock.c.

 * remove tegra_sdmmc_tap_delay and export tegra2_sdmmc_tap_delay
   directly. This feature is handled inside the sdmmc block from tegra30
   onwards. So there is no need for support in the clock code beyond
   tegra20. There are no in tree users of this function.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/clock.c            |   20 ++++----------------
 arch/arm/mach-tegra/clock.h            |    3 ---
 arch/arm/mach-tegra/include/mach/clk.h |    2 +-
 arch/arm/mach-tegra/tegra2_clocks.c    |   17 +++++------------
 4 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index f8d41ff..a8f359d 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -387,13 +387,15 @@ EXPORT_SYMBOL(tegra_clk_init_from_table);
 
 void tegra_periph_reset_deassert(struct clk *c)
 {
-	tegra2_periph_reset_deassert(c);
+	BUG_ON(!c->ops->reset);
+	c->ops->reset(c, false);
 }
 EXPORT_SYMBOL(tegra_periph_reset_deassert);
 
 void tegra_periph_reset_assert(struct clk *c)
 {
-	tegra2_periph_reset_assert(c);
+	BUG_ON(!c->ops->reset);
+	c->ops->reset(c, true);
 }
 EXPORT_SYMBOL(tegra_periph_reset_assert);
 
@@ -402,20 +404,6 @@ void __init tegra_init_clock(void)
 	tegra2_init_clocks();
 }
 
-/*
- * The SDMMC controllers have extra bits in the clock source register that
- * adjust the delay between the clock and data to compenstate for delays
- * on the PCB.
- */
-void tegra_sdmmc_tap_delay(struct clk *c, int delay)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&c->spinlock, flags);
-	tegra2_sdmmc_tap_delay(c, delay);
-	spin_unlock_irqrestore(&c->spinlock, flags);
-}
-
 #ifdef CONFIG_DEBUG_FS
 
 static int __clk_lock_all_spinlocks(void)
diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
index 688316a..8c18e81 100644
--- a/arch/arm/mach-tegra/clock.h
+++ b/arch/arm/mach-tegra/clock.h
@@ -146,8 +146,6 @@ struct tegra_clk_init_table {
 };
 
 void tegra2_init_clocks(void);
-void tegra2_periph_reset_deassert(struct clk *c);
-void tegra2_periph_reset_assert(struct clk *c);
 void clk_init(struct clk *clk);
 struct clk *tegra_get_clock_by_name(const char *name);
 unsigned long clk_measure_input_freq(void);
@@ -155,6 +153,5 @@ int clk_reparent(struct clk *c, struct clk *parent);
 void tegra_clk_init_from_table(struct tegra_clk_init_table *table);
 unsigned long clk_get_rate_locked(struct clk *c);
 int clk_set_rate_locked(struct clk *c, unsigned long rate);
-void tegra2_sdmmc_tap_delay(struct clk *c, int delay);
 
 #endif
diff --git a/arch/arm/mach-tegra/include/mach/clk.h b/arch/arm/mach-tegra/include/mach/clk.h
index c8baf8f..fc3ecb6 100644
--- a/arch/arm/mach-tegra/include/mach/clk.h
+++ b/arch/arm/mach-tegra/include/mach/clk.h
@@ -26,6 +26,6 @@ void tegra_periph_reset_deassert(struct clk *c);
 void tegra_periph_reset_assert(struct clk *c);
 
 unsigned long clk_get_rate_all_locked(struct clk *c);
-void tegra_sdmmc_tap_delay(struct clk *c, int delay);
+void tegra2_sdmmc_tap_delay(struct clk *c, int delay);
 
 #endif
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 371869d..c78abab 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -278,18 +278,6 @@ static struct clk_ops tegra_clk_m_ops = {
 	.disable	= tegra2_clk_m_disable,
 };
 
-void tegra2_periph_reset_assert(struct clk *c)
-{
-	BUG_ON(!c->ops->reset);
-	c->ops->reset(c, true);
-}
-
-void tegra2_periph_reset_deassert(struct clk *c)
-{
-	BUG_ON(!c->ops->reset);
-	c->ops->reset(c, false);
-}
-
 /* super clock functions */
 /* "super clocks" on tegra have two-stage muxes and a clock skipping
  * super divider.  We will ignore the clock skipping divider, since we
@@ -1132,6 +1120,9 @@ static struct clk_ops tegra_periph_clk_ops = {
 void tegra2_sdmmc_tap_delay(struct clk *c, int delay)
 {
 	u32 reg;
+	unsigned long flags;
+
+	spin_lock_irqsave(&c->spinlock, flags);
 
 	delay = clamp(delay, 0, 15);
 	reg = clk_readl(c->reg);
@@ -1139,6 +1130,8 @@ void tegra2_sdmmc_tap_delay(struct clk *c, int delay)
 	reg |= SDMMC_CLK_INT_FB_SEL;
 	reg |= delay << SDMMC_CLK_INT_FB_DLY_SHIFT;
 	clk_writel(reg, c->reg);
+
+	spin_unlock_irqrestore(&c->spinlock, flags);
 }
 
 /* External memory controller clock ops */
-- 
1.7.7.rc0.72.g4b5ea.dirty
