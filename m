From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] soc/sound: tegra_max98090: do not invert headphone
 jack
Date: Tue, 16 Feb 2016 14:41:18 -0700
Message-ID: <56C3977E.8050001@wwwdotorg.org>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
 <1454563862-1971-2-git-send-email-sctincman@gmail.com>
 <56B37E19.6010002@wwwdotorg.org> <56B3A10E.4010508@gmail.com>
 <56B8E5AD.8040707@wwwdotorg.org> <56BE9094.1040500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BE9094.1040500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/12/2016 07:10 PM, Jonathan Tinkham wrote:
> On 02/08/2016 11:59 AM, Stephen Warren wrote:
>> On 02/04/2016 12:05 PM, Jonathan Tinkham wrote:
>>> On 02/04/2016 09:36 AM, Stephen Warren wrote:
>>>> On 02/03/2016 10:30 PM, Jonathan Tinkham wrote:
>>>>> The headphone jack should not be inverted
>>>>
>>>> Have you tested this on Venice2 as well as Nyan? I'm pretty sure
>>>> Venice2 was tested when this driver was written, and whoever added
>>>> Nyan support to the kernel simply assumed it would work. As such, my
>>>> suspicion is that this series will break Venice2 even as it fixes Nyan.
>>>
>>> I have not tested this on Venice2, only on Nyan. That seems like a
>>> plausible cause and reasonable suspicion.
>>>
>>>> Why doesn't user-space expect what the kernel actually implements? The
>>>> kernel should be defining the control naming.
>>>>
>>>> Which user-space are you using specifically, and which part of it
>>>> expects particular naming?
>>>>
>>>> Perhaps this series needs to be parametrized based on a flag in DT,
>>>> rather than switching the hard-coded values, so that only Venice2 can
>>>> be affected?
>>>
>>> Specifically pulse-audio and alsa under Arch Linux.
>>>
>>> I was referencing 'Documentation/sound/alsa/soc/dapm.txt' with regards
>>> to control names. While it is possible to add another entry into the
>>> user-space configuration, I took this documentation as a definition of
>>> kernel control naming schemes, and thought the driver had used a
>>> non-standard naming scheme (or at least, not a consistent one).
>>>
>>>> On 02/03/2016 10:31 PM, Jonathan Tinkham wrote:
>>>>> Update device-tree bindings to reflect the rename of the board's
>>>>> headphone jack.
>>>>
>>>> This looks like an incompatible change to the DT. While you've fixed
>>>> the DT, which will fix new installations, old DTs now won't work. This
>>>> breaks DT ABI. Any DT change needs to be backwards compatible, i.e.
>>>> the old name should still work and be documented as a legacy value.
>>>
>>> I see that now. If the inversion behavior differs between venice2 and
>>> nyan, then another compatible string would need to be added anyways,
>>> correct? As you mentioned above, this might need to be done anyways for
>>> the rename.
>>>
>>> Something like:
>>> - "compatible = nvidia,tegra-audio-max98090" implements old inversion
>>> behavior and leaves the switch as "Headphones" to avoid breaking
>>> older DTs
>>> - "compatible = nvidia,tegra-{venice2,nyan}-audio-max98090" that
>>> separates the inversion behavior and also introduces the rename
>>
>> It'd be preferable to key this off an separate flag rather than the
>> compatible value. That would more directly represent the data in
>> question, and allow any future boards to be added without having to
>> edit the driver to know whether those new boards neded HP DET
>> inversion or not.
>>
>> However, do note that each of the 3 boards using this binding has a
>> board-specific compatible value present already:
>>
>> nvidia,tegra-audio-max98090-venice2
>> nvidia,tegra-audio-max98090-nyan-blaze
>> nvidia,tegra-audio-max98090-nyan-big
>
> Indeed, I noticed those compatible strings after I sent that message.
>
> A property seems the more ideal/desired way to go. However, to avoid
> breaking older DTs, does that mean it must be implemented as assuming
> inversion is default, and set nyan and other boards to "hd-invert = 0"?

The default (if no property is present in the DT) should indeed match 
whatever the current behaviour is in order to maintain compatibility.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
