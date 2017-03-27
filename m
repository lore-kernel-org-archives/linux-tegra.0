From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: Don't reset PLL-CX if it is already enabled
Date: Mon, 27 Mar 2017 12:01:05 +0100
Message-ID: <1490612465-12454-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 8dce89a1c2cf ("clk: tegra: Don't warn for PLL defaults unnecessarily")
changed the tegra210_pllcx_set_defaults() function causing the PLL to
always be reset regardless of whether it is in-use. This function was
changed so that resetting of the PLL will only be skipped if the PLL
is enabled AND 'pllcx->params->defaults_set' is not true. However, the
'pllcx->params->defaults_set' is always true and hence, the PLL is now
always reset. This causes the boot to fail on the Tegra210 Smaug where
the PLL is already enabled and in-use. Fix this by only resetting the
PLL if not in-use and only printing the warning that the defaults are
not set after we have checked the default settings.

Fixes: 8dce89a1c2cf ("clk: tegra: Don't warn for PLL defaults unnecessarily")

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra210.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 9897dc55676b..b56a104328fa 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -555,12 +555,12 @@ static void tegra210_pllcx_set_defaults(const char *name,
 {
 	pllcx->params->defaults_set = true;
 
-	if (readl_relaxed(clk_base + pllcx->params->base_reg) &
-			PLL_ENABLE && !pllcx->params->defaults_set) {
+	if (readl_relaxed(clk_base + pllcx->params->base_reg) & PLL_ENABLE) {
 		/* PLL is ON: only check if defaults already set */
 		pllcx_check_defaults(pllcx->params);
-		pr_warn("%s already enabled. Postponing set full defaults\n",
-			name);
+		if (!pllcx->params->defaults_set)
+			pr_warn("%s already enabled. Postponing set full defaults\n",
+				name);
 		return;
 	}
 
-- 
2.7.4
