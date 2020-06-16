From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: Fix reference count leaks.
Date: Tue, 16 Jun 2020 20:42:50 +0100
Message-ID: <9492fa91-067b-f74f-1a52-a2622d8f28d6@nvidia.com>
References: <20200613204422.24484-1-wu000273@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200613204422.24484-1-wu000273-OJFnDUYgAso@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wu000273-OJFnDUYgAso@public.gmane.org, kjlu-OJFnDUYgAso@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 13/06/2020 21:44, wu000273-OJFnDUYgAso@public.gmane.org wrote:
> From: Qiushi Wu <wu000273-OJFnDUYgAso@public.gmane.org>
> 
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count if pm_runtime_put is not called in
> error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.
> 
> Signed-off-by: Qiushi Wu <wu000273-OJFnDUYgAso@public.gmane.org>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 4 +++-
>  sound/soc/tegra/tegra30_i2s.c  | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 635eacbd28d4..156e3b9d613c 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -643,8 +643,10 @@ static int tegra30_ahub_resume(struct device *dev)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put(dev);
>  		return ret;
> +	}
>  	ret = regcache_sync(ahub->regmap_ahub);
>  	ret |= regcache_sync(ahub->regmap_apbif);
>  	pm_runtime_put(dev);
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index d59882ec48f1..db5a8587bfa4 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -567,8 +567,10 @@ static int tegra30_i2s_resume(struct device *dev)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put(dev);
>  		return ret;
> +	}
>  	ret = regcache_sync(i2s->regmap);
>  	pm_runtime_put(dev);

Thanks.

Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
