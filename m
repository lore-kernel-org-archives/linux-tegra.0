From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra30: clk: Fix output_rate overflow
Date: Tue, 16 Oct 2012 16:31:49 +0800
Message-ID: <1350376309-24557-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Change the type of variable from "unsigned long" to "u64".
This avoids the overflow while clock rate calculating.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra30_clocks.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/tegra30_clocks.c b/arch/arm/mach-tegra/tegra30_clocks.c
index 5cd502c..e9de5df 100644
--- a/arch/arm/mach-tegra/tegra30_clocks.c
+++ b/arch/arm/mach-tegra/tegra30_clocks.c
@@ -1199,7 +1199,7 @@ static long tegra30_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_tegra *c = to_clk_tegra(hw);
 	unsigned long input_rate = *prate;
-	unsigned long output_rate = *prate;
+	u64 output_rate = *prate;
 	const struct clk_pll_freq_table *sel;
 	struct clk_pll_freq_table cfg;
 	int mul;
-- 
1.7.9.5
