From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 4/5] clk: tegra: emc: Replace BUG() with WARN_ONCE()
Date: Sun, 14 Apr 2019 22:23:20 +0300
Message-ID: <20190414192321.23294-5-digetx@gmail.com>
References: <20190414192321.23294-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414192321.23294-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no justification for the BUG() in this code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-emc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 9a0179235939..93ecb538e59b 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -222,7 +222,10 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
 
 	if (emc_get_parent(&tegra->hw) == timing->parent_index &&
 	    clk_get_rate(timing->parent) != timing->parent_rate) {
-		BUG();
+		WARN_ONCE(1, "parent %s rate mismatch %lu %lu\n",
+			  __clk_get_name(timing->parent),
+			  clk_get_rate(timing->parent),
+			  timing->parent_rate);
 		return -EINVAL;
 	}
 
-- 
2.21.0
