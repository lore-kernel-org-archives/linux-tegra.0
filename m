From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v9 04/22] clk: tegra: pllout: Save and restore pllout context
Date: Fri, 16 Aug 2019 12:41:49 -0700
Message-ID: <1565984527-5272-5-git-send-email-skomatineni@nvidia.com>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch implements save and restore of pllout context.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry the state of pllout is saved and on resume
it is restored back to have pllout in same state as before suspend.

pllout rate is saved and restore in clock divider so it will be at
same rate as before suspend when pllout state is restored.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-pll-out.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
index 35f2bf00e1e6..d8bf89a81e6d 100644
--- a/drivers/clk/tegra/clk-pll-out.c
+++ b/drivers/clk/tegra/clk-pll-out.c
@@ -69,10 +69,19 @@ static void clk_pll_out_disable(struct clk_hw *hw)
 		spin_unlock_irqrestore(pll_out->lock, flags);
 }
 
+static void tegra_clk_pll_out_restore_context(struct clk_hw *hw)
+{
+	if (!__clk_get_enable_count(hw->clk))
+		clk_pll_out_disable(hw);
+	else
+		clk_pll_out_enable(hw);
+}
+
 const struct clk_ops tegra_clk_pll_out_ops = {
 	.is_enabled = clk_pll_out_is_enabled,
 	.enable = clk_pll_out_enable,
 	.disable = clk_pll_out_disable,
+	.restore_context = tegra_clk_pll_out_restore_context,
 };
 
 struct clk *tegra_clk_register_pll_out(const char *name,
-- 
2.7.4
