From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] soc/sound: tegra_max98090: do not invert headphone
 jack
Date: Fri, 12 Feb 2016 19:12:53 -0700
Message-ID: <56BE9125.3060104@gmail.com>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
 <1454563862-1971-2-git-send-email-sctincman@gmail.com>
 <56B37E19.6010002@wwwdotorg.org> <56B3A10E.4010508@gmail.com>
 <CAEUnVG7bCgzC-f_Anaw6qayGsXi=_NrWZGRy7SSALkLVLPZnUQ@mail.gmail.com>
 <56B8E4D8.8070604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B8E4D8.8070604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/08/2016 11:56 AM, Stephen Warren wrote:
> On 02/04/2016 12:17 PM, Dylan Reid wrote:
>> On Thu, Feb 4, 2016 at 11:05 AM, Jonathan Tinkham 
>> <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 02/04/2016 09:36 AM, Stephen Warren wrote:
>>>>
>>>> On 02/03/2016 10:30 PM, Jonathan Tinkham wrote:
>>>>>
>>>>> The headphone jack should not be inverted
>>>>
>>>>
>>>> Have you tested this on Venice2 as well as Nyan? I'm pretty sure 
>>>> Venice2
>>>> was tested when this driver was written, and whoever added Nyan 
>>>> support to
>>>> the kernel simply assumed it would work. As such, my suspicion is 
>>>> that this
>>>> series will break Venice2 even as it fixes Nyan.
>>>
>>>
>>> I have not tested this on Venice2, only on Nyan. That seems like a 
>>> plausible
>>> cause and reasonable suspicion.
>>>
>>>> Why doesn't user-space expect what the kernel actually implements? The
>>>> kernel should be defining the control naming.
>>>>
>>>> Which user-space are you using specifically, and which part of it 
>>>> expects
>>>> particular naming?
>>>>
>>>> Perhaps this series needs to be parametrized based on a flag in DT, 
>>>> rather
>>>> than switching the hard-coded values, so that only Venice2 can be 
>>>> affected?
>>>
>>>
>>> Specifically pulse-audio and alsa under Arch Linux.
>>>
>>> I was referencing 'Documentation/sound/alsa/soc/dapm.txt' with 
>>> regards to
>>> control names. While it is possible to add another entry into the 
>>> user-space
>>> configuration, I took this documentation as a definition of kernel 
>>> control
>>> naming schemes, and thought the driver had used a non-standard 
>>> naming scheme
>>> (or at least, not a consistent one).
>>>
>>>> On 02/03/2016 10:31 PM, Jonathan Tinkham wrote:
>>>>>
>>>>> Update device-tree bindings to reflect the rename of the board's
>>>>> headphone jack.
>>>>
>>>>
>>>> This looks like an incompatible change to the DT. While you've 
>>>> fixed the
>>>> DT, which will fix new installations, old DTs now won't work. This 
>>>> breaks DT
>>>> ABI. Any DT change needs to be backwards compatible, i.e. the old name
>>>> should still work and be documented as a legacy value.
>>>
>>>
>>> I see that now. If the inversion behavior differs between venice2 
>>> and nyan,
>>> then another compatible string would need to be added anyways, 
>>> correct? As
>>> you mentioned above, this might need to be done anyways for the rename.
>>
>> Venice2 and both nyan platforms do have different polarity of HP detect.
>>
>> For some boards we have an hd-invert property in DT.
>>
>> Would setting hp-det-gpio to active low in the pinmux achieve the 
>> same thing?
>
> I don't believe we have a pinmux setting for this.
>
> However, there's a GPIO_ACTIVE_HIGH/LOW flag that could be used in DT 
> property nvidia,hp-det-gpios's flags field to indicate the polarity. 
> That should work, but indeed you could use a separate hp-dt-invert 
> property if not.

Yeah, I could find other things that have an "invert" property, but none 
for headphone/mic detect pins.

I'm not sure setting the GPIO_ACTIVE_HIGH/LOW flag would work. Doesn't 
it depend on how the pin is physically wired?
