From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ASoC: tegra: always use clk_get() in utility
	code
Date: Mon, 13 May 2013 13:26:12 -0600
Message-ID: <1368473172-10198-1-git-send-email-swarren@wwwdotorg.org>
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
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Now that all of the Tegra device trees have been updated to represent
the required audio clocks, remove the compatibility code from the Tegra
ASoC utility code, and always use clk_get() rather than clk_get_sys().

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 sound/soc/tegra/tegra_asoc_utils.c |   23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 24fb001b..d173880 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -173,7 +173,6 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev)
 {
 	int ret;
-	bool new_clocks = false;
 
 	data->dev = dev;
 
@@ -181,40 +180,28 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA20;
 	else if (of_machine_is_compatible("nvidia,tegra30"))
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA30;
-	else if (of_machine_is_compatible("nvidia,tegra114")) {
+	else if (of_machine_is_compatible("nvidia,tegra114"))
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA114;
-		new_clocks = true;
-	} else {
+	else {
 		dev_err(data->dev, "SoC unknown to Tegra ASoC utils\n");
 		return -EINVAL;
 	}
 
-	if (new_clocks)
-		data->clk_pll_a = clk_get(dev, "pll_a");
-	else
-		data->clk_pll_a = clk_get_sys(NULL, "pll_a");
+	data->clk_pll_a = clk_get(dev, "pll_a");
 	if (IS_ERR(data->clk_pll_a)) {
 		dev_err(data->dev, "Can't retrieve clk pll_a\n");
 		ret = PTR_ERR(data->clk_pll_a);
 		goto err;
 	}
 
-	if (new_clocks)
-		data->clk_pll_a_out0 = clk_get(dev, "pll_a_out0");
-	else
-		data->clk_pll_a_out0 = clk_get_sys(NULL, "pll_a_out0");
+	data->clk_pll_a_out0 = clk_get(dev, "pll_a_out0");
 	if (IS_ERR(data->clk_pll_a_out0)) {
 		dev_err(data->dev, "Can't retrieve clk pll_a_out0\n");
 		ret = PTR_ERR(data->clk_pll_a_out0);
 		goto err_put_pll_a;
 	}
 
-	if (new_clocks)
-		data->clk_cdev1 = clk_get(dev, "mclk");
-	else if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
-		data->clk_cdev1 = clk_get_sys(NULL, "cdev1");
-	else
-		data->clk_cdev1 = clk_get_sys("extern1", NULL);
+	data->clk_cdev1 = clk_get(dev, "mclk");
 	if (IS_ERR(data->clk_cdev1)) {
 		dev_err(data->dev, "Can't retrieve clk cdev1\n");
 		ret = PTR_ERR(data->clk_cdev1);
-- 
1.7.10.4
