From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 09/14] clk: tegra: don't warn for pll_d2 defaults unnecessarily
Date: Tue, 25 Jul 2017 13:34:10 +0300
Message-ID: <1500978856-5981-10-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

If the PLL is on, only warn if the defaults are not yet set. Otherwise be
silent.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Reviewed-by: Timo Alho <talho@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index a4d7d94..1e470ca 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -718,8 +718,6 @@ static void plldss_defaults(const char *pll_name, struct tegra_clk_pll *plldss,
 	plldss->params->defaults_set = true;
 
 	if (val & PLL_ENABLE) {
-		pr_warn("%s already enabled. Postponing set full defaults\n",
-			 pll_name);
 
 		/*
 		 * PLL is ON: check if defaults already set, then set those
@@ -758,6 +756,10 @@ static void plldss_defaults(const char *pll_name, struct tegra_clk_pll *plldss,
 				(~PLLDSS_MISC1_CFG_EN_SDM));
 		}
 
+		if (!plldss->params->defaults_set)
+			pr_warn("%s already enabled. Postponing set full defaults\n",
+				 pll_name);
+
 		/* Enable lock detect */
 		if (val & PLLDSS_BASE_LOCK_OVERRIDE) {
 			val &= ~PLLDSS_BASE_LOCK_OVERRIDE;
-- 
1.9.1
