From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: TrimSlice machine support
Date: Mon, 18 Apr 2011 15:44:27 +0100
Message-ID: <20110418144427.GD1765@opensource.wolfsonmicro.com>
References: <1303043988-21933-1-git-send-email-mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303043988-21933-1-git-send-email-mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Apr 17, 2011 at 03:39:48PM +0300, Mike Rapoport wrote:

> +	if (mclk_change) {
> +		err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
> +					     SND_SOC_CLOCK_IN);
> +		if (err < 0) {
> +			dev_err(card->dev, "codec_dai clock not set\n");
> +			return err;
> +		}
> +	}

Fix the CODEC driver to cope gracefully with noop changes if this is a
problem, no sense in all callers replicating this code.

> +static int trimslice_asoc_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct snd_soc_dapm_context *dapm = &codec->dapm;
> +
> +	snd_soc_dapm_new_controls(dapm, trimslice_dapm_widgets,
> +					ARRAY_SIZE(trimslice_dapm_widgets));
> +
> +	snd_soc_dapm_add_routes(dapm, trimslice_audio_map,
> +				ARRAY_SIZE(trimslice_audio_map));
> +
> +	snd_soc_dapm_sync(dapm);

Please switch to using the data based specification of widgets and
routes in -next.  This should completely remove the need for this code.

> +static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = &snd_soc_trimslice;
> +	struct tegra_trimslice *trimslice;
> +	int ret;
> +
> +	if (!machine_is_trimslice()) {
> +		dev_err(&pdev->dev, "Not running on Trimslice!\n");
> +		return -ENODEV;
> +	}

This isn't needed since you're registering based on a platform device -
whatever registers the platform device should check this.

> +err_clear_drvdata:
> +	snd_soc_card_set_drvdata(card, NULL);
> +	platform_set_drvdata(pdev, NULL);
> +	card->dev = NULL;

No need for any of these, anything relying on them outside of the device
being registered is buggy anyway.

> +	snd_soc_card_set_drvdata(card, NULL);
> +	platform_set_drvdata(pdev, NULL);
> +	card->dev = NULL;

Similarly here.
