From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/7] i2c: tegra: DMA support for t186 and t194
Date: Thu, 23 Jul 2020 16:38:28 +0300
Message-ID: <18e4e5df-3d8f-3e52-b9b2-ff0558d6196c@gmail.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-6-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595506733-10307-6-git-send-email-kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.07.2020 15:18, Krishna Yarlagadda пишет:
> Enable GPC DMA support for Tegra186 and Tegra194
> 
> Signed-off-by: Rajesh Gumasta <rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 8ab968e..77198fc 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -236,6 +236,7 @@ struct tegra_i2c_hw_feature {
>  	u32 setup_hold_time_hs_mode;
>  	bool has_interface_timing_reg;
>  	bool has_slcg_support;
> +	bool has_gpc_dma;
>  };
>  
>  /**
> @@ -432,11 +433,18 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  	dma_addr_t dma_phys;
>  	int err;
>  
> -	if (!i2c_dev->hw->has_apb_dma)
> -		return 0;
> -
> -	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
> -		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
> +	if (i2c_dev->hw->has_gpc_dma) {
> +		if (!IS_ENABLED(CONFIG_TEGRA_GPC_DMA)) {

Single line, please.

> +			dev_dbg(i2c_dev->dev, "Support for GPC DMA not enabled!\n");
> +			return 0;
> +		}
> +	} else if (i2c_dev->hw->has_apb_dma) {
> +		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {

Here too.

> +			dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
> +			return 0;
> +		}
> +	} else {
> +		dev_dbg(i2c_dev->dev, "DMA is not enabled!\n");

Also, please drop all the exclamation marks.
