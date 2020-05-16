From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] sdhci: tegra: Remove warnings about missing device-tree properties
Date: Sat, 16 May 2020 18:43:14 +0300
Message-ID: <20200516154314.14769-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Several people asked me about the MMC warnings in the KMSG log and
I had to tell to ignore them because these warning are irrelevant to
pre-Tegra210 SoCs. It should be up to a board's device-tree writer to
properly describe all the necessary properties. Secondly, eventually all
device-tree bindings will be converted to YAML, which allows to validate
board DT files, giving a warning about missing properties. Hence let's
remove the noisy warnings to stop the confusion.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/mmc/host/sdhci-tegra.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 3e2c5101291d..83867629013d 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -607,46 +607,26 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 	err = device_property_read_u32(host->mmc->parent,
 			"nvidia,pad-autocal-pull-up-offset-3v3-timeout",
 			&autocal->pull_up_3v3_timeout);
-	if (err) {
-		if (!IS_ERR(tegra_host->pinctrl_state_3v3) &&
-			(tegra_host->pinctrl_state_3v3_drv == NULL))
-			pr_warn("%s: Missing autocal timeout 3v3-pad drvs\n",
-				mmc_hostname(host->mmc));
+	if (err)
 		autocal->pull_up_3v3_timeout = 0;
-	}
 
 	err = device_property_read_u32(host->mmc->parent,
 			"nvidia,pad-autocal-pull-down-offset-3v3-timeout",
 			&autocal->pull_down_3v3_timeout);
-	if (err) {
-		if (!IS_ERR(tegra_host->pinctrl_state_3v3) &&
-			(tegra_host->pinctrl_state_3v3_drv == NULL))
-			pr_warn("%s: Missing autocal timeout 3v3-pad drvs\n",
-				mmc_hostname(host->mmc));
+	if (err)
 		autocal->pull_down_3v3_timeout = 0;
-	}
 
 	err = device_property_read_u32(host->mmc->parent,
 			"nvidia,pad-autocal-pull-up-offset-1v8-timeout",
 			&autocal->pull_up_1v8_timeout);
-	if (err) {
-		if (!IS_ERR(tegra_host->pinctrl_state_1v8) &&
-			(tegra_host->pinctrl_state_1v8_drv == NULL))
-			pr_warn("%s: Missing autocal timeout 1v8-pad drvs\n",
-				mmc_hostname(host->mmc));
+	if (err)
 		autocal->pull_up_1v8_timeout = 0;
-	}
 
 	err = device_property_read_u32(host->mmc->parent,
 			"nvidia,pad-autocal-pull-down-offset-1v8-timeout",
 			&autocal->pull_down_1v8_timeout);
-	if (err) {
-		if (!IS_ERR(tegra_host->pinctrl_state_1v8) &&
-			(tegra_host->pinctrl_state_1v8_drv == NULL))
-			pr_warn("%s: Missing autocal timeout 1v8-pad drvs\n",
-				mmc_hostname(host->mmc));
+	if (err)
 		autocal->pull_down_1v8_timeout = 0;
-	}
 
 	err = device_property_read_u32(host->mmc->parent,
 			"nvidia,pad-autocal-pull-up-offset-sdr104",
-- 
2.26.0
