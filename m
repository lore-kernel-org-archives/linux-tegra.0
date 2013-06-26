From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] ASoC: tegra20-ac97: Convert to devm_ioremap_resource()
Date: Wed, 26 Jun 2013 12:20:08 +0100
Message-ID: <1372245608-15596-2-git-send-email-broonie@kernel.org>
References: <1372245608-15596-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372245608-15596-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 sound/soc/tegra/tegra20_ac97.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index d8c142d..9043626d 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -341,18 +341,10 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 		goto err_clk_put;
 	}
 
-	memregion = devm_request_mem_region(&pdev->dev, mem->start,
-					    resource_size(mem), DRV_NAME);
-	if (!memregion) {
-		dev_err(&pdev->dev, "Memory region already claimed\n");
-		ret = -EBUSY;
-		goto err_clk_put;
-	}
-
-	regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
-	if (!regs) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		ret = -ENOMEM;
+	regs = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(regs)) {
+		ret = PTR_ERR(regs);
+		dev_err(&pdev->dev, "ioremap failed: %d\n", ret);
 		goto err_clk_put;
 	}
 
-- 
1.8.3.1
