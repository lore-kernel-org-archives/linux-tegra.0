From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] ASoC: rt5640: Fix NULL dereference on module unload
Date: Sun, 29 Dec 2019 18:04:54 +0300
Message-ID: <20191229150454.2127-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The rt5640->jack is NULL if jack is already disabled at the time of
driver's module unloading.

 Unable to handle kernel NULL pointer dereference at virtual address 00000024
 ...
 (rt5640_set_jack [snd_soc_rt5640]) from [<bf86f7ed>] (snd_soc_component_set_jack+0x11/0x1c [snd_soc_core])
 (snd_soc_component_set_jack [snd_soc_core]) from [<bf8675cf>] (soc_remove_component+0x1b/0x54 [snd_soc_core])
 (soc_remove_component [snd_soc_core]) from [<bf868859>] (soc_cleanup_card_resources+0xad/0x1cc [snd_soc_core])
 (soc_cleanup_card_resources [snd_soc_core]) from [<bf86945f>] (snd_soc_unregister_card+0x47/0x78 [snd_soc_core])
 (snd_soc_unregister_card [snd_soc_core]) from [<bf8b4013>] (tegra_rt5640_remove+0x13/0x1c [snd_soc_tegra_rt5640])
 (tegra_rt5640_remove [snd_soc_tegra_rt5640]) from [<c0516d2f>] (platform_drv_remove+0x17/0x24)
 (platform_drv_remove) from [<c0515aed>] (device_release_driver_internal+0x95/0x114)
 (device_release_driver_internal) from [<c0515bd9>] (driver_detach+0x4d/0x90)
 (driver_detach) from [<c0514d59>] (bus_remove_driver+0x31/0x70)
 (bus_remove_driver) from [<bf8b4215>] (tegra_rt5640_driver_exit+0x9/0xdf4 [snd_soc_tegra_rt5640])
 (tegra_rt5640_driver_exit [snd_soc_tegra_rt5640]) from [<c019336f>] (sys_delete_module+0xe7/0x184)
 (sys_delete_module) from [<c0101001>] (ret_fast_syscall+0x1/0x28)

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/codecs/rt5640.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index adbae1f36a8a..b245c44cafbc 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2432,16 +2432,22 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
-	disable_irq(rt5640->irq);
-	rt5640_cancel_work(rt5640);
+	/*
+	 * soc_remove_component() force-disables jack and thus rt5640->jack
+	 * could be NULL at the time of driver's module unloading.
+	 */
+	if (rt5640->jack) {
+		disable_irq(rt5640->irq);
+		rt5640_cancel_work(rt5640);
 
-	if (rt5640->jack->status & SND_JACK_MICROPHONE) {
-		rt5640_disable_micbias1_ovcd_irq(component);
-		rt5640_disable_micbias1_for_ovcd(component);
-		snd_soc_jack_report(rt5640->jack, 0, SND_JACK_BTN_0);
-	}
+		if (rt5640->jack->status & SND_JACK_MICROPHONE) {
+			rt5640_disable_micbias1_ovcd_irq(component);
+			rt5640_disable_micbias1_for_ovcd(component);
+			snd_soc_jack_report(rt5640->jack, 0, SND_JACK_BTN_0);
+		}
 
-	rt5640->jack = NULL;
+		rt5640->jack = NULL;
+	}
 }
 
 static int rt5640_set_jack(struct snd_soc_component *component,
-- 
2.24.0
