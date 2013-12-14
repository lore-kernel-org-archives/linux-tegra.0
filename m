From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] ASoC: tegra20-ac97: fix error return code in tegra20_ac97_platform_probe()
Date: Sat, 14 Dec 2013 13:15:45 +0800
Message-ID: <CAPgLHd8W+vo9FD7tAT3eBM_-akXStB8ib93xTk6oS8+5TTYNAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

Fix to return -ENODEV instead of 0 when no GPIO supplied in
tegra20_ac97_platform_probe().

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 sound/soc/tegra/tegra20_ac97.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index d8b98d7..3ea9738 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -358,6 +358,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 		}
 	} else {
 		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
+		ret = -ENODEV;
 		goto err_clk_put;
 	}
 
@@ -365,6 +366,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 					    "nvidia,codec-sync-gpio", 0);
 	if (!gpio_is_valid(ac97->sync_gpio)) {
 		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
+		ret = -ENODEV;
 		goto err_clk_put;
 	}
 
