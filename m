From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v8 19/22] ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init
Date: Mon, 13 Jan 2020 23:24:24 -0800
Message-ID: <1578986667-16041-20-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
through Tegra210 and currently Tegra clock driver keeps the audio
mclk enabled.

With the move of PMC clocks from clock driver into pmc driver,
audio mclk enable from clock driver is removed and this should be
taken care by the audio driver.

tegra_asoc_utils_init calls tegra_asoc_utils_set_rate and audio mclk
rate configuration is not needed during init and set_rate is actually
done during hw_params callback.

So, this patch removes tegra_asoc_utils_set_rate call and just leaves
the audio mclk enabled.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 sound/soc/tegra/tegra_asoc_utils.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 1dce5ad6e665..99584970f5f4 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -216,9 +216,16 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		data->clk_cdev1 = clk_out_1;
 	}
 
-	ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
-	if (ret)
+	/*
+	 * FIXME: There is some unknown dependency between audio mclk disable
+	 * and suspend-resume functionality on Tegra30, although audio mclk is
+	 * only needed for audio.
+	 */
+	ret = clk_prepare_enable(data->clk_cdev1);
+	if (ret) {
+		dev_err(data->dev, "Can't enable cdev1: %d\n", ret);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.7.4
