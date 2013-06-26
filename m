From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: tegra20-ac97: Convert to
	devm_clk_get()
Date: Wed, 26 Jun 2013 12:20:07 +0100
Message-ID: <1372245608-15596-1-git-send-email-broonie@kernel.org>
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
To: Stephen Warren <swarren@wwwdotorg.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@linaro.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie@linaro.org>

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/tegra/tegra20_ac97.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 2f70ea7..d8c142d 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -327,7 +327,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, ac97);
 
-	ac97->clk_ac97 = clk_get(&pdev->dev, NULL);
+	ac97->clk_ac97 = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(ac97->clk_ac97)) {
 		dev_err(&pdev->dev, "Can't retrieve ac97 clock\n");
 		ret = PTR_ERR(ac97->clk_ac97);
@@ -443,7 +443,6 @@ err_unregister_pcm:
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
 err_clk_put:
-	clk_put(ac97->clk_ac97);
 err:
 	return ret;
 }
@@ -458,7 +457,6 @@ static int tegra20_ac97_platform_remove(struct platform_device *pdev)
 	tegra_asoc_utils_fini(&ac97->util_data);
 
 	clk_disable_unprepare(ac97->clk_ac97);
-	clk_put(ac97->clk_ac97);
 
 	return 0;
 }
-- 
1.8.3.1
