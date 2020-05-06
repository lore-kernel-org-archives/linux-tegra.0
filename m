From: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Subject: [PATCH] memory: tegra: Fix an error handling path in 'tegra186_emc_probe()'
Date: Wed,  6 May 2020 22:09:07 +0200
Message-ID: <20200506200907.195502-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The call to 'tegra_bpmp_get()' must be balanced by a call to
'tegra_bpmp_put()' in case of error, as already done in the remove
function.

Add an error handling path and corresponding goto.

Fixes: 52d15dd23f0b ("memory: tegra: Support DVFS on Tegra186 and later")
Signed-off-by: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
---
 drivers/memory/tegra/tegra186-emc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 97f26bc77ad4..7b35bf6450f3 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -185,7 +185,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 	if (IS_ERR(emc->clk)) {
 		err = PTR_ERR(emc->clk);
 		dev_err(&pdev->dev, "failed to get EMC clock: %d\n", err);
-		return err;
+		goto err_put_bpmp;
 	}
 
 	platform_set_drvdata(pdev, emc);
@@ -201,7 +201,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 	err = tegra_bpmp_transfer(emc->bpmp, &msg);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to EMC DVFS pairs: %d\n", err);
-		return err;
+		goto err_put_bpmp;
 	}
 
 	emc->debugfs.min_rate = ULONG_MAX;
@@ -211,8 +211,10 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 
 	emc->dvfs = devm_kmalloc_array(&pdev->dev, emc->num_dvfs,
 				       sizeof(*emc->dvfs), GFP_KERNEL);
-	if (!emc->dvfs)
-		return -ENOMEM;
+	if (!emc->dvfs) {
+		err = -ENOMEM;
+		goto err_put_bpmp;
+	}
 
 	dev_dbg(&pdev->dev, "%u DVFS pairs:\n", emc->num_dvfs);
 
@@ -237,7 +239,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 			"failed to set rate range [%lu-%lu] for %pC\n",
 			emc->debugfs.min_rate, emc->debugfs.max_rate,
 			emc->clk);
-		return err;
+		goto err_put_bpmp;
 	}
 
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
@@ -254,6 +256,10 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 			    emc, &tegra186_emc_debug_max_rate_fops);
 
 	return 0;
+
+err_put_bpmp:
+	tegra_bpmp_put(emc->bpmp);
+	return err;
 }
 
 static int tegra186_emc_remove(struct platform_device *pdev)
-- 
2.25.1
