From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ALSA: hda/tegra: avoid build error without CONFIG_PM
Date: Mon,  4 Mar 2019 21:33:25 +0100
Message-ID: <20190304203337.1968705-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sameer Pujar <spujar@nvidia.com>, Mohan Kumar D <mkumard@nvidia.com>, Ravindra Lokhande <rlokhande@nvidia.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The #ifdef protection around the PM functions is wrong, leading to
a failed reference in some configurations:

sound/pci/hda/hda_tegra.c: In function 'hda_tegra_runtime_suspend':
sound/pci/hda/hda_tegra.c:273:2: error: implicit declaration of function 'hda_tegra_disable_clocks'; did you mean 'hda_tegra_enable_clocks'? [-Werror=implicit-function-declaration]

Better remove the #ifdefs entirely and rely on the compiler silently
dropping unused functions marked __maybe_unused.

Fixes: 707e0759f2f4 ("ALSA: hda/tegra: implement runtime suspend/resume")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/pci/hda/hda_tegra.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index dbd8da5685cb..3d68f9ef7694 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -219,7 +219,6 @@ static int hda_tegra_enable_clocks(struct hda_tegra *data)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static void hda_tegra_disable_clocks(struct hda_tegra *data)
 {
 	clk_disable_unprepare(data->hda2hdmi_clk);
@@ -230,7 +229,7 @@ static void hda_tegra_disable_clocks(struct hda_tegra *data)
 /*
  * power management
  */
-static int hda_tegra_suspend(struct device *dev)
+static int __maybe_unused hda_tegra_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	int rc;
@@ -243,7 +242,7 @@ static int hda_tegra_suspend(struct device *dev)
 	return 0;
 }
 
-static int hda_tegra_resume(struct device *dev)
+static int __maybe_unused hda_tegra_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	int rc;
@@ -255,10 +254,8 @@ static int hda_tegra_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-#ifdef CONFIG_PM
-static int hda_tegra_runtime_suspend(struct device *dev)
+static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip = card->private_data;
@@ -275,7 +272,7 @@ static int hda_tegra_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int hda_tegra_runtime_resume(struct device *dev)
+static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip = card->private_data;
@@ -292,7 +289,6 @@ static int hda_tegra_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops hda_tegra_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(hda_tegra_suspend, hda_tegra_resume)
-- 
2.20.0
