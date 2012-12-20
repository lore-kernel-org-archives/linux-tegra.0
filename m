From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/7] ASoC: tegra: add ac97 host driver
Date: Thu, 20 Dec 2012 13:19:43 -0700
Message-ID: <50D372DF.2080600@wwwdotorg.org>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de>  <1355959056-6009-5-git-send-email-dev@lynxeye.de>  <50D36A98.7090204@wwwdotorg.org> <1356034241.1490.98.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356034241.1490.98.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/20/2012 01:10 PM, Lucas Stach wrote:
> Am Donnerstag, den 20.12.2012, 12:44 -0700 schrieb Stephen Warren:
>> On 12/19/2012 04:17 PM, Lucas Stach wrote:
>>> This adds the driver for the Tegra 2x AC97 host controller.

>>> +static void tegra20_ac97_codec_warm_reset(struct snd_ac97 *ac97)
>>> +{
>>> +	u32 readback;
>>> +	unsigned long timeout;
>>> +
>>> +	/*
>>> +	 * although sync line is driven by the DAC pad group warm reset using
>>> +	 * the controller cmd is not working, have to toggle sync line
>>> +	 * manually.
>>> +	 */
>>> +	gpio_request(workdata->sync_gpio, "codec-sync");
>>
>> Hmm. There's an AC'97 command to reset the CODEC and we don't implement
>> it? Uggh.
>
> As far as I could figure from the downstream register doc there is a
> command implemented in the host controller that's supposed to do the
> warm reset, but in my testing it didn't work. Sadly I have not received
> any documentation about the host controller from NVIDIA up until now, so
> I don't now if we could make this work somehow. Bug Submission ID#:
> 196075

What system was that bug submitted into? It's not a regular NVIDIA
internal bug number. I'll see who I can ask about this feature...

>>> +	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
>>> +					    "nvidia,codec-sync-gpio", 0);
>>> +	if (!gpio_is_valid(ac97->sync_gpio)) {
>>> +		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
>>> +		goto err_clk_put;
>>> +	}
>>
>> I don't know what this is, so I'll ask if it's strictly required too.
>
> Until we manage to get the host controller warm reset command working
> this is fixed to be the _FS line of the DAP connected to the codec, so
> strictly required.

I'd like to investigate whether the warm reset command can be made to
work before actually committing to a DT binding that requires this GPIO
to be specified; the DT binding is supposed to be basically static.
