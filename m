From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/3] clk: tegra: Fix enabling of PLLE
Date: Fri, 4 Apr 2014 15:55:15 +0200
Message-ID: <1396619715-15524-3-git-send-email-treding@nvidia.com>
References: <1396619715-15524-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396619715-15524-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When enabling the PLLE as its final step, clk_plle_enable() would
accidentally OR in the value previously written to the PLLE_SS_CTRL
register.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- new patch

 drivers/clk/tegra/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1187187a1cf2..7a1b70dac824 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -757,7 +757,7 @@ static int clk_plle_enable(struct clk_hw *hw)
 	val |= PLLE_SS_DISABLE;
 	writel(val, pll->clk_base + PLLE_SS_CTRL);
 
-	val |= pll_readl_base(pll);
+	val = pll_readl_base(pll);
 	val |= (PLL_BASE_BYPASS | PLL_BASE_ENABLE);
 	pll_writel_base(val, pll);
 
-- 
1.9.1
