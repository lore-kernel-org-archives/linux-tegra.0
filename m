From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/2] clk: tegra: divider: Support enable-bit for Super clocks
Date: Tue, 23 Jul 2019 05:52:45 +0300
Message-ID: <20190723025245.27754-2-digetx@gmail.com>
References: <20190723025245.27754-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723025245.27754-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

All Super clocks have a divider that has the enable bit.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: Improved commit's message.

 drivers/clk/tegra/clk-divider.c | 12 ++++++++++++
 drivers/clk/tegra/clk-super.c   |  1 +
 drivers/clk/tegra/clk.h         |  4 ++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index f33c19045386..a980b9bddecd 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -17,6 +17,7 @@
 #define get_max_div(d) div_mask(d)
 
 #define PERIPH_CLK_UART_DIV_ENB BIT(24)
+#define SUPER_CLK_DIV_ENB BIT(31)
 
 static int get_div(struct tegra_clk_frac_div *divider, unsigned long rate,
 		   unsigned long parent_rate)
@@ -46,6 +47,10 @@ static unsigned long clk_frac_div_recalc_rate(struct clk_hw *hw,
 	    !(reg & PERIPH_CLK_UART_DIV_ENB))
 		return rate;
 
+	if ((divider->flags & TEGRA_DIVIDER_SUPER) &&
+	    !(reg & SUPER_CLK_DIV_ENB))
+		return rate;
+
 	div = (reg >> divider->shift) & div_mask(divider);
 
 	mul = get_mul(divider);
@@ -96,6 +101,13 @@ static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	val &= ~(div_mask(divider) << divider->shift);
 	val |= div << divider->shift;
 
+	if (divider->flags & TEGRA_DIVIDER_SUPER) {
+		if (div)
+			val |= SUPER_CLK_DIV_ENB;
+		else
+			val &= ~SUPER_CLK_DIV_ENB;
+	}
+
 	if (divider->flags & TEGRA_DIVIDER_UART) {
 		if (div)
 			val |= PERIPH_CLK_UART_DIV_ENB;
diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 39ef31b46df5..4d8e36b04f03 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -220,6 +220,7 @@ struct clk *tegra_clk_register_super_clk(const char *name,
 	super->frac_div.width = 8;
 	super->frac_div.frac_width = 1;
 	super->frac_div.lock = lock;
+	super->frac_div.flags = TEGRA_DIVIDER_SUPER;
 	super->div_ops = &tegra_clk_frac_div_ops;
 
 	/* Data in .init is copied by clk_register(), so stack variable OK */
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 905bf1096558..a4fbf55930aa 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -53,6 +53,9 @@ struct clk *tegra_clk_register_sync_source(const char *name,
  * TEGRA_DIVIDER_UART - UART module divider has additional enable bit which is
  *      set when divider value is not 0. This flags indicates that the divider
  *      is for UART module.
+ * TEGRA_DIVIDER_SUPER - Super clock divider has additional enable bit which
+ *      is set when divider value is not 0. This flags indicates that the
+ *      divider is for super clock.
  */
 struct tegra_clk_frac_div {
 	struct clk_hw	hw;
@@ -70,6 +73,7 @@ struct tegra_clk_frac_div {
 #define TEGRA_DIVIDER_FIXED BIT(1)
 #define TEGRA_DIVIDER_INT BIT(2)
 #define TEGRA_DIVIDER_UART BIT(3)
+#define TEGRA_DIVIDER_SUPER BIT(4)
 
 extern const struct clk_ops tegra_clk_frac_div_ops;
 struct clk *tegra_clk_register_divider(const char *name,
-- 
2.22.0
