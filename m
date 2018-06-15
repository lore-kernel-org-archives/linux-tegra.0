From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: [PATCH] ASoC: tegra: fix device_node refcounting
Date: Sat, 16 Jun 2018 01:22:58 +0300
Message-ID: <1529101378-5543-1-git-send-email-khoroshilov@ispras.ru>
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
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org, sil2review@lists.osadl.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-tegra@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>
List-Id: linux-tegra@vger.kernel.org

tegra_rt5677_probe() gets a couple of device nodes with of_parse_phandle(),
but there is no release of them.

The patch adds the release to tegra_rt5677_remove() and
to error handling paths in the probe.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 sound/soc/tegra/tegra_rt5677.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index 0e4805c7b4ca..7081f15302cc 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -264,13 +264,13 @@ static int tegra_rt5677_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
 		ret = -EINVAL;
-		goto err;
+		goto err_put_codec_of_node;
 	}
 	tegra_rt5677_dai.platform_of_node = tegra_rt5677_dai.cpu_of_node;
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		goto err_put_cpu_of_node;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
@@ -283,6 +283,13 @@ static int tegra_rt5677_probe(struct platform_device *pdev)
 
 err_fini_utils:
 	tegra_asoc_utils_fini(&machine->util_data);
+err_put_cpu_of_node:
+	of_node_put(tegra_rt5677_dai.cpu_of_node);
+	tegra_rt5677_dai.cpu_of_node = NULL;
+	tegra_rt5677_dai.platform_of_node = NULL;
+err_put_codec_of_node:
+	of_node_put(tegra_rt5677_dai.codec_of_node);
+	tegra_rt5677_dai.codec_of_node = NULL;
 err:
 	return ret;
 }
@@ -296,6 +303,12 @@ static int tegra_rt5677_remove(struct platform_device *pdev)
 
 	tegra_asoc_utils_fini(&machine->util_data);
 
+	tegra_rt5677_dai.platform_of_node = NULL;
+	of_node_put(tegra_rt5677_dai.codec_of_node);
+	tegra_rt5677_dai.codec_of_node = NULL;
+	of_node_put(tegra_rt5677_dai.cpu_of_node);
+	tegra_rt5677_dai.cpu_of_node = NULL;
+
 	return 0;
 }
 
-- 
2.7.4
