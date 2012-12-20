From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/7] ASoC: tegra: add ac97 host driver
Date: Thu, 20 Dec 2012 12:44:24 -0700
Message-ID: <50D36A98.7090204@wwwdotorg.org>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de> <1355959056-6009-5-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355959056-6009-5-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/19/2012 04:17 PM, Lucas Stach wrote:
> This adds the driver for the Tegra 2x AC97 host controller.

The AC'97 DT binding file should really be added as part of this patch.

I'm not at all familiar with AC'97, but this mostly looks fine. I have a
bunch of comments below though, mostly for my own understanding.

> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig

> +config SND_SOC_TEGRA20_AC97
> +	tristate
> +	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC

This should also select SND_SOC_TEGRA20_DAS, just like the I2S driver.

> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c

> +static struct tegra20_ac97 *workdata;

Why not put that into the device's drvdata? Oh, is there no way to stash
driver-private data into the struct snd_ac97?

> +static void tegra20_ac97_codec_reset(struct snd_ac97 *ac97)
> +{
> +	u32 readback;
> +	unsigned long timeout;
> +
> +	/* reset line is not driven by DAC pad group, have to toggle GPIO */
> +	gpio_set_value(workdata->reset_gpio, 0);
> +	udelay(2);

I'm not quite sure what that implies. Might some (Tegra) HW designs use
a dedicated signal from the AC'97 HW to reset the CODEC and others not?
That would make the GPIO optional. Or, does the comment mean that Tegra
doesn't ever have a dedicated CODEC reset signal, so we always have to
use a GPIO? If so, this comment might be more appropriate inside probe()
where I asked my related questions.

> +static void tegra20_ac97_codec_warm_reset(struct snd_ac97 *ac97)
> +{
> +	u32 readback;
> +	unsigned long timeout;
> +
> +	/*
> +	 * although sync line is driven by the DAC pad group warm reset using
> +	 * the controller cmd is not working, have to toggle sync line
> +	 * manually.
> +	 */
> +	gpio_request(workdata->sync_gpio, "codec-sync");

Hmm. There's an AC'97 command to reset the CODEC and we don't implement
it? Uggh.

> +static const struct snd_soc_dai_ops tegra20_ac97_dai_ops = {
> +	.trigger	= tegra20_ac97_trigger,
> +};

No .set_fmt or .hw_params? Does the AC'97 ASoC core code handle that
somehow? I guess that's what soc_ac97_ops is for?

> +static struct snd_soc_dai_driver tegra20_ac97_dai = {
> +	.name = "tegra-ac97-pcm",
> +	.ac97_control = 1,
> +	.probe = tegra20_ac97_probe,
> +	.playback = {
> +		.stream_name = "PCM Playback",

Out of curiosity, why "PCM Playback" not just "Playback"?

> +static bool tegra20_ac97_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case TEGRA20_AC97_CMD:
...
> +		return true;

CMD is volatile; did we put status bits in there?

> +static int tegra20_ac97_platform_probe(struct platform_device *pdev)

> +	ac97->reset_gpio = of_get_named_gpio(pdev->dev.of_node,
> +					     "nvidia,codec-reset-gpio", 0);
> +	if (gpio_is_valid(ac97->reset_gpio)) {
> +		ret = devm_gpio_request_one(&pdev->dev, ac97->reset_gpio,
> +					    GPIOF_OUT_INIT_HIGH, "codec-reset");

Shouldn't this get the flags from the GPIO specifier, and deal with
active-high/active-low resets, or is the polarity set by the AC'97 spec?

> +		if (ret) {
> +			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
> +			goto err_clk_put;
> +		}
> +	} else {
> +		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
> +		goto err_clk_put;
> +	}

Is a reset GPIO necessarily required? What if a board arranged to reset
the CODEC during power-on-reset, and there was no software control over
the reset?

> +	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
> +					    "nvidia,codec-sync-gpio", 0);
> +	if (!gpio_is_valid(ac97->sync_gpio)) {
> +		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
> +		goto err_clk_put;
> +	}

I don't know what this is, so I'll ask if it's strictly required too.

> +	ret = snd_soc_register_dais(&pdev->dev, &tegra20_ac97_dai, 1);

snd_soc_register_dai() would be marginally simpler.

> +	ret = clk_prepare_enable(ac97->clk_ac97);
> +	if (ret) {
> +		dev_err(&pdev->dev, "clk_enable failed: %d\n", ret);
> +		goto err_asoc_utils_fini;
> +	}

Can you do runtime PM instead? See the I2S driver for an example.

> +MODULE_LICENSE("GPL");

"GPL v2"
