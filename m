From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 7/8] ASoC: tegra: tegra20_das: remove always-true
 comparison
Date: Mon, 6 Jul 2020 16:16:18 +0100
Message-ID: <1a7c7025-7689-54a0-dbc0-00b5c1fcd0f1@nvidia.com>
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
 <20200702165901.164100-8-pierre-louis.bossart@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200702165901.164100-8-pierre-louis.bossart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre-Louis Bossart <pierre-louis.bossart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: tiwai-l3A5Bk7waGM@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 02/07/2020 17:59, Pierre-Louis Bossart wrote:
> Fix W=1 warning:
> 
> sound/soc//tegra/tegra20_das.c:101:11: warning:
> comparison of unsigned expression >= 0 is always true [-Wtype-limits]
>   101 |  if ((reg >= TEGRA20_DAS_DAP_CTRL_SEL) &&
>       |           ^~
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  sound/soc/tegra/tegra20_das.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
> index 1070b2710d5e..79dba878d854 100644
> --- a/sound/soc/tegra/tegra20_das.c
> +++ b/sound/soc/tegra/tegra20_das.c
> @@ -98,8 +98,7 @@ EXPORT_SYMBOL_GPL(tegra20_das_connect_dac_to_dap);
>  
>  static bool tegra20_das_wr_rd_reg(struct device *dev, unsigned int reg)
>  {
> -	if ((reg >= TEGRA20_DAS_DAP_CTRL_SEL) &&
> -	    (reg <= LAST_REG(DAP_CTRL_SEL)))
> +	if (reg <= LAST_REG(DAP_CTRL_SEL))
>  		return true;
>  	if ((reg >= TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL) &&
>  	    (reg <= LAST_REG(DAC_INPUT_DATA_CLK_SEL)))
> 

Thanks!

Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
