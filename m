From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: clocks: separate tegra_clk_32k_ops from Tegra20 and Tegra30
Date: Fri, 17 Aug 2012 14:51:21 +0800
Message-ID: <1345186281-3859-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Currently the tegra20 and tegra30 share the same symbol for
tegra_clk_32k_ops. This will cause a compile error when building
a tegra20-only kernel image. Add tegra_clk_32k_ops for tegra20 and
modify tegra30_clk_32k_ops for tegra30.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra20_clocks.c      |   10 ++++++++++
 arch/arm/mach-tegra/tegra30_clocks.c      |    2 +-
 arch/arm/mach-tegra/tegra30_clocks.h      |    2 +-
 arch/arm/mach-tegra/tegra30_clocks_data.c |    2 +-
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra20_clocks.c b/arch/arm/mach-tegra/tegra20_clocks.c
index b073396..ee6922b 100644
--- a/arch/arm/mach-tegra/tegra20_clocks.c
+++ b/arch/arm/mach-tegra/tegra20_clocks.c
@@ -240,6 +240,16 @@ static int clk_div16_get_divider(unsigned long parent_rate, unsigned long rate)
 	return divider_u16 - 1;
 }
 
+static unsigned long tegra_clk_fixed_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	return to_clk_tegra(hw)->fixed_rate;
+}
+
+struct clk_ops tegra_clk_32k_ops = {
+	.recalc_rate = tegra_clk_fixed_recalc_rate,
+};
+
 /* clk_m functions */
 static unsigned long tegra20_clk_m_recalc_rate(struct clk_hw *hw,
 			unsigned long prate)
diff --git a/arch/arm/mach-tegra/tegra30_clocks.c b/arch/arm/mach-tegra/tegra30_clocks.c
index b2d0864..7dad44d 100644
--- a/arch/arm/mach-tegra/tegra30_clocks.c
+++ b/arch/arm/mach-tegra/tegra30_clocks.c
@@ -489,7 +489,7 @@ static unsigned long tegra30_clk_fixed_recalc_rate(struct clk_hw *hw,
 	return to_clk_tegra(hw)->fixed_rate;
 }
 
-struct clk_ops tegra_clk_32k_ops = {
+struct clk_ops tegra30_clk_32k_ops = {
 	.recalc_rate = tegra30_clk_fixed_recalc_rate,
 };
 
diff --git a/arch/arm/mach-tegra/tegra30_clocks.h b/arch/arm/mach-tegra/tegra30_clocks.h
index aeb4e96..b08b8d9 100644
--- a/arch/arm/mach-tegra/tegra30_clocks.h
+++ b/arch/arm/mach-tegra/tegra30_clocks.h
@@ -17,7 +17,7 @@
 #ifndef __MACH_TEGRA30_CLOCK_H
 #define __MACH_TEGRA30_CLOCK_H
 
-extern struct clk_ops tegra_clk_32k_ops;
+extern struct clk_ops tegra30_clk_32k_ops;
 extern struct clk_ops tegra30_clk_m_ops;
 extern struct clk_ops tegra_clk_m_div_ops;
 extern struct clk_ops tegra_pll_ref_ops;
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index dad1b2f..2271ac1 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -58,7 +58,7 @@ static struct clk_tegra tegra_clk_32k_hw = {
 static struct clk tegra_clk_32k = {
 	.name = "clk_32k",
 	.hw = &tegra_clk_32k_hw.hw,
-	.ops = &tegra_clk_32k_ops,
+	.ops = &tegra30_clk_32k_ops,
 	.flags = CLK_IS_ROOT,
 };
 
-- 
1.7.0.4
