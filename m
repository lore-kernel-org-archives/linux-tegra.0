From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/tegra: sor: No need to free devm_ allocated memory
Date: Sat, 24 Sep 2016 22:07:30 +0200
Message-ID: <1474747650-10306-1-git-send-email-christophe.jaillet@wanadoo.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, gnurou@gmail.com, linux-tegra@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-Id: linux-tegra@vger.kernel.org

'brick' has been allocated by 'devm_kzalloc', so there is no need here to
free it explicitly.
There is only one caller of 'tegra_clk_sor_brick_register()'. This function
is a probe function which correctly checks and handles the return value of
'tegra_clk_sor_brick_register()'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/tegra/sor.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 74d0540b8d4c..a8f528925009 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -349,8 +349,6 @@ static struct clk *tegra_clk_sor_brick_register(struct tegra_sor *sor,
 	brick->hw.init = &init;
 
 	clk = devm_clk_register(sor->dev, &brick->hw);
-	if (IS_ERR(clk))
-		kfree(brick);
 
 	return clk;
 }
-- 
2.7.4
