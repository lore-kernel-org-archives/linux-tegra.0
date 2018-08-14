From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2] clk: tegra: probe deferral error reporting
Date: Tue, 14 Aug 2018 11:18:05 +0200
Message-ID: <20180814091805.1363-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, Stefan Agner <stefan@agner.ch>, Peter Geis <pgwipeout@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Actually report the error code from devm_regulator_get() which may as
well just be a probe deferral.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Silence probe deferral as discussed between Peter, Stefan and Stephen.
- Fix line over 80 characters as reported by checkpatch.

 drivers/clk/tegra/clk-dfll.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 48ee43734e05..ebb0e1b6bf01 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1609,8 +1609,12 @@ int tegra_dfll_register(struct platform_device *pdev,
 
 	td->vdd_reg = devm_regulator_get(td->dev, "vdd-cpu");
 	if (IS_ERR(td->vdd_reg)) {
-		dev_err(td->dev, "couldn't get vdd_cpu regulator\n");
-		return PTR_ERR(td->vdd_reg);
+		ret = PTR_ERR(td->vdd_reg);
+		if (ret != -EPROBE_DEFER)
+			dev_err(td->dev, "couldn't get vdd_cpu regulator: %d\n",
+				ret);
+
+		return ret;
 	}
 
 	td->dvco_rst = devm_reset_control_get(td->dev, "dvco");
-- 
2.14.4
