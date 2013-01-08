From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ASoC: tegra: add ac97 host driver
Date: Tue, 08 Jan 2013 23:22:50 +0100
Message-ID: <1357683770.2884.24.camel@astat>
References: <1357348725-32139-1-git-send-email-dev@lynxeye.de>
	 <1357348725-32139-2-git-send-email-dev@lynxeye.de>
	 <50EC9953.1000107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50EC9953.1000107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 08.01.2013, 15:10 -0700 schrieb Stephen Warren:
> On 01/04/2013 06:18 PM, Lucas Stach wrote:
> > This adds the driver for the Tegra 2x AC97 host controller.
> > 
> > Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> 
> > diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
> 
> > +- nvidia,codec-sync-gpio : The Tegra GPIO controller's phandle and the number
> > +  of the GPIO corresponding with the AC97 DAP _FS line
> > +Example:
> 
> If you have to repost for any reason, you probably want a blank line
> before the "Example:" line.
> 
> > diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
> 
> > +static void tegra20_ac97_codec_warm_reset(struct snd_ac97 *ac97)
> > +{
> > +	u32 readback;
> > +	unsigned long timeout;
> > +
> > +	/*
> > +	 * although sync line is driven by the DAC pad group warm reset using
> > +	 * the controller cmd is not working, have to toggle sync line
> > +	 * manually.
> > +	 */
> > +	gpio_request(workdata->sync_gpio, "codec-sync");
> > +
> > +	gpio_direction_output(workdata->sync_gpio, 1);
> 
> Would it make sense to just request the GPIO during probe()? Or, is the
> sync signal used as part of the AC'97 protocol at other times?

Yes, the sync line is used during normal codec operation, that's why
it's explicitly requested and freed in the warm reset function. As
discussed earlier this is ugly, but unavoidable as the Tegra 2 AC97
controller misbehaves when ordered to do the warm reset. So this is just
a software hack to take over the line as a GPIO and do what the hardware
is supposed to do in this situation.
> 
> > +static inline void tegra20_ac97_start_playback(struct tegra20_ac97 *ac97)
> > +{
> > +	regmap_update_bits(ac97->regmap, TEGRA20_AC97_FIFO1_SCR,
> > +			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN,
> > +			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN);
> > +
> > +	regmap_update_bits(ac97->regmap, TEGRA20_AC97_CTRL,
> > +			   TEGRA20_AC97_CTRL_PCM_DAC_EN |
> > +			   TEGRA20_AC97_CTRL_STM_EN,
> > +			   TEGRA20_AC97_CTRL_PCM_DAC_EN |
> > +			   TEGRA20_AC97_CTRL_STM_EN);
> > +}
> 
> That sets both PCM_DAC_EN and STM_EN, but ...
> 
> > +static inline void tegra20_ac97_stop_playback(struct tegra20_ac97 *ac97)
> > +{
> > +	regmap_update_bits(ac97->regmap, TEGRA20_AC97_FIFO1_SCR,
> > +			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN, 0);
> > +
> > +	regmap_update_bits(ac97->regmap, TEGRA20_AC97_CTRL,
> > +			   TEGRA20_AC97_CTRL_PCM_DAC_EN, 0);
> > +}
> 
> ... that only clears DAC_EN. Should it clear STM_EN too?
> 
To be honest I have no idea what STM really is, seems to be some form of
packed format selection. If not set playback outputs only more or less
random noise. Only PCM_EN controls FIFO and DMA operations though, so
it's ok to just disable this to stop playback.

Regards,
Lucas
