From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 1/2] ASoC: tegra: improve goto error label
Date: Fri, 20 Jul 2018 10:04:23 +0200
Message-ID: <20180720080424.31505-1-marcel@ziswiler.com>
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
To: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

While the two error labels "err" and "err_clk_put" goto the same place
it is rather confusing that the earlier one is certainly used later
again.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 sound/soc/tegra/tegra20_ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index affad46bf188..682ef33afb5f 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -377,7 +377,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(ac97->clk_ac97);
 	if (ret) {
 		dev_err(&pdev->dev, "clk_enable failed: %d\n", ret);
-		goto err;
+		goto err_clk_put;
 	}
 
 	ret = snd_soc_set_ac97_ops(&tegra20_ac97_ops);
-- 
2.14.4
