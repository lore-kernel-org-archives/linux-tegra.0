From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 3/8] clk: tegra: Fix inconsistent indenting
Date: Tue, 28 Apr 2015 13:46:18 +0900
Message-ID: <1430196383-9190-4-git-send-email-k.kozlowski@samsung.com>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Barry Song <baohua@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-tegra@vger.kernel.org

Fix the indentation - spaces used instead of tabs and actually wrong
number of spaces.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/tegra/clk-emc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 615da43a508d..8757feda4a11 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -130,11 +130,11 @@ static long emc_determine_rate(struct clk_hw *hw, unsigned long rate,
 
 	tegra = container_of(hw, struct tegra_clk_emc, hw);
 
-         for (i = 0; i < tegra->num_timings; i++) {
-                if (tegra->timings[i].ram_code != ram_code)
-                        continue;
+	for (i = 0; i < tegra->num_timings; i++) {
+		if (tegra->timings[i].ram_code != ram_code)
+			continue;
 
-                timing = tegra->timings + i;
+		timing = tegra->timings + i;
 
 		if (timing->rate > max_rate) {
 			i = min(i, 1);
@@ -145,11 +145,11 @@ static long emc_determine_rate(struct clk_hw *hw, unsigned long rate,
 			continue;
 
 		if (timing->rate >= rate)
-                        return timing->rate;
-        }
+			return timing->rate;
+	}
 
-        if (timing)
-                return timing->rate;
+	if (timing)
+		return timing->rate;
 
 	return __clk_get_rate(hw->clk);
 }
-- 
1.9.1
