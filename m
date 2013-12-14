From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] ASoC: tegra20-ac97: add missing clk_disable_unprepare()
 on error path
Date: Sat, 14 Dec 2013 13:29:11 +0800
Message-ID: <CAPgLHd8f20ryuiZwUqAHfWb4Uujp6=XyNosVWxjD5E9e7kBdow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

Add the missing clk_disable_unprepare() before return from
tegra20_ac97_platform_probe() in the error handling case.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 sound/soc/tegra/tegra20_ac97.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index d8b98d7..cf5e1cf 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -393,7 +393,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ret = snd_soc_set_ac97_ops(&tegra20_ac97_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set AC'97 ops: %d\n", ret);
-		goto err_asoc_utils_fini;
+		goto err_clk_disable_unprepare;
 	}
 
 	ret = snd_soc_register_component(&pdev->dev, &tegra20_ac97_component,
@@ -401,7 +401,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
-		goto err_asoc_utils_fini;
+		goto err_clk_disable_unprepare;
 	}
 
 	ret = tegra_pcm_platform_register(&pdev->dev);
@@ -417,6 +417,8 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
+err_clk_disable_unprepare:
+	clk_disable_unprepare(ac97->clk_ac97);
 err_asoc_utils_fini:
 	tegra_asoc_utils_fini(&ac97->util_data);
 err_clk_put:
