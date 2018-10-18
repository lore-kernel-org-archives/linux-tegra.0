From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1 3/3] ASoC: soc-core: fix platform name vs.
	of_node assignement
Date: Thu, 18 Oct 2018 13:18:29 +0200
Message-ID: <20181018111829.27056-4-marcel@ziswiler.com>
References: <20181018111829.27056-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181018111829.27056-1-marcel@ziswiler.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This fixes the following error as seen post commit daecf46ee0e5
("ASoC: soc-core: use snd_soc_dai_link_component for platform") on
Apalis TK1 after initial probe deferral:

tegra-snd-sgtl5000 sound: ASoC: Both platform name/of_node are set for
 sgtl5000
tegra-snd-sgtl5000 sound: ASoC: failed to init link sgtl5000
tegra-snd-sgtl5000 sound: snd_soc_register_card failed (-22)
tegra-snd-sgtl5000: probe of sound failed with error -22

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v1:
- Split from the Tegra series as suggested by Mark.
- Fix issue in soc-core rather than working around it in tegra_sgtl5000.

 sound/soc/soc-core.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6ddcf12bc030..b97624005976 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2733,7 +2733,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 int snd_soc_register_card(struct snd_soc_card *card)
 {
 	int i, ret;
-	struct snd_soc_dai_link *link;
+	struct snd_soc_dai_link *link = NULL;
 
 	if (!card->name || !card->dev)
 		return -EINVAL;
@@ -2744,7 +2744,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 		if (ret) {
 			dev_err(card->dev, "ASoC: failed to init link %s\n",
 				link->name);
-			return ret;
+			goto err;
 		}
 	}
 
@@ -2763,7 +2763,17 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->mutex);
 	mutex_init(&card->dapm_mutex);
 
-	return snd_soc_bind_card(card);
+	ret = snd_soc_bind_card(card);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	if (link && link->platform)
+		link->platform = NULL;
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
 
-- 
2.14.4
