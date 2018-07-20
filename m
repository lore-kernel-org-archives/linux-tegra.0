From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 2/2] ASoC: tegra: probe deferral error reporting
Date: Fri, 20 Jul 2018 10:04:24 +0200
Message-ID: <20180720080424.31505-2-marcel@ziswiler.com>
References: <20180720080424.31505-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180720080424.31505-1-marcel@ziswiler.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Actually report the error codes from of_get_named_gpio() resp.
devm_gpio_request_one() upon trying to get the codec reset resp. sync
GPIOs which may as well just be a probe deferrals.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 sound/soc/tegra/tegra20_ac97.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 682ef33afb5f..4875512f0732 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -351,18 +351,21 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 		ret = devm_gpio_request_one(&pdev->dev, ac97->reset_gpio,
 					    GPIOF_OUT_INIT_HIGH, "codec-reset");
 		if (ret) {
-			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
+			dev_err(&pdev->dev, "could not get codec-reset GPIO: "
+					    "%d\n", ret);
 			goto err_clk_put;
 		}
 	} else {
-		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
+		ret = ac97->reset_gpio;
+		dev_err(&pdev->dev, "no codec-reset GPIO supplied: %d\n", ret);
 		goto err_clk_put;
 	}
 
 	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
 					    "nvidia,codec-sync-gpio", 0);
 	if (!gpio_is_valid(ac97->sync_gpio)) {
-		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
+		ret = ac97->sync_gpio;
+		dev_err(&pdev->dev, "no codec-sync GPIO supplied: %d\n", ret);
 		goto err_clk_put;
 	}
 
-- 
2.14.4
