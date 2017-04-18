From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] sound: ASoC: tegra: Select tegra30 i2s and ahub for
 tegra124 SoC
Date: Tue, 18 Apr 2017 10:15:45 -0600
Message-ID: <d18b57d3-a44f-e44b-9bd5-526993dc91e4@wwwdotorg.org>
References: <20170418151159.31843-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170418151159.31843-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/18/2017 09:11 AM, Paul Kocialkowski wrote:
> This selects the tegra30 i2s and ahub controllers for the tegra124 SoC.
> These are needed when building without ARCH_TEGRA_3x_SOC set.

> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index efbe8d4c019e..bcd18d2cf7a7 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -46,7 +46,7 @@ config SND_SOC_TEGRA20_SPDIF
>
>  config SND_SOC_TEGRA30_AHUB
>  	tristate
> -	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
> +	depends on SND_SOC_TEGRA && (ARCH_TEGRA_3x_SOC || ARCH_TEGRA_124_SOC)

Is this really a compile-time dependency? If so, don't we need to add 
T210 and T186 entries into that || condition too, since we could be 
building a kernel with just T210/T186 support and no T124 support?
