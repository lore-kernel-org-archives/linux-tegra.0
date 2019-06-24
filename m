From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V4 04/18] clk: tegra: save and restore divider rate
Date: Sun, 23 Jun 2019 20:02:45 -0700
Message-ID: <1561345379-2429-5-git-send-email-skomatineni@nvidia.com>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch implements context save and restore for clock divider.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry the context of clock divider is saved and
on resume context is restored back for normal operation.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-divider.c | 23 +++++++++++++++++++++++
 drivers/clk/tegra/clk.h         |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index e76731fb7d69..ecb7ff9ce97e 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -109,10 +109,33 @@ static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+static int clk_divider_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+
+	divider->rate = clk_frac_div_recalc_rate(hw, parent_rate);
+
+	return 0;
+}
+
+static void clk_divider_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+
+	if (clk_frac_div_set_rate(hw, divider->rate, parent_rate) < 0)
+		WARN_ON(1);
+}
+
 const struct clk_ops tegra_clk_frac_div_ops = {
 	.recalc_rate = clk_frac_div_recalc_rate,
 	.set_rate = clk_frac_div_set_rate,
 	.round_rate = clk_frac_div_round_rate,
+	.save_context = clk_divider_save_context,
+	.restore_context = clk_divider_restore_context,
 };
 
 struct clk *tegra_clk_register_divider(const char *name,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 905bf1096558..83623f5f55f3 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -42,6 +42,7 @@ struct clk *tegra_clk_register_sync_source(const char *name,
  * @width:	width of the divider bit field
  * @frac_width:	width of the fractional bit field
  * @lock:	register lock
+ * @rate:	rate during suspend and resume
  *
  * Flags:
  * TEGRA_DIVIDER_ROUND_UP - This flags indicates to round up the divider value.
@@ -62,6 +63,7 @@ struct tegra_clk_frac_div {
 	u8		width;
 	u8		frac_width;
 	spinlock_t	*lock;
+	unsigned long	rate;
 };
 
 #define to_clk_frac_div(_hw) container_of(_hw, struct tegra_clk_frac_div, hw)
-- 
2.7.4
