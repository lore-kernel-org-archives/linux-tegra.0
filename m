From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ASoC: tegra: add Tegra114 support to tegra_asoc_utils.c
Date: Thu, 21 Mar 2013 13:56:42 -0600
Message-ID: <1363895802-20484-2-git-send-email-swarren@wwwdotorg.org>
References: <1363895802-20484-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363895802-20484-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra114 requires different PLL rates. Modify the code to know about
this.

On Tegra114 only for now, use regular clk_get() rather than clk_get_sys()
to retrieve clocks. This assumes that the clocks will be represented in
device tree. We can assure that from the start of any Tegra114 audio
support. For older chips, I'll add the required clocks properties to the
device trees this kernel cycle, and switch this code to only support the
"new_clocks" path next cycle.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_asoc_utils.c |   30 ++++++++++++++++++++++++------
 sound/soc/tegra/tegra_asoc_utils.h |    1 +
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 49861c6..24fb001b 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -43,8 +43,10 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 	case 88200:
 		if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
 			new_baseclock = 56448000;
-		else
+		else if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA30)
 			new_baseclock = 564480000;
+		else
+			new_baseclock = 282240000;
 		break;
 	case 8000:
 	case 16000:
@@ -54,8 +56,10 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 	case 96000:
 		if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
 			new_baseclock = 73728000;
-		else
+		else if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA30)
 			new_baseclock = 552960000;
+		else
+			new_baseclock = 368640000;
 		break;
 	default:
 		return -EINVAL;
@@ -169,6 +173,7 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev)
 {
 	int ret;
+	bool new_clocks = false;
 
 	data->dev = dev;
 
@@ -176,24 +181,37 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA20;
 	else if (of_machine_is_compatible("nvidia,tegra30"))
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA30;
-	else
+	else if (of_machine_is_compatible("nvidia,tegra114")) {
+		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA114;
+		new_clocks = true;
+	} else {
+		dev_err(data->dev, "SoC unknown to Tegra ASoC utils\n");
 		return -EINVAL;
+	}
 
-	data->clk_pll_a = clk_get_sys(NULL, "pll_a");
+	if (new_clocks)
+		data->clk_pll_a = clk_get(dev, "pll_a");
+	else
+		data->clk_pll_a = clk_get_sys(NULL, "pll_a");
 	if (IS_ERR(data->clk_pll_a)) {
 		dev_err(data->dev, "Can't retrieve clk pll_a\n");
 		ret = PTR_ERR(data->clk_pll_a);
 		goto err;
 	}
 
-	data->clk_pll_a_out0 = clk_get_sys(NULL, "pll_a_out0");
+	if (new_clocks)
+		data->clk_pll_a_out0 = clk_get(dev, "pll_a_out0");
+	else
+		data->clk_pll_a_out0 = clk_get_sys(NULL, "pll_a_out0");
 	if (IS_ERR(data->clk_pll_a_out0)) {
 		dev_err(data->dev, "Can't retrieve clk pll_a_out0\n");
 		ret = PTR_ERR(data->clk_pll_a_out0);
 		goto err_put_pll_a;
 	}
 
-	if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
+	if (new_clocks)
+		data->clk_cdev1 = clk_get(dev, "mclk");
+	else if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
 		data->clk_cdev1 = clk_get_sys(NULL, "cdev1");
 	else
 		data->clk_cdev1 = clk_get_sys("extern1", NULL);
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra_asoc_utils.h
index 974c9f8..19fdcaf 100644
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ b/sound/soc/tegra/tegra_asoc_utils.h
@@ -29,6 +29,7 @@ struct device;
 enum tegra_asoc_utils_soc {
 	TEGRA_ASOC_UTILS_SOC_TEGRA20,
 	TEGRA_ASOC_UTILS_SOC_TEGRA30,
+	TEGRA_ASOC_UTILS_SOC_TEGRA114,
 };
 
 struct tegra_asoc_utils_data {
-- 
1.7.10.4
