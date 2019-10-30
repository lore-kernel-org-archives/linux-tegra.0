From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2] clk: tegra: divider: Check UART's divider enable-bit state on rate's recalculation
Date: Wed, 30 Oct 2019 03:48:13 +0300
Message-ID: <20191030004813.9187-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

UART clock is divided using divisor values from DLM/DLL registers when
enable-bit is unset in clk register and clk's divider configuration isn't
taken onto account in this case. This doesn't cause any problems, but
let's add a check for the divider's enable-bit state, for consistency.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: In the comment to v1 Peter De Schrijver pointed out that UART's DLM/DLL
    registers configuration is used when enable bit is unset, thus the
    commit's title and message are changed accordingly.

 drivers/clk/tegra/clk-divider.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index e76731fb7d69..f33c19045386 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -40,8 +40,13 @@ static unsigned long clk_frac_div_recalc_rate(struct clk_hw *hw,
 	int div, mul;
 	u64 rate = parent_rate;
 
-	reg = readl_relaxed(divider->reg) >> divider->shift;
-	div = reg & div_mask(divider);
+	reg = readl_relaxed(divider->reg);
+
+	if ((divider->flags & TEGRA_DIVIDER_UART) &&
+	    !(reg & PERIPH_CLK_UART_DIV_ENB))
+		return rate;
+
+	div = (reg >> divider->shift) & div_mask(divider);
 
 	mul = get_mul(divider);
 	div += mul;
-- 
2.23.0
