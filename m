From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] clk: tegra: Fix clock sources for tegra210 EMC
Date: Fri, 18 Dec 2015 13:45:28 +0000
Message-ID: <1450446328-6414-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The EMC clock sources for tegra210 currently incorrectly include pll_c2
and pll_c3. However, both of these should have been pll_mb as shown in
the TRM. If tegra210 happens to be configured such that the pll_mb is the
default clock for the EMC, as configured by the bootloader, then this will
cause a system hang on boot. This is because the kernel will disable the
pll_mb when disabling unused clock as it appears to be unused when it is
not.

Also add the additional pll_p clock source for the EMC.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 58514c44ea83..849be30b52bf 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -243,7 +243,8 @@ static unsigned long tegra210_input_freq[] = {
 };
 
 static const char *mux_pllmcp_clkm[] = {
-	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_c2", "pll_c3",
+	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
+	"pll_p",
 };
 #define mux_pllmcp_clkm_idx NULL
 
-- 
2.1.4

