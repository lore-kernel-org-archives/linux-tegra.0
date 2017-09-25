From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sound: tegra20-spdif: remove "default m"
Date: Mon, 25 Sep 2017 23:37:03 +0300
Message-ID: <7d0c10d2-f6a9-eec1-131c-eb60a0f428b4@gmail.com>
References: <c765842d4cc6af91ae0d6977922e6ae6f6e1dfa8.1505661134.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c765842d4cc6af91ae0d6977922e6ae6f6e1dfa8.1505661134.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 17.09.2017 18:15, Michał Mirosław wrote:
> Default != n for drivers is frowned upon. This is the only one among
> tegra sound drivers that was different.
> 
> Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> ---
>  sound/soc/tegra/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index 6875fc39a575..6c893c677110 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -38,7 +38,6 @@ config SND_SOC_TEGRA20_I2S
>  config SND_SOC_TEGRA20_SPDIF
>  	tristate "Tegra20 SPDIF interface"
>  	depends on SND_SOC_TEGRA
> -	default m
>  	help
>  	  Say Y or M if you want to add support for the Tegra20 SPDIF interface.
>  	  You will also need to select the individual machine drivers to support
> 

IIUC this driver should be integrated with the Tegra DRM to be useful. Making it
built-in by default would just increase kernels size.

-- 
Dmitry
