From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 02/14] clk: tegra: Enable PLL_SS for Tegra210
Date: Tue, 25 Jul 2017 13:34:03 +0300
Message-ID: <1500978856-5981-3-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Make sure the pll_ss ops are compiled even when only building for Tegra210.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Reviewed-by: Shreshtha Sahu <ssahu@nvidia.com>
Tested-by: Shreshtha Sahu <ssahu@nvidia.com>
Reviewed-by: Jon Mayo <jmayo@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index e9bdb16..fbd8726 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2255,7 +2255,7 @@ struct clk *
 }
 #endif
 
-#if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
+#if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC) || defined(CONFIG_ARCH_TEGRA_210_SOC)
 static const struct clk_ops tegra_clk_pllss_ops = {
 	.is_enabled = clk_pll_is_enabled,
 	.enable = clk_pll_enable,
-- 
1.9.1
