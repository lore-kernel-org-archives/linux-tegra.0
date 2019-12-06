From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v3 09/15] ASoC: tegra: Add fallback for audio mclk
Date: Thu, 5 Dec 2019 18:48:49 -0800
Message-ID: <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
are moved to Tegra PMC driver with pmc as clock provider and using pmc
clock ids.

New device tree uses clk_out_1 from pmc clock provider.

So, this patch adds fallback to extern1 in case of retrieving mclk fails
to be backward compatible of new device tree with older kernels.

Cc: stable@vger.kernel.org

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 sound/soc/tegra/tegra_asoc_utils.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 8e3a3740df7c..f7408d5240c0 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -211,8 +211,14 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 	data->clk_cdev1 = clk_get(dev, "mclk");
 	if (IS_ERR(data->clk_cdev1)) {
 		dev_err(data->dev, "Can't retrieve clk cdev1\n");
-		ret = PTR_ERR(data->clk_cdev1);
-		goto err_put_pll_a_out0;
+		data->clk_cdev1 = clk_get_sys("clk_out_1", "extern1");
+		if (IS_ERR(data->clk_cdev1)) {
+			dev_err(data->dev, "Can't retrieve clk extern1\n");
+			ret = PTR_ERR(data->clk_cdev1);
+			goto err_put_pll_a_out0;
+		}
+
+		dev_err(data->dev, "Falling back to extern1\n");
 	}
 
 	/*
-- 
2.7.4
