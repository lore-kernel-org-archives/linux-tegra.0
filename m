From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ASoC: tegra20-ac97: Remove unused variable
Date: Fri, 28 Jun 2013 21:53:25 +0200
Message-ID: <1372449205-22231-2-git-send-email-thierry.reding@gmail.com>
References: <1372449205-22231-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372449205-22231-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

With the conversion to devm_ioremap_resource() the memregion variable is
no longer used so it can be dropped.

Signed-off-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra20_ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index c1f08f3..0fef1b4 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -313,7 +313,7 @@ static const struct regmap_config tegra20_ac97_regmap_config = {
 static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 {
 	struct tegra20_ac97 *ac97;
-	struct resource *mem, *memregion;
+	struct resource *mem;
 	u32 of_dma[2];
 	void __iomem *regs;
 	int ret = 0;
-- 
1.8.3.1
