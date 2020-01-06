From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2] ASoC: rt5640: Fix NULL dereference on module unload
Date: Mon,  6 Jan 2020 04:47:07 +0300
Message-ID: <20200106014707.11378-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The rt5640->jack is NULL if jack is already disabled at the time of
driver's module unloading.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - Addressed review comment from Takashi Iwai by making patch's diff a
      bit cleaner and simpler.

    - Addressed review comment from Mark Brown by removing noisy backtrace
      from the commit's message and moving it after --- in order to keep it
      discoverable in the ML archive.

Backtrace:

 Unable to handle kernel NULL pointer dereference at virtual address 00000024
 ...
 (rt5640_set_jack [snd_soc_rt5640])
 (snd_soc_component_set_jack [snd_soc_core])
 (soc_remove_component [snd_soc_core])
 (soc_cleanup_card_resources [snd_soc_core])
 (snd_soc_unregister_card [snd_soc_core])
 (tegra_rt5640_remove [snd_soc_tegra_rt5640])
 (platform_drv_remove)
 (device_release_driver_internal)
 (driver_detach)
 (bus_remove_driver)
 (tegra_rt5640_driver_exit
 (sys_delete_module)

 sound/soc/codecs/rt5640.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index adbae1f36a8a..747ca248bf10 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2432,6 +2432,13 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
+	/*
+	 * soc_remove_component() force-disables jack and thus rt5640->jack
+	 * could be NULL at the time of driver's module unloading.
+	 */
+	if (!rt5640->jack)
+		return;
+
 	disable_irq(rt5640->irq);
 	rt5640_cancel_work(rt5640);
 
-- 
2.24.0
