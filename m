From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 14/17] ASoC: tegra: add tegra30-ahub driver
Date: Sat, 31 Mar 2012 20:04:58 -0600
Message-ID: <4F77B7CA.3020803@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org> <1333148852-17806-15-git-send-email-swarren@wwwdotorg.org> <20120331201433.GL5012@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120331201433.GL5012-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/31/2012 02:14 PM, Mark Brown wrote:
> On Fri, Mar 30, 2012 at 05:07:29PM -0600, Stephen Warren wrote:
> 
>> +int tegra30_ahub_is_probed(void)
>> +{
>> +	return probed;
>> +}
>> +EXPORT_SYMBOL(tegra30_ahub_is_probed);
> 
> This looks like a fairly clear sign that this should be a CODEC driver,

Certainly it should be a CODEC in the long-term, and most likely the
Tegra20 DAS driver too.

My aim here was to get something basic in place before I looked into all
the "SoC DSP" and separate FE/BE stuuf, and how to express the AHUB and
DAS as codecs.

> or possibly the DMA driver - if nothing else even if you didn't change
> anything else about the implementation it'd ensure that you didn't need
> to open code this probe checking.

Maybe just because I haven't looked into this at all, but I'm not sure
how this would solve the probing issue; I can see that the machine
driver wouldn't (ASoC rather than pdev) probe until the AHUB driver had
(pdev) probed, but how would that affect the dependent device probes? I
suppose it'd work out if the dependent devices didn't touch HW until
their ASoC probes?

> All your EXPORT_SYMBOLs should really be EXPORT_SYMBOL_GPL as you're
> using the ASoC APIs.

Yes, just a think-o (like a typo)

>> +/*
>> + * clk_apbif isn't required for a theoretical I2S<->I2S configuration where
>> + * no PCM data is read from or sent to memory. However, that's an unlikely
>> + * use-case, and not something the rest of the driver supports right now, so
>> + * we'll just treat the two clocks as one for now.
> 
> I rather suspect you'll find your system architects view that as a
> resonable use case for things like voice calls where the audio for the
> call would go from the baseband to the CODEC or bluetooth without going
> into main memory.  Of course many CODECs can take this path directly
> allowing the CPU to be powered off so...

Yes, the roots of this patch were actually written long ago before I was
really aware of that use-case. I should probably update the comment.
