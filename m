From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 05/10] memory: tegra20-emc: Replace clk_get_sys with devm_clk_get
Date: Mon, 17 Jun 2019 02:35:46 +0300
Message-ID: <20190616233551.6838-6-digetx@gmail.com>
References: <20190616233551.6838-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190616233551.6838-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no problem for drivers to request pll_m and pll_p clocks for
the device, hence there is no need to use clk_get_sys() and it could be
replaced with devm_clk_get() for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 43aef3614b65..527aa4b90e95 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -527,33 +527,29 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		goto unset_cb;
 	}
 
-	emc->pll_m = clk_get_sys(NULL, "pll_m");
+	emc->pll_m = devm_clk_get(&pdev->dev, "pll_m");
 	if (IS_ERR(emc->pll_m)) {
 		err = PTR_ERR(emc->pll_m);
 		dev_err(&pdev->dev, "failed to get pll_m clock: %d\n", err);
 		goto unset_cb;
 	}
 
-	emc->backup_clk = clk_get_sys(NULL, "pll_p");
+	emc->backup_clk = devm_clk_get(&pdev->dev, "pll_p");
 	if (IS_ERR(emc->backup_clk)) {
 		err = PTR_ERR(emc->backup_clk);
 		dev_err(&pdev->dev, "failed to get pll_p clock: %d\n", err);
-		goto put_pll_m;
+		goto unset_cb;
 	}
 
 	err = clk_notifier_register(emc->clk, &emc->clk_nb);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register clk notifier: %d\n",
 			err);
-		goto put_backup;
+		goto unset_cb;
 	}
 
 	return 0;
 
-put_backup:
-	clk_put(emc->backup_clk);
-put_pll_m:
-	clk_put(emc->pll_m);
 unset_cb:
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
 
-- 
2.22.0
