From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/5] soc/tegra: pmc: Implement acquire/release for resets
Date: Thu, 21 Feb 2019 16:25:56 +0100
Message-ID: <20190221152557.8534-4-thierry.reding@gmail.com>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221152557.8534-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

By implementing the acquire/release protocol, the resets can be shared
with other drivers that also adhere to this protocol. This will be used
for example by the SOR driver to put hardware into a known good state,
irrespective of whether or not the power domain can be reset.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 0df258518693..0c5f79528e5f 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -656,10 +656,15 @@ static int tegra_genpd_power_on(struct generic_pm_domain *domain)
 	int err;
 
 	err = tegra_powergate_power_up(pg, true);
-	if (err)
+	if (err) {
 		dev_err(dev, "failed to turn on PM domain %s: %d\n",
 			pg->genpd.name, err);
+		goto out;
+	}
 
+	reset_control_release(pg->reset);
+
+out:
 	return err;
 }
 
@@ -669,10 +674,18 @@ static int tegra_genpd_power_off(struct generic_pm_domain *domain)
 	struct device *dev = pg->pmc->dev;
 	int err;
 
+	err = reset_control_acquire(pg->reset);
+	if (err < 0) {
+		pr_err("failed to acquire resets: %d\n", err);
+		return err;
+	}
+
 	err = tegra_powergate_power_down(pg);
-	if (err)
+	if (err) {
 		dev_err(dev, "failed to turn off PM domain %s: %d\n",
 			pg->genpd.name, err);
+		reset_control_release(pg->reset);
+	}
 
 	return err;
 }
@@ -937,20 +950,34 @@ static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
 	struct device *dev = pg->pmc->dev;
 	int err;
 
-	pg->reset = of_reset_control_array_get_exclusive(np);
+	pg->reset = of_reset_control_array_get_exclusive_released(np);
 	if (IS_ERR(pg->reset)) {
 		err = PTR_ERR(pg->reset);
 		dev_err(dev, "failed to get device resets: %d\n", err);
 		return err;
 	}
 
-	if (off)
+	err = reset_control_acquire(pg->reset);
+	if (err < 0) {
+		pr_err("failed to acquire resets: %d\n", err);
+		goto out;
+	}
+
+	if (off) {
 		err = reset_control_assert(pg->reset);
-	else
+	} else {
 		err = reset_control_deassert(pg->reset);
+		if (err < 0)
+			goto out;
 
-	if (err)
+		reset_control_release(pg->reset);
+	}
+
+out:
+	if (err) {
+		reset_control_release(pg->reset);
 		reset_control_put(pg->reset);
+	}
 
 	return err;
 }
-- 
2.20.1
