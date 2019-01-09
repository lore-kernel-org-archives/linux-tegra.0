From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: core: Fix deferral of machine drivers
Date: Wed, 9 Jan 2019 10:52:52 +0000
Message-ID: <ea0f24dd-901c-5937-bb0b-b4eba4cbcbcd@nvidia.com>
References: <1546968494-22993-1-git-send-email-jonathanh@nvidia.com>
 <87imyy382r.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87imyy382r.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>, Matthias Reichl <hias@horus.com>
List-Id: linux-tegra@vger.kernel.org


On 09/01/2019 02:09, Kuninori Morimoto wrote:
> 
> Hi Jon
> 
>> Commit daecf46ee0e5 ("ASoC: soc-core: use snd_soc_dai_link_component for
>> platform") added a new member to the snd_soc_dai_link structure for
>> storing a pointer for a platform link component. The pointer for this
>> platform link component was allocated, if not already populated by the
>> machine driver, using devm_kzalloc() such that the memory would be
>> automatically freed on error or removal of the soundcard. However, this
>> introduced a new problem, because if the probing of the soundcard is
>> deferred, then although the memory allocated for the platform link
>> component is freed, if the snd_soc_dai_link structure is declared
>> statically by the machine driver, then the pointer in the DAI link
>> structure will never be clearer. This means that when the soundcard is
>> probed again, memory for the platform link component will not be
>> allocated again because the address of the pointer was not cleared
>> and this causes sound core to access memory that is no longer valid.
>>
>> In most cases this causes the following error condition to be triggered
>> and causes probing the soundcard to fail.
>>
>>  tegra-snd-sgtl5000 sound: ASoC: Both platform name/of_node are set for
>>   sgtl5000
>>
>> Unfortunately, because this platform link component is allocated before
>> the DAI links are added to the soundcard, there is no easy way to clear
>> this pointer on teardown if an error occurs.
>>
>> The pointer for this platform link component was added for future
>> proofing and communalising the structures for storing various data.
>> Although a machine driver maybe used by more than one platform and so
>> this platform data may vary from platform to platform, there is only
>> ever a single instance for a given platform. Therefore, rather than
>> dynamically allocate the platform link component structure, make it a
>> static member of the snd_soc_dai_link to fix the problem.
>>
>> It should be noted that if the platform_name of platform_of_node members
>> of the snd_soc_dai_link structure are populated, these will always be
>> used regardless of if the new platform.name or platform.of_node members
>> are populated.
>>
>> Fixes: daecf46ee0e5 ("ASoC: soc-core: use snd_soc_dai_link_component for platform")
>>
>> Reported-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
> 
> Thank you for your patch.
> The reason why it is allocating memory is it is for glue Legacy vs Modern style.
> This means, this allocation style will be removed if ALSA SoC become modern style.
> The missing part so far is CPU.
> Only CPU is not yet supporting snd_soc_dai_link_component style.
> If all CPU/Codec/Platform supports snd_soc_dai_link_component style,
> all driver can switch to it, and then, all will be static style.
> Currently, simple card series is only(?) using this style.
> 
> The reason why platform is using pointer style is that
> someone (not me ;P) will support multi platform style in the future.

Can you elaborate a bit more, I still not not understand what you mean
here by 'support multi-platform style' and why this is needed in the future?

Furthermore, even if the CPU is not supporting the
snd_soc_dai_link_component, I don't understand why this prevents us from
making this change now other than it is not consistent.

Jon

-- 
nvpublic
