From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: [PATCH] ASoC: tegra_alc5632: fix device_node refcounting
Date: Sat, 28 Jul 2018 00:06:59 +0300
Message-ID: <1532725619-8775-1-git-send-email-khoroshilov@ispras.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-Id: linux-tegra@vger.kernel.org

tegra_alc5632_probe() increments reference count of device nodes
with of_parse_phandle(), but there is no code decrementing them
in the driver.

The patch adds of_node_put() to tegra_alc5632_remove() and
to error handling paths in the probe.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 sound/soc/tegra/tegra_alc5632.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 5197d6b18cb6..98d87801d57a 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -190,14 +190,14 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
 		ret = -EINVAL;
-		goto err;
+		goto err_put_codec_of_node;
 	}
 
 	tegra_alc5632_dai.platform_of_node = tegra_alc5632_dai.cpu_of_node;
 
 	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		goto err_put_cpu_of_node;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
@@ -210,6 +210,13 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 
 err_fini_utils:
 	tegra_asoc_utils_fini(&alc5632->util_data);
+err_put_cpu_of_node:
+	of_node_put(tegra_alc5632_dai.cpu_of_node);
+	tegra_alc5632_dai.cpu_of_node = NULL;
+	tegra_alc5632_dai.platform_of_node = NULL;
+err_put_codec_of_node:
+	of_node_put(tegra_alc5632_dai.codec_of_node);
+	tegra_alc5632_dai.codec_of_node = NULL;
 err:
 	return ret;
 }
@@ -223,6 +230,12 @@ static int tegra_alc5632_remove(struct platform_device *pdev)
 
 	tegra_asoc_utils_fini(&machine->util_data);
 
+	of_node_put(tegra_alc5632_dai.cpu_of_node);
+	tegra_alc5632_dai.cpu_of_node = NULL;
+	tegra_alc5632_dai.platform_of_node = NULL;
+	of_node_put(tegra_alc5632_dai.codec_of_node);
+	tegra_alc5632_dai.codec_of_node = NULL;
+
 	return 0;
 }
 
-- 
2.7.4
