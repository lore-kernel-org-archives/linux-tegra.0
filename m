From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 11/19] ASoC: tegra: Use device managed resource APIs to
 get the clock
Date: Mon, 23 Dec 2019 00:14:16 +0300
Message-ID: <2942bf97-cb02-9f5f-8b5e-73bd4f72006a@gmail.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-12-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576880825-15010-12-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

21.12.2019 01:26, Sowjanya Komatineni пишет:
> tegra_asoc_utils uses clk_get() and clk_put() to get the clock
> and to free them explicitly.
> 
> This patch updates it to use device managed resource API
> devm_clk_get() so the clock will be automatically released and freed
> when the device is unbound and removes tegra_asoc_utils_fini() as
> its no longer needed.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  sound/soc/tegra/tegra_alc5632.c    |  7 +------
>  sound/soc/tegra/tegra_asoc_utils.c | 34 ++++++----------------------------
>  sound/soc/tegra/tegra_asoc_utils.h |  1 -
>  sound/soc/tegra/tegra_max98090.c   | 22 ++++++----------------
>  sound/soc/tegra/tegra_rt5640.c     | 22 ++++++----------------
>  sound/soc/tegra/tegra_rt5677.c     |  7 +------
>  sound/soc/tegra/tegra_sgtl5000.c   |  7 +------
>  sound/soc/tegra/tegra_wm8753.c     | 22 ++++++----------------
>  sound/soc/tegra/tegra_wm8903.c     | 22 ++++++----------------
>  sound/soc/tegra/tegra_wm9712.c     |  8 ++------
>  sound/soc/tegra/trimslice.c        | 18 ++++--------------
>  11 files changed, 39 insertions(+), 131 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
> index 9e8b1497efd3..50a6d2ff4442 100644
> --- a/sound/soc/tegra/tegra_alc5632.c
> +++ b/sound/soc/tegra/tegra_alc5632.c
> @@ -205,13 +205,11 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
>  			ret);
> -		goto err_fini_utils;
> +		goto err_put_cpu_of_node;
>  	}
>  
>  	return 0;
>  
> -err_fini_utils:
> -	tegra_asoc_utils_fini(&alc5632->util_data);
>  err_put_cpu_of_node:
>  	of_node_put(tegra_alc5632_dai.cpus->of_node);
>  	tegra_alc5632_dai.cpus->of_node = NULL;
> @@ -226,12 +224,9 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
>  static int tegra_alc5632_remove(struct platform_device *pdev)
>  {
>  	struct snd_soc_card *card = platform_get_drvdata(pdev);
> -	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(card);
>  
>  	snd_soc_unregister_card(card);
>  
> -	tegra_asoc_utils_fini(&machine->util_data);
> -
>  	of_node_put(tegra_alc5632_dai.cpus->of_node);
>  	tegra_alc5632_dai.cpus->of_node = NULL;
>  	tegra_alc5632_dai.platforms->of_node = NULL;
> diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
> index 536a578e9512..38535962029c 100644
> --- a/sound/soc/tegra/tegra_asoc_utils.c
> +++ b/sound/soc/tegra/tegra_asoc_utils.c
> @@ -175,52 +175,30 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
>  		return -EINVAL;
>  	}
>  
> -	data->clk_pll_a = clk_get(dev, "pll_a");
> +	data->clk_pll_a = devm_clk_get(dev, "pll_a");
>  	if (IS_ERR(data->clk_pll_a)) {
>  		dev_err(data->dev, "Can't retrieve clk pll_a\n");
> -		ret = PTR_ERR(data->clk_pll_a);
> -		goto err;
> +		return PTR_ERR(data->clk_pll_a);
>  	}
>  
> -	data->clk_pll_a_out0 = clk_get(dev, "pll_a_out0");
> +	data->clk_pll_a_out0 = devm_clk_get(dev, "pll_a_out0");
>  	if (IS_ERR(data->clk_pll_a_out0)) {
>  		dev_err(data->dev, "Can't retrieve clk pll_a_out0\n");
> -		ret = PTR_ERR(data->clk_pll_a_out0);
> -		goto err_put_pll_a;
> +		return PTR_ERR(data->clk_pll_a_out0);
>  	}
>  
> -	data->clk_cdev1 = clk_get(dev, "mclk");
> +	data->clk_cdev1 = devm_clk_get(dev, "mclk");
>  	if (IS_ERR(data->clk_cdev1)) {
>  		dev_err(data->dev, "Can't retrieve clk cdev1\n");
> -		ret = PTR_ERR(data->clk_cdev1);
> -		goto err_put_pll_a_out0;
> +		return PTR_ERR(data->clk_cdev1);
>  	}
>  
>  	ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
> -	if (ret)
> -		goto err_put_cdev1;

Please leave returning 0 in the end, it is much more expressive variant.

	if (ret)
		return ret;

	return 0;

> -	return 0;
> -
