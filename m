From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2] ALSA: hda/tegra: enable clock during probe
Date: Fri, 25 Jan 2019 16:36:58 +0530
Message-ID: <1548414418-5785-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: perex@perex.cz, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, rlokhande@nvidia.com, sharadg@nvidia.com, mkumard@nvidia.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If CONFIG_PM is disabled or runtime PM calls are forbidden, the clocks
will not be ON. This could cause issue during probe, where hda init
setup is done. This patch enables clocks unconditionally during probe.

Along with above, follwoing changes are done.
  * enable runtime PM before exiting from probe work. This helps to avoid
    usage of pm_runtime_get_sync/pm_runtime_put() in probe work.
  * hda_tegra_disable_clocks() is moved out of CONFIG_PM_SLEEP check.
  * runtime PM callbacks moved out of CONFIG_PM check

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Ravindra Lokhande <rlokhande@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index c8d18dc..ba6175f 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -219,7 +219,6 @@ static int hda_tegra_enable_clocks(struct hda_tegra *data)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static void hda_tegra_disable_clocks(struct hda_tegra *data)
 {
 	clk_disable_unprepare(data->hda2hdmi_clk);
@@ -227,6 +226,7 @@ static void hda_tegra_disable_clocks(struct hda_tegra *data)
 	clk_disable_unprepare(data->hda_clk);
 }
 
+#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -257,7 +257,6 @@ static int hda_tegra_resume(struct device *dev)
 }
 #endif /* CONFIG_PM_SLEEP */
 
-#ifdef CONFIG_PM
 static int hda_tegra_runtime_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -283,7 +282,7 @@ static int hda_tegra_runtime_resume(struct device *dev)
 	int rc;
 
 	rc = hda_tegra_enable_clocks(hda);
-	if (rc != 0)
+	if (rc)
 		return rc;
 	if (chip && chip->running) {
 		hda_tegra_init(hda);
@@ -292,7 +291,6 @@ static int hda_tegra_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops hda_tegra_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(hda_tegra_suspend, hda_tegra_resume)
@@ -551,9 +549,9 @@ static int hda_tegra_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, card);
 
-	pm_runtime_enable(hda->dev);
-	if (!azx_has_pm_runtime(chip))
-		pm_runtime_forbid(hda->dev);
+	err = hda_tegra_enable_clocks(hda);
+	if (err)
+		goto out_free;
 
 	schedule_work(&hda->probe_work);
 
@@ -571,7 +569,6 @@ static void hda_tegra_probe_work(struct work_struct *work)
 	struct platform_device *pdev = to_platform_device(hda->dev);
 	int err;
 
-	pm_runtime_get_sync(hda->dev);
 	err = hda_tegra_first_init(chip, pdev);
 	if (err < 0)
 		goto out_free;
@@ -592,8 +589,15 @@ static void hda_tegra_probe_work(struct work_struct *work)
 	chip->running = 1;
 	snd_hda_set_power_save(&chip->bus, power_save * 1000);
 
+	/* set device state as active */
+	if (pm_runtime_set_active(hda->dev) < 0)
+		goto out_free;
+	/* enable runtime PM */
+	pm_runtime_enable(hda->dev);
+	if (!azx_has_pm_runtime(chip))
+		pm_runtime_forbid(hda->dev);
+
  out_free:
-	pm_runtime_put(hda->dev);
 	return; /* no error return from async probe */
 }
 
@@ -603,6 +607,10 @@ static int hda_tegra_remove(struct platform_device *pdev)
 
 	ret = snd_card_free(dev_get_drvdata(&pdev->dev));
 	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev)) {
+		hda_tegra_runtime_suspend(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+	}
 
 	return ret;
 }
-- 
2.7.4
