From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clk: tegra: dfll: Fix drvdata overwriting issue
Date: Thu, 12 Oct 2017 16:09:59 -0700
Message-ID: <1507849799-4256-1-git-send-email-nicoleotsuka@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Both tegra124-dfll and clk-dfll are using platform_set_drvdata
to set drvdata of the exact same pdev while they use different
pointers for the drvdata. Once the drvdata has been overwritten
by tegra124-dfll, clk-dfll will never get its td pointer as it
expects.

Since tegra124-dfll merely needs its soc pointer in its remove
function, this patch fixes the bug by removing the overwriting
in the tegra124-dfll file and letting the tegra_dfll_unregister
return an soc pointer for it.

Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

As I don't have a T124 platform, I can't verify it on a board.
If someone could provide a Tested-by, it would be very helpful.
The test could be a simple system suspend/resume that activates
runtime_suspend/resume() where a platform_get_drvdata() would
be called. -- Nicolin

 drivers/clk/tegra/clk-dfll.c               | 10 +++++-----
 drivers/clk/tegra/clk-dfll.h               |  2 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 12 +++++-------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 2c44aeb..0a7deee 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1728,10 +1728,10 @@ EXPORT_SYMBOL(tegra_dfll_register);
  * @pdev: DFLL platform_device *
  *
  * Unbind this driver from the DFLL hardware device represented by
- * @pdev. The DFLL must be disabled for this to succeed. Returns 0
- * upon success or -EBUSY if the DFLL is still active.
+ * @pdev. The DFLL must be disabled for this to succeed. Returns a
+ * soc pointer upon success or -EBUSY if the DFLL is still active.
  */
-int tegra_dfll_unregister(struct platform_device *pdev)
+struct tegra_dfll_soc_data *tegra_dfll_unregister(struct platform_device *pdev)
 {
 	struct tegra_dfll *td = platform_get_drvdata(pdev);
 
@@ -1739,7 +1739,7 @@ int tegra_dfll_unregister(struct platform_device *pdev)
 	if (td->mode != DFLL_DISABLED) {
 		dev_err(&pdev->dev,
 			"must disable DFLL before removing driver\n");
-		return -EBUSY;
+		return ERR_PTR(-EBUSY);
 	}
 
 	debugfs_remove_recursive(td->debugfs_dir);
@@ -1753,6 +1753,6 @@ int tegra_dfll_unregister(struct platform_device *pdev)
 
 	reset_control_assert(td->dvco_rst);
 
-	return 0;
+	return td->soc;
 }
 EXPORT_SYMBOL(tegra_dfll_unregister);
diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index ed2ad88..83352c8 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -43,7 +43,7 @@ struct tegra_dfll_soc_data {
 
 int tegra_dfll_register(struct platform_device *pdev,
 			struct tegra_dfll_soc_data *soc);
-int tegra_dfll_unregister(struct platform_device *pdev);
+struct tegra_dfll_soc_data *tegra_dfll_unregister(struct platform_device *pdev);
 int tegra_dfll_runtime_suspend(struct device *dev);
 int tegra_dfll_runtime_resume(struct device *dev);
 
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index ad1c1cc..269d359 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -125,19 +125,17 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, soc);
-
 	return 0;
 }
 
 static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
 {
-	struct tegra_dfll_soc_data *soc = platform_get_drvdata(pdev);
-	int err;
+	struct tegra_dfll_soc_data *soc;
 
-	err = tegra_dfll_unregister(pdev);
-	if (err < 0)
-		dev_err(&pdev->dev, "failed to unregister DFLL: %d\n", err);
+	soc = tegra_dfll_unregister(pdev);
+	if (IS_ERR(soc))
+		dev_err(&pdev->dev, "failed to unregister DFLL: %ld\n",
+			PTR_ERR(soc));
 
 	tegra_cvb_remove_opp_table(soc->dev, soc->cvb, soc->max_freq);
 
-- 
2.1.4
