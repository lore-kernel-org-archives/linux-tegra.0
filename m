From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1 3/3] ASoC: soc-core: fix platform name vs.
 of_node assignement
Date: Thu, 3 Jan 2019 16:42:34 +0000
Message-ID: <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
 <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
 <20181021112301.GC8554@sirena.org.uk>
 <20181218174040.k7u26vnnoplllnwb@camel2.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218174040.k7u26vnnoplllnwb@camel2.lan>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: linux-tegra@vger.kernel.org

Hi Mark, Kuninori

On 18/12/2018 17:40, Matthias Reichl wrote:
> Hi Mark,
> 
> On Sun, Oct 21, 2018 at 12:23:01PM +0100, Mark Brown wrote:
>> On Fri, Oct 19, 2018 at 11:22:46AM +0100, Jon Hunter wrote:
>>
>>> Looking at snd_soc_init_platform(), it seems that the platform pointer
>>> can be allocated by the machine driver and so if it is not allocated by
>>> the core, then I don't think we should clear it here. Seems we need a
>>> way to determine if this was allocated by the core.
>>
>> Indeed, this is a bit of a mess.  We probably shouldn't be modifying the
>> data that the drivers passed in, otherwise we get into trouble like
>> this.   That suggests that we should copy the data, probably all of it.
>> I will try to have a proper look at this next week.
> 
> did you find the time to look into this?
> 
> The downstream Raspberry Pi kernel contains a bunch of machine drivers
> that are implemented in a similar way as the tegra_sgtl5000 driver
> (static card and dai link structs, dai_link->platform_of_node filled
> in from device tree) which are breaking in 4.20 on deferred probing.
> 
> Switching these drivers to dynamically allocated dai link structs,
> like 76836fd35492 "ASoC: omap-abe-twl6040: Fix missing audio card
> caused by deferred probing" would be a possibility, but if there's
> some solution on the horizon that doesn't require changes to the
> driver code it'd be easier to wait for that.
> 
> so long,
> 
> Hias
> 
>>> Furthermore, it seems that it is possible that there is more than one
>>> link that might be to be cleared.
>>
>> Yes, that's an issue as well.

I have been looking at this again recently. I see this issue occurring
all the time when the sound drivers are built as kernel modules and
probing the sound card is deferred until the codec driver has been loaded.

Commit daecf46ee0e5 ("ASoC: soc-core: use snd_soc_dai_link_component for
platform") appears to introduce the problem because now we allocate the
'snd_soc_dai_link_component' structure for the platform we attempt to
register the soundcard but we never clear the freed pointer on failure.
Therefore, we only actually allocate it the first time. There is no easy
way to clear this pointer for the memory allocated because this is done
before the dai-links have been added to the list of dai-links for the
soundcard.

I don't see an easy solution that will be 100% robust unless you do opt
for copying all the dai-link info from the platform (but this is
probably not a trivial fix).

Do you envision a fix any time soon, or should we be updating all the
machine drivers to populate the platform snd_soc_dai_link_component so
that it is handled by the machine drivers are not the core?

Cheers
Jon

-- 
nvpublic
