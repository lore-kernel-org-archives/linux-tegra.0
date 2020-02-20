From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v3 07/10] ASoC: tegra: add Tegra210 based ADMAIF driver
Date: Wed, 19 Feb 2020 22:55:21 -0800
Message-ID: <c1871939-ebf9-150e-1786-96a7f6bd6522@infradead.org>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-8-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1582180492-25297-8-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2/19/20 10:34 PM, Sameer Pujar wrote:
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index fb77df3..c0a5f0b 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -106,6 +106,18 @@ config SND_SOC_TEGRA186_DSPK
>            the desired 1-bit output via Delta Sigma Modulation (DSM).
>            Say Y or M if you want to add support for Tegra186 DSPK module.
>  
> +config SND_SOC_TEGRA210_ADMAIF
> +        tristate "Tegra210 ADMAIF module"
> +        depends on SND_SOC_TEGRA
> +        help
> +          Config to enable ADMAIF which is the interface between ADMA and
> +          Audio Hub (AHUB). Each ADMA channel that sends/receives data to/
> +          from AHUB must interface through an ADMAIF channel. ADMA channel
> +          sending data to AHUB pairs with an ADMAIF Tx channel, where as
> +          ADMA channel receiving data from AHUB pairs with an ADMAIF Rx
> +          channel. Buffer size is confiigurable for each ADMAIIF channel.

                                     configurable

> +          Say Y or M if you want to add support for Tegra210 ADMAIF module.

Please fix indentation according to coding style.

> +
>  config SND_SOC_TEGRA_RT5640
>  	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
>  	depends on SND_SOC_TEGRA && I2C && GPIOLIB


-- 
~Randy
