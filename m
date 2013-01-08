From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v2 2/9] HACK: ARM: tegra: Use CLK_IGNORE_UNUSED for Tegra 114 SoC
Date: Tue, 8 Jan 2013 14:47:36 +0200
Message-ID: <1357649263-1098-3-git-send-email-hdoyu@nvidia.com>
References: <1357649263-1098-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357649263-1098-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use CLK_IGNORE_UNUSED for the Tegra 114 SoC to ensure
clk_disable_unused() is not called. Otherwise the system will die,
because the usecount of the clocks is incorrect. This patch will be
reverted once the Tegra 114 clocks are implemented.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra30_clocks_data.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index 6942c7a..4865ba5 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1384,6 +1384,8 @@ static void tegra30_init_one_clock(struct clk *c)
 	if (!clk->lookup.dev_id && !clk->lookup.con_id)
 		clk->lookup.con_id = c->name;
 	clk->lookup.clk = c;
+	if (tegra_chip_id == TEGRA114) /* FIXME: Implement T114 clocks */
+		c->flags |= CLK_IGNORE_UNUSED;
 	clkdev_add(&clk->lookup);
 	tegra_clk_add(c);
 }
-- 
1.7.9.5
