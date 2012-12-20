From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 7/7] ASoC: tegra: add machine driver using wm9712 codec
Date: Thu, 20 Dec 2012 12:55:39 -0700
Message-ID: <50D36D3B.7080309@wwwdotorg.org>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de> <1355959056-6009-7-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355959056-6009-7-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/19/2012 04:17 PM, Lucas Stach wrote:
> This adds a simple machine driver using the Wolfson wm9712 AC97
> codec.

If the AC'97 code is going to be reworked to probe the CODEC rather than
manually specify it in DT, then will this machine driver become generic
for any AC'97 system, and hence you could rename the DT binding to
nvidia,tegra-audio-ac97?

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt

> +- nvidia,audio-codec : The phandle of the WM9712 audio codec

I wonder how you'll get that if you dynamically probe the AC'97 bus...

> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig

> +config SND_SOC_TEGRA_WM9712
> +	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
> +	depends on SND_SOC_TEGRA

I'd suggest making this depend on the Tegra AC97 module, or
ARCH_TEGRA_2x_SOC instead, since it can only run on Tegra20. The AC'97
module has been removed on Tegra30 and replaced with an HD Audio
controller instead.

> +	select SND_SOC_TEGRA20_AC97 if ARCH_TEGRA_2x_SOC

That select (or a dependency as mentioned above) is always required.

> +	select SND_SOC_AC97_BUS

Shouldn'y the AC'97 driver select that?

> diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c

> +static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)

> +	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");

Hmm. I guess that potentially ties this driver to whichever CODECs
actually expose a widget with that exact name...

> +static int tegra_wm9712_remove(struct snd_soc_card *card)
> +{
> +	return 0;
> +}

Do you need to implement this at all if it does nothing?

> +MODULE_LICENSE("GPL");

"GPL v2"
