From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] clk: tegra: probe deferral error reporting
Date: Fri, 20 Jul 2018 09:54:22 +0200
Message-ID: <20180720075422.26563-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Actually report the error code from devm_regulator_get() which may as
well just be a probe deferral.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 drivers/clk/tegra/clk-dfll.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 48ee43734e05..b2123084e175 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1609,8 +1609,9 @@ int tegra_dfll_register(struct platform_device *pdev,
 
 	td->vdd_reg = devm_regulator_get(td->dev, "vdd-cpu");
 	if (IS_ERR(td->vdd_reg)) {
-		dev_err(td->dev, "couldn't get vdd_cpu regulator\n");
-		return PTR_ERR(td->vdd_reg);
+		ret = PTR_ERR(td->vdd_reg);
+		dev_err(td->dev, "couldn't get vdd_cpu regulator: %d\n", ret);
+		return ret;
 	}
 
 	td->dvco_rst = devm_reset_control_get(td->dev, "dvco");
-- 
2.14.4
