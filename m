From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 11/22] ASoC: tegra: Add fallback implementation for
 audio mclk
Date: Fri, 24 Jan 2020 02:56:45 +0300
Message-ID: <aef36b46-789a-c44e-4cd1-9d4183435ba9@gmail.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-12-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1578986667-16041-12-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.01.2020 10:24, Sowjanya Komatineni пишет:
> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
> are moved to Tegra PMC driver with pmc as clock provider and using pmc
> clock ids.
> 
> New device tree uses clk_out_1 from pmc clock provider as audio mclk.
> 
> So, this patch adds implementation for mclk fallback to extern1 when
> retrieving mclk returns -ENOENT to be backward compatible of new device
> tree with older kernels.
> 
> Fixes: 110147c8c513 ("ASoC: tegra: always use clk_get() in utility code")
> 
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  sound/soc/tegra/tegra_asoc_utils.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
> index 536a578e9512..74d3ffe7e603 100644
> --- a/sound/soc/tegra/tegra_asoc_utils.c
> +++ b/sound/soc/tegra/tegra_asoc_utils.c
> @@ -191,9 +191,21 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
>  
>  	data->clk_cdev1 = clk_get(dev, "mclk");
>  	if (IS_ERR(data->clk_cdev1)) {
> -		dev_err(data->dev, "Can't retrieve clk cdev1\n");
> -		ret = PTR_ERR(data->clk_cdev1);
> -		goto err_put_pll_a_out0;
> +		if (PTR_ERR(data->clk_cdev1) != -ENOENT) {
> +			dev_err(data->dev, "Can't retrieve clk cdev1\n");
> +			ret = PTR_ERR(data->clk_cdev1);
> +			goto err_put_pll_a_out0;
> +		}
> +
> +		/* Fall back to extern1 */
> +		data->clk_cdev1 = clk_get(dev, "extern1");
> +		if (IS_ERR(data->clk_cdev1)) {
> +			dev_err(data->dev, "Can't retrieve clk extern1\n");
> +			ret = PTR_ERR(data->clk_cdev1);
> +			goto err_put_pll_a_out0;
> +		}
> +
> +		dev_info(data->dev, "Falling back to extern1\n");
>  	}
>  
>  	ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
> 

I tried to double-check if audio works using the updated DT works with
this fallback and unfortunately it is not (maybe I actually missed to
test this case before).. the driver doesn't probe at all because of the
assigned-clocks presence, which makes clk core to fail finding the MCLK
and thus assigned-clocks configuration fails, preventing the driver's
loading.

I'm not sure what could be done about it. Perhaps just to give up on the
compatibility of older kernels with the new DTs, missing audio isn't
really that critical (perhaps).
