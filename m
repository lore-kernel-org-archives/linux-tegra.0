From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1 3/3] ASoC: soc-core: fix platform name vs.
 of_node assignement
Date: Wed, 9 Jan 2019 11:03:44 +0000
Message-ID: <0660a471-3698-2059-4494-ad146518a4ed@nvidia.com>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
 <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
 <20181021112301.GC8554@sirena.org.uk>
 <20181218174040.k7u26vnnoplllnwb@camel2.lan>
 <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
 <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
 <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
 <d1e41ed2-da7c-b46c-bc6d-64cf3e536771@nvidia.com>
 <865d2a3e-bf6b-1f30-1179-7e922c0d0641@nvidia.com>
 <87k1je38w7.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87k1je38w7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: linux-tegra@vger.kernel.org


On 09/01/2019 01:51, Kuninori Morimoto wrote:
> 
> Hi Jon
> 
> Thank you for your help
> 
>>> Yes so this does workaround the problem. However, per my previous
>>> comments, I would like to explore whether it is necessary to allocate
>>> the platform link component or if it can be static.
> 
> OK, thanks.
> It *will* be static, but not yet.
> Thank you for your patch.
> I guess you worry about allocated memory leak when failed case ?
> It is using devm_kzalloc(), so all allocated memory will be automatically
> freed when card was detached.
> But indeed if driver gots -EPROBE_DEFER many times,
> it will allocate many unused platform.

No. Offline you had suggested using kmalloc and not devm_kzalloc and so
I was worried in that case about a memory leak. Right now I am only
concerned about an invalid pointer that is not being handled correctly.

> Here is the background of snd_soc_init_platform.
> 
> Legacy dai_link was xxx_name/xxx_of_node style,
> but multi codec support starts to use snd_soc_dai_link_component style.
> OTOH Lars-Petter is thinking that current ALSA SoC is not good match
> for modern sound device.
> I guess, we need "multi xxx" support as 1st step for modern sound device.
> "multi codec" is already supported,
> "multi cpu"   patch was posted, but not yet accepted (or rejected ??).
> "multi platform" is no plan (?).

I would like someone to explain what multi-platform means? Even if a
soundcard supports multiple platforms, there is only one platform you
are using at any time so ...

> These want to use snd_soc_dai_link_component style,
> because it is nice for multi xxx support style, I think.
> I think no one is planing for "multi platform" so far, thus,
> I posted snd_soc_dai_link_component style for it.
> # Maybe it should have num_platform, too.
> # all driver will have .num_platform = 1, thus I didn't added.
> # maybe it was my fault...

... I don't understand why you would ever need a 'num_platform' as the
machine driver just needs to understand which platform is using it at
any given time. Right?

> The reason why platform/codec is allocating/copying by snd_soc_init_xxx
> so far is that it is glue for
> xxx_name/xxx_of_node (legacy style) <-> snd_soc_init_platform (modern style).
> 
> I want to which to modern style immediately and remove legacy style.
> But as you know, we have too many ALSA SoC drivers now.
> So, if I posted "switch legacy style to modern style" patch
> for each (= for codec, for platform, for cpu), it will be patch-bomb,
> and Lars-Petter/Mark don't like it.
> Thus, I'm waiting "multi CPU" support patch.

Sorry, I still don't understand the dependency on the multi CPU and why
we need to wait.

> If CPU/Codec/Platform can be snd_soc_init_platform style,
> then, we can switch to modern style for all drivers.
> Then, all driver will have *static* platform.
> 
> # So, I guess if your driver can switch to use
> # snd_soc_init_platform style directly, your problem can gone ?

Yes that is an alternative and I can convert all the Tegra machine
drivers to use this now. However, that will not solve the problem for
non-Tegra devices and everyone will have to do this.

Cheers
Jon

-- 
nvpublic
