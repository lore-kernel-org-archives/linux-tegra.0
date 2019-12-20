From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v5 13/19] ASoC: tegra: Add fallback implementation for audio mclk
Date: Fri, 20 Dec 2019 14:26:59 -0800
Message-ID: <1576880825-15010-14-git-send-email-skomatineni@nvidia.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
are moved to Tegra PMC driver with pmc as clock provider and using pmc
clock ids.

New device tree uses clk_out_1 from pmc clock provider.

So, this patch adds implementation for mclk fallback to extern1 when
retrieving mclk returns -ENOENT to be backward compatible of new device
tree with older kernels.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 sound/soc/tegra/tegra_asoc_utils.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index fc3135c08f43..46ff70c16b74 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -166,7 +166,16 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 	data->clk_cdev1 = devm_clk_get(dev, "mclk");
 	if (IS_ERR(data->clk_cdev1)) {
 		dev_err(data->dev, "Can't retrieve clk cdev1\n");
-		return PTR_ERR(data->clk_cdev1);
+		if (PTR_ERR(data->clk_cdev1) != -ENOENT)
+			return PTR_ERR(data->clk_cdev1);
+		/* Fall back to extern1 */
+		data->clk_cdev1 = devm_clk_get(dev, "extern1");
+		if (IS_ERR(data->clk_cdev1)) {
+			dev_err(data->dev, "Can't retrieve clk extern1\n");
+			return PTR_ERR(data->clk_cdev1);
+		}
+
+		dev_err(data->dev, "Falling back to extern1\n");
 	}
 
 	/*
-- 
2.7.4
