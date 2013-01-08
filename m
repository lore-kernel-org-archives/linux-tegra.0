From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ASoC: tegra: add ac97 host driver
Date: Tue, 08 Jan 2013 15:27:00 -0700
Message-ID: <50EC9D34.4000206@wwwdotorg.org>
References: <1357348725-32139-1-git-send-email-dev@lynxeye.de>  <1357348725-32139-2-git-send-email-dev@lynxeye.de>  <50EC9953.1000107@wwwdotorg.org> <1357683770.2884.24.camel@astat>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357683770.2884.24.camel@astat>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/08/2013 03:22 PM, Lucas Stach wrote:
> Am Dienstag, den 08.01.2013, 15:10 -0700 schrieb Stephen Warren:
>> On 01/04/2013 06:18 PM, Lucas Stach wrote:
>>> This adds the driver for the Tegra 2x AC97 host controller.

>>> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c

>>> +static inline void tegra20_ac97_start_playback(struct tegra20_ac97 *ac97)
>>> +{
>>> +	regmap_update_bits(ac97->regmap, TEGRA20_AC97_FIFO1_SCR,
>>> +			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN,
>>> +			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN);
>>> +
>>> +	regmap_update_bits(ac97->regmap, TEGRA20_AC97_CTRL,
>>> +			   TEGRA20_AC97_CTRL_PCM_DAC_EN |
>>> +			   TEGRA20_AC97_CTRL_STM_EN,
>>> +			   TEGRA20_AC97_CTRL_PCM_DAC_EN |
>>> +			   TEGRA20_AC97_CTRL_STM_EN);
>>> +}
>>
>> That sets both PCM_DAC_EN and STM_EN, but ...
>>
>>> +static inline void tegra20_ac97_stop_playback(struct tegra20_ac97 *ac97)
>>> +{
>>> +	regmap_update_bits(ac97->regmap, TEGRA20_AC97_FIFO1_SCR,
>>> +			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN, 0);
>>> +
>>> +	regmap_update_bits(ac97->regmap, TEGRA20_AC97_CTRL,
>>> +			   TEGRA20_AC97_CTRL_PCM_DAC_EN, 0);
>>> +}
>>
>> ... that only clears DAC_EN. Should it clear STM_EN too?
>>
> To be honest I have no idea what STM really is, seems to be some form of
> packed format selection. If not set playback outputs only more or less
> random noise. Only PCM_EN controls FIFO and DMA operations though, so
> it's ok to just disable this to stop playback.

I'd be tempted to just hard-code those bits on in probe() then, but it's
not a big deal, so not worth spinning the patch for that.

I guess I meant to say,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
