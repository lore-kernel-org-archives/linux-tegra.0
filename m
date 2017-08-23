From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ASoC: tegra: Remove superfluous 'machine'
	variable
Date: Wed, 23 Aug 2017 15:46:30 +0200
Message-ID: <20170823134715.1088951-1-arnd@arndb.de>
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
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The last cleanup left behind an unused variable:

sound/soc/tegra/tegra_wm8903.c: In function 'tegra_wm8903_remove':
sound/soc/tegra/tegra_wm8903.c:206:23: error: unused variable 'machine' [-Werror=unused-variable]

This removes it as welremoves it as welll

Fixes: 2a8bd83af30e ("ASoC: tegra: Remove superfluous snd_soc_jack_free_gpios() call")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra_wm8903.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 2384cb9cb95c..18bdae59a4df 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -203,7 +203,6 @@ static int tegra_wm8903_remove(struct snd_soc_card *card)
 		snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	struct snd_soc_codec *codec = codec_dai->codec;
-	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 
 	wm8903_mic_detect(codec, NULL, 0, 0);
 
-- 
2.9.0
