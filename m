From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/tegra: fix error handling
Date: Sun,  3 Jul 2016 08:18:57 +0200
Message-ID: <1467526737-13591-1-git-send-email-christophe.jaillet@wanadoo.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, gnurou@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-Id: linux-tegra@vger.kernel.org

This is likely that checking 'gr3d->clk_secondary' instead of 'gr3d->clk'
is expected here.


Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/tegra/gr3d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 0b3f2b9..13f0d1b 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -268,9 +268,9 @@ static int gr3d_probe(struct platform_device *pdev)
 
 	if (of_device_is_compatible(np, "nvidia,tegra30-gr3d")) {
 		gr3d->clk_secondary = devm_clk_get(&pdev->dev, "3d2");
-		if (IS_ERR(gr3d->clk)) {
+		if (IS_ERR(gr3d->clk_secondary)) {
 			dev_err(&pdev->dev, "cannot get secondary clock\n");
-			return PTR_ERR(gr3d->clk);
+			return PTR_ERR(gr3d->clk_secondary);
 		}
 
 		gr3d->rst_secondary = devm_reset_control_get(&pdev->dev,
-- 
2.7.4

