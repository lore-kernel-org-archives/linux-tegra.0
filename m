From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 14/17] ASoC: tegra: add tegra30-ahub driver
Date: Mon, 02 Apr 2012 11:27:52 -0600
Message-ID: <4F79E198.1080606@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org> <1333148852-17806-15-git-send-email-swarren@wwwdotorg.org> <20120331201433.GL5012@opensource.wolfsonmicro.com> <4F77B7CA.3020803@wwwdotorg.org> <20120401103117.GD3153@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120401103117.GD3153-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/01/2012 04:31 AM, Mark Brown wrote:
> On Sat, Mar 31, 2012 at 08:04:58PM -0600, Stephen Warren wrote:
>> On 03/31/2012 02:14 PM, Mark Brown wrote:
> 
>>> This looks like a fairly clear sign that this should be a CODEC driver,
> 
>> My aim here was to get something basic in place before I looked into all
>> the "SoC DSP" and separate FE/BE stuuf, and how to express the AHUB and
>> DAS as codecs.
> 
> The DAS might be more suited to the soc-pcm model given that there's
> more of a tight coupling between what goes in and what comes out (from
> what I remember).
> 
>>> or possibly the DMA driver - if nothing else even if you didn't change
>>> anything else about the implementation it'd ensure that you didn't need
>>> to open code this probe checking.
> 
>> Maybe just because I haven't looked into this at all, but I'm not sure
>> how this would solve the probing issue; I can see that the machine
>> driver wouldn't (ASoC rather than pdev) probe until the AHUB driver had
>> (pdev) probed, but how would that affect the dependent device probes? I
>> suppose it'd work out if the dependent devices didn't touch HW until
>> their ASoC probes?
> 
> Yes, exactly - allocate the resources in the platform driver probes,
> register with ASoC and then only touch the hardware when ASoC tells you
> the whole card is ready.

Thinking about this more, I guess the AHUB driver should be a bus
driver; in HW, it implements a register bus and the I2S, SPDIF, and DAM
devices' registers are accessed through that bus. That would solve the
probing order issues in a way that's much more directly modeled on the
hardware. Relying on the separate pdev and ASoC probes for the child
devices seems a little bit like relying on an implementation detail.

Does this sound like a good idea to you?

I imagine doing this through device-tree upstream is fairly easy (just
like I2C for example), but haven't looked in detail yet.

The thing that makes me shy away from this is when our downstream
kernels want to pick up v3.5, and perhaps don't want to use DT
exclusively yet, how would they do the same bus/child thing with
platform devices in board files? Perhaps they don't need to, and can
just register the AHUB pdev first, and child devices later, and ignore
the bus' existence.

Now, whether to represent the AHUB as a codec or not, and whether the
machine driver's DT binding needs an AHUB node is an orthogonal issue, I
think.
