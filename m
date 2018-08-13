From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2] ASoC: wm9712: fix replace codec to component
Date: Tue, 14 Aug 2018 00:35:56 +0200
Message-ID: <20180813223556.16262-1-marcel@ziswiler.com>
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
To: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Since commit 143b44845d87 ("ASoC: wm9712: replace codec to component")
"wm9712-codec" got renamed to "wm9712-component", however, this change
never got propagated down to the actual board/platform drivers. E.g. on
Colibri T20 this lead to the following spew upon boot with sound/touch
being broken:

[    2.214121] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
[    2.222137] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
...
[    2.344384] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
[    2.351885] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
...
[    2.668339] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
[    2.675811] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
...
[    3.208408] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
[    3.216312] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
...
[    3.235397] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
[    3.248938] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
...
[   14.970443] ALSA device list:
[   14.996628]   No soundcards found.

This commit finally fixes this again.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Simply rename "wm9712-component" back to "wm9712-codec" as suggested
  by Kuninori and Charles.

 sound/soc/codecs/wm9712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 953d94d50586..ade34c26ad2f 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -719,7 +719,7 @@ static int wm9712_probe(struct platform_device *pdev)
 
 static struct platform_driver wm9712_component_driver = {
 	.driver = {
-		.name = "wm9712-component",
+		.name = "wm9712-codec",
 	},
 
 	.probe = wm9712_probe,
-- 
2.14.4
