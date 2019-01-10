From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1 3/3] ASoC: soc-core: fix platform name vs.
 of_node assignement
Date: Thu, 10 Jan 2019 10:56:35 +0000
Message-ID: <a2068291-e554-cc4f-9af9-0022f3c4de34@nvidia.com>
References: <20181218174040.k7u26vnnoplllnwb@camel2.lan>
 <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
 <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
 <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
 <d1e41ed2-da7c-b46c-bc6d-64cf3e536771@nvidia.com>
 <865d2a3e-bf6b-1f30-1179-7e922c0d0641@nvidia.com>
 <87k1je38w7.wl-kuninori.morimoto.gx@renesas.com>
 <0660a471-3698-2059-4494-ad146518a4ed@nvidia.com>
 <20190109125340.GD10405@sirena.org.uk>
 <52f5f2cf-9260-f9c5-f73d-3c3d5debc86b@nvidia.com>
 <20190109141439.GE10405@sirena.org.uk>
 <875zuxb9uy.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <875zuxb9uy.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: linux-tegra@vger.kernel.org


On 10/01/2019 01:16, Kuninori Morimoto wrote:

...

> As I mentioned above, I think we have same issue on codec side too.

Actually no. Looking at snd_soc_init_multicodec() it always allocates
memory if any of the 'legacy' codec members
(codec_name/codec_of_node/codec_dai_name) are populated. However, this
looks quite fragile to me and is susceptible to leaking memory if the
user/machine driver already incorrectly allocated the memory as well as
populating these legacy codec members.

My concern about all of this is it is not fool proof and hard to detect
if a machine driver is doing something bad that it should not.

> exchanging *platform to platform doesn't solve all issues.
> And we need to exchange all driver again if we had multi-platform
> support in the future (I don't know when it can happen though...)
> 
> My posted quick-patch can solve "dirty pointer" issue,
> but it can't solve "memory leak" issue.
> This issue will be solved if all driver can switch to
> modern style, but it needs more time.
> Are these correct ?
> 
> So, how about this ?

It is still fragile. Again the machine driver could have incorrectly set
these 'allocated_platform/codecs' members as they are exposed to the
machine driver. You have no way to determine if the machine driver is
doing the correct thing or not. The problem becomes more complex with
probe deferral.

Cheers
Jon

-- 
nvpublic
