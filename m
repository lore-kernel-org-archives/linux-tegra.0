From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/4] clk: tegra: Add peripheral clock registration helper
Date: Fri,  1 Sep 2017 16:53:41 +0200
Message-ID: <20170901145343.19890-2-thierry.reding@gmail.com>
References: <20170901145343.19890-1-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170901145343.19890-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

There is a common pattern that registers individual peripheral clocks
from an initialization table. Add a common implementation to remove the
duplication from various call sites.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-periph.c | 8 ++++++++
 drivers/clk/tegra/clk.h        | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index cf80831de79d..9475c00b7cf9 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -203,3 +203,11 @@ struct clk *tegra_clk_register_periph_nodiv(const char *name,
 	return _tegra_clk_register_periph(name, parent_names, num_parents,
 			periph, clk_base, offset, CLK_SET_RATE_PARENT);
 }
+
+struct clk *tegra_clk_register_periph_data(void __iomem *clk_base,
+					   struct tegra_periph_init_data *init)
+{
+	return _tegra_clk_register_periph(init->name, init->p.parent_names,
+					  init->num_parents, &init->periph,
+					  clk_base, init->offset, init->flags);
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 872f1189ad7f..3b2763df51c2 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -662,6 +662,9 @@ struct tegra_periph_init_data {
 			_clk_num, _gate_flags, _clk_id,\
 			NULL, 0, NULL)
 
+struct clk *tegra_clk_register_periph_data(void __iomem *clk_base,
+					   struct tegra_periph_init_data *init);
+
 /**
  * struct clk_super_mux - super clock
  *
-- 
2.13.3

