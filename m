From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] ALSA: hda/tegra: clear pending irq handlers
Date: Wed, 26 Dec 2018 16:04:49 +0530
Message-ID: <1545820489-13292-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Even after disabling interrupts on the module, it could be possible
that irq handlers are still running. System hang is seen during
suspend path. It was found that, there were pending writes on the
HDA bus and clock was disabled by that time.

Above mentioned issue is fixed by clearing any pending irq handlers
before disabling clocks and returning from hda suspend.

Suggested-by: Mohan Kumar <mkumard@nvidia.com>
Suggested-by: Dara Ramesh <dramesh@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 83befd8..97a176d 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -234,10 +234,12 @@ static int hda_tegra_suspend(struct device *dev)
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip = card->private_data;
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
+	struct hdac_bus *bus = azx_bus(chip);
 
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 
 	azx_stop_chip(chip);
+	synchronize_irq(bus->irq);
 	azx_enter_link_reset(chip);
 	hda_tegra_disable_clocks(hda);
 
-- 
2.7.4
