From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] sdhci: tegra: Avoid reading autocal timeout values when not applicable
Date: Wed, 20 May 2020 13:08:57 -0700
Message-ID: <1590005337-1087-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When auto calibration timeouts, calibration is disabled and fail-safe
drive strength values are programmed based on the signal voltage.

Different fail-safe drive strength values based on voltage are
applicable only for SoCs supporting 3V3 and 1V8 pad controls.

So, this patch avoids reading these properties from the device tree
for SoCs not using pad controls and the warning of missing properties
will not show up on these SoC platforms.

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mmc/host/sdhci-tegra.c | 57 ++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 3e2c510..141b49b 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -605,6 +605,39 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 		autocal->pull_down_1v8 = 0;
 
 	err = device_property_read_u32(host->mmc->parent,
+			"nvidia,pad-autocal-pull-up-offset-sdr104",
+			&autocal->pull_up_sdr104);
+	if (err)
+		autocal->pull_up_sdr104 = autocal->pull_up_1v8;
+
+	err = device_property_read_u32(host->mmc->parent,
+			"nvidia,pad-autocal-pull-down-offset-sdr104",
+			&autocal->pull_down_sdr104);
+	if (err)
+		autocal->pull_down_sdr104 = autocal->pull_down_1v8;
+
+	err = device_property_read_u32(host->mmc->parent,
+			"nvidia,pad-autocal-pull-up-offset-hs400",
+			&autocal->pull_up_hs400);
+	if (err)
+		autocal->pull_up_hs400 = autocal->pull_up_1v8;
+
+	err = device_property_read_u32(host->mmc->parent,
+			"nvidia,pad-autocal-pull-down-offset-hs400",
+			&autocal->pull_down_hs400);
+	if (err)
+		autocal->pull_down_hs400 = autocal->pull_down_1v8;
+
+	/*
+	 * Different fail-safe drive strength values based on the signaling
+	 * voltage are applicable for SoCs supporting 3V3 and 1V8 pad controls.
+	 * So, avoid reading below device tree properies for SoCs that don't
+	 * have NVQUIRK_NEEDS_PAD_CONTROL.
+	 */
+	if (!(tegra_host->soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL))
+		return;
+
+	err = device_property_read_u32(host->mmc->parent,
 			"nvidia,pad-autocal-pull-up-offset-3v3-timeout",
 			&autocal->pull_up_3v3_timeout);
 	if (err) {
@@ -647,30 +680,6 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 				mmc_hostname(host->mmc));
 		autocal->pull_down_1v8_timeout = 0;
 	}
-
-	err = device_property_read_u32(host->mmc->parent,
-			"nvidia,pad-autocal-pull-up-offset-sdr104",
-			&autocal->pull_up_sdr104);
-	if (err)
-		autocal->pull_up_sdr104 = autocal->pull_up_1v8;
-
-	err = device_property_read_u32(host->mmc->parent,
-			"nvidia,pad-autocal-pull-down-offset-sdr104",
-			&autocal->pull_down_sdr104);
-	if (err)
-		autocal->pull_down_sdr104 = autocal->pull_down_1v8;
-
-	err = device_property_read_u32(host->mmc->parent,
-			"nvidia,pad-autocal-pull-up-offset-hs400",
-			&autocal->pull_up_hs400);
-	if (err)
-		autocal->pull_up_hs400 = autocal->pull_up_1v8;
-
-	err = device_property_read_u32(host->mmc->parent,
-			"nvidia,pad-autocal-pull-down-offset-hs400",
-			&autocal->pull_down_hs400);
-	if (err)
-		autocal->pull_down_hs400 = autocal->pull_down_1v8;
 }
 
 static void tegra_sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
-- 
2.7.4
