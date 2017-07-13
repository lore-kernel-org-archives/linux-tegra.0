From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: constify snd_soc_dai_ops structure
Date: Thu, 13 Jul 2017 15:19:06 +0100
Message-ID: <955f62ce-258c-9fa1-9b36-e7a3a8c194dc@nvidia.com>
References: <20170713054735.GA18162@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170713054735.GA18162@embeddedgus>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gustavo A. R. Silva" <garsilva-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 13/07/17 06:47, Gustavo A. R. Silva wrote:
> This structure is only stored in the ops field of a snd_soc_dai_driver
> structure. That field is declared const, so snd_soc_dai_ops structures
> that have this property can be declared as const also.
> 
> Signed-off-by: Gustavo A. R. Silva <garsilva-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index b2b279c..0b176ea 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -275,7 +275,7 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
>  	return 0;
>  }
>  
> -static struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
> +static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
>  	.set_fmt	= tegra30_i2s_set_fmt,
>  	.hw_params	= tegra30_i2s_hw_params,
>  	.trigger	= tegra30_i2s_trigger,

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
