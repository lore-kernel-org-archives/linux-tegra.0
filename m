From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1 3/3] ASoC: soc-core: fix platform name vs.
 of_node assignement
Date: Tue, 8 Jan 2019 12:03:25 +0000
Message-ID: <d1e41ed2-da7c-b46c-bc6d-64cf3e536771@nvidia.com>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
 <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
 <20181021112301.GC8554@sirena.org.uk>
 <20181218174040.k7u26vnnoplllnwb@camel2.lan>
 <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
 <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
 <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: linux-tegra@vger.kernel.org


On 08/01/2019 10:50, Jon Hunter wrote:
> Hi Kuninori,
> 
> On 08/01/2019 02:25, Kuninori Morimoto wrote:
>>
>> Hi Jon
>>
>>> I have been looking at this again recently. I see this issue occurring
>>> all the time when the sound drivers are built as kernel modules and
>>> probing the sound card is deferred until the codec driver has been loaded.
>>>
>>> Commit daecf46ee0e5 ("ASoC: soc-core: use snd_soc_dai_link_component for
>>> platform") appears to introduce the problem because now we allocate the
>>> 'snd_soc_dai_link_component' structure for the platform we attempt to
>>> register the soundcard but we never clear the freed pointer on failure.
>>> Therefore, we only actually allocate it the first time. There is no easy
>>> way to clear this pointer for the memory allocated because this is done
>>> before the dai-links have been added to the list of dai-links for the
>>> soundcard.
>>>
>>> I don't see an easy solution that will be 100% robust unless you do opt
>>> for copying all the dai-link info from the platform (but this is
>>> probably not a trivial fix).
>>>
>>> Do you envision a fix any time soon, or should we be updating all the
>>> machine drivers to populate the platform snd_soc_dai_link_component so
>>> that it is handled by the machine drivers are not the core?
>>
>> Thank you for pointing it.
>> Indeed it is mess.
>> I think coping info is nice idea,
>> but it is not easy so far, and it uses much memory...
>>
>> I didn't test this, but can below patch solve your issue ?
> 
> I will give it a try and let you know.

Yes so this does workaround the problem. However, per my previous
comments, I would like to explore whether it is necessary to allocate
the platform link component or if it can be static.

Cheers
Jon

-- 
nvpublic
