From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] sound: ASoC: tegra: Select tegra30 i2s and ahub for
 tegra124 SoC
Date: Mon, 8 May 2017 09:58:22 -0600
Message-ID: <6c308e93-7dda-96e1-1be5-64d9f9da6dfe@wwwdotorg.org>
References: <20170418151159.31843-1-contact@paulk.fr>
 <d18b57d3-a44f-e44b-9bd5-526993dc91e4@wwwdotorg.org>
 <1492533513.3504.2.camel@paulk.fr>
 <41ef55f7-8f17-4ca3-4757-bfefb1fe8321@wwwdotorg.org>
 <1493046446.943.7.camel@paulk.fr>
 <fe76985c-ef66-9870-a616-203b54a93777@wwwdotorg.org>
 <1493059277.1111.1.camel@paulk.fr>
 <a29c4253-48de-7e61-dbc2-b90d68cfa696@wwwdotorg.org>
 <1494180748.13734.6.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494180748.13734.6.camel-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/07/2017 12:12 PM, Paul Kocialkowski wrote:
> Hi,
>
> Le mardi 25 avril 2017 à 10:57 -0600, Stephen Warren a écrit :
>> On 04/24/2017 12:41 PM, Paul Kocialkowski wrote:
>>> Le lundi 24 avril 2017 à 09:35 -0600, Stephen Warren a écrit :
>>>> On 04/24/2017 09:07 AM, Paul Kocialkowski wrote:
>>>>> Le mercredi 19 avril 2017 à 16:00 -0600, Stephen Warren a écrit :
>>>>>> On 04/18/2017 10:38 AM, Paul Kocialkowski wrote:
>>>>>>> Le mardi 18 avril 2017 à 10:15 -0600, Stephen Warren a écrit :
>>>>>>>> On 04/18/2017 09:11 AM, Paul Kocialkowski wrote:
>>>>>>>>> This selects the tegra30 i2s and ahub controllers for the
>>>>>>>>> tegra124
>>>>>>>>> SoC.
>>>>>>>>> These are needed when building without ARCH_TEGRA_3x_SOC set.
>>>>>>>>> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
>>>>>>>>> index efbe8d4c019e..bcd18d2cf7a7 100644
>>>>>>>>> --- a/sound/soc/tegra/Kconfig
>>>>>>>>> +++ b/sound/soc/tegra/Kconfig
>>>>>>>>> @@ -46,7 +46,7 @@ config SND_SOC_TEGRA20_SPDIF
>>>>>>>>>
>>>>>>>>>  config SND_SOC_TEGRA30_AHUB
>>>>>>>>>  	tristate
>>>>>>>>> -	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
>>>>>>>>> +	depends on SND_SOC_TEGRA && (ARCH_TEGRA_3x_SOC ||
>>>>>>>>> ARCH_TEGRA_124_SOC)
>>>>>>>>
>>>>>>>> Is this really a compile-time dependency?
>>>>>>>
>>>>>>> From a quick look at the code, I doubt this is really a build
>>>>>>> dependency.
>>>>>>>
>>>>>>>> If so, don't we need to add T210 and T186 entries into that ||
>>>>>>>> condition
>>>>>>>> too,
>>>>>>>> since we could be building a kernel with just T210/T186 support
>>>>>>>> and no
>>>>>>>> T124
>>>>>>>> support?
>>>>>>>
>>>>>>> In the spirit of this patch, adding entries for other tegra
>>>>>>> platforms
>>>>>>> would
>>>>>>> make
>>>>>>> sense. Would you prefer that we leave out the dependency from
>>>>>>> SND_SOC_TEGRA30_*
>>>>>>> and only select the right I2S driver to use in each codec driver?
>>>>>>>
>>>>>>> If not, we'd have to list all relevant platforms both in the
>>>>>>> I2S/AHUB
>>>>>>> drivers
>>>>>>> and in each codec's rules (which is not necessarily and issue, but
>>>>>>> there's
>>>>>>> no
>>>>>>> need to have artificial platform dependencies).
>>>>>>>
>>>>>>> What do you think?
>>>>>>
>>>>>> I think we should just remove most of these "depends on" since they're
>>>>>> mostly set up to reflect runtime requirements rather than build time
>>>>>> requirements. The only points I'd make are:
>>>>>
>>>>> I definitely agree we should do that for all the codec Kconfig options.
>>>>>
>>>>>> 1)
>>>>>>
>>>>>> Everything should "depends on SND_SOC_TEGRA" simply so the options
>>>>>> don't
>>>>>> show up and clutter menuconfig menus unless SND_SOC_TEGRA is enabled.
>>>>>
>>>>> Agreed.
>>>>>
>>>>>> 2)
>>>>>>
>>>>>> SND_SOC_TEGRA30_I2S does need the Tegra30 AHUB driver in order to
>>>>>> compile/link, since it directly calls functions in that driver. This
>>>>>> is
>>>>>> already handled by SND_SOC_TEGRA30_I2S doing "select
>>>>>> SND_SOC_TEGRA30_AHUB".
>>>>>
>>>>> Agreed.
>>>>>
>>>>>> 3)
>>>>>>
>>>>>> The machine drivers all do e.g. "select SND_SOC_TEGRA30_I2S if
>>>>>> ARCH_TEGRA_3x_SOC". This was an attempt to make the machine drivers
>>>>>> only
>>>>>> pull in the relevant drivers for the SoC(s) being compiled for. I'm
>>>>>> not
>>>>>> sure this still makes sense; this won't work on kernels that only
>>>>>> support T124/T210/T186 since ARCH_TEGRA_3x_SOC isn't enabled then.
>>>>>> Should we just remove all those and make sure the defconfigs are
>>>>>> updated
>>>>>> to make sure the relevant I2S/AHUB/SPDIF/AC97 drivers are explicitly
>>>>>> enabled? Perhaps we should default all the I2S/AHUB/SPDIF/AC97 to y
>>>>>> (which will only apply if SND_SOC_TEGRA is enabled)?
>>>>>
>>>>> I think it would be easier for everyone to just auto-select the machine
>>>>> drivers
>>>>> automatically based on the architecture (so we could have the list of
>>>>> ARCH_TEGRA_*_SOC here) when SND_SOC_TEGRA is selected.
>>>>
>>>> I don't think selecting the machine drivers is the correct approach,
>>>> since then they can't be disabled.
>>>>
>>>> Making certain machine drivers "default y if ARCH_TEGRA_nn_SOC" would
>>>> address that,
>>>
>>> That's right, my mistake. Let's take that as the solution I'm backing then.
>>>
>>>>  but still isn't very scalable since we need to go back and
>>>> edit the Kconfig every time we define a new SoC, in order to add that
>>>> SoC into the default statement.
>>>
>>> Well, that's what platform bringup is all about, isn't it? I think it makes
>>> a
>>> lot more sense to have to add a new platform once (and it's not like one
>>> will
>>> forget to look at the sound part when adding a new platform) rather than
>>> requiring users to hand-pick the option.
>>
>> Personally I'd expect all the Tegra machine drivers to be enabled in the
>> upstream defconfig files all the time, such that we don't need to make
>> the Kconfig options default y, nor have users manually turn the relevant
>> options on, at all.
>
> I think I was previously mistaken about what the machine drivers are, so I got a
> good occasion to find out about them an learn something new. Thanks!
>
> Agreed regarding the machine drivers, they should indeed all be enabled in the
> defconfig by default.
>
>>>>> Not only does this preserve existing configs (including external ones
>>>>> that
>>>>> aren't part of the kernel tree), it also clearly maps which machine
>>>>> driver
>>>>> to use for which SoC instead of having users do it by hand.
>>>>
>>>> The machine drivers aren't terribly tied to SoCs by design; most of them
>>>> would work on pretty much any SoC. They're only tied to SoCs as a
>>>> side-effect of a machine driver being tied to a certain CODEC, and
>>>> certain CODECS just by chance are only used (so far) on specific boards,
>>>> which have specific SoCs.
>>>
>>> I'm a bit confused: aren't the machine driver (i2s/ahub/spdif/ac97) tied to
>>> specific hardware blocks that are found in specific SoCs and not in others?
>>> I
>>> can see these blocks haven't evolved much across generations, but they're
>>> still
>>> either part of a specific SoC or not, aren't they?
>>>
>>> The compatible strings in the common SoC dts seem to indicate that only one
>>> of
>>> these blocks is found at a time.
>>
>> There are SoC-specific drivers for the components (Tegra20 I2S, Tegra30
>> I2S, etc.), but the *machine* drivers generally don't know anything
>> about that. DT instantiates the correct component drivers for the SoC,
>> and the machine driver just uses whatever it's linked to without caring
>> too-much/at-all about whether it's hooked to a Tegra20 I2S or a Tegra30
>> I2S device.
>
> That makes sense now. Regarding the SoC-specific components, would you agree
> with auto-selecting those based on ARCH_TEGRA_xx_SOC so that only the required
> drivers are pulled-in? Otherwise, I'm also fine with explicitely enabling them
> in the defconfig at this point.

I believe we don't generally "select" Kconfig options that aren't 
absolutely required for basic system operation, since we don't want to 
select stuff that's optional. Enabling the options in defconfig seems 
like the right approach, or perhaps "default y" (in which case anyone 
who doesn't want them can simply turn them off).
